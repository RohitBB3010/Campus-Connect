import 'package:campus_connecy/constants/fb_consts.dart';
import 'package:campus_connecy/models/committee.dart';
import 'package:campus_connecy/models/student.dart';
import 'package:campus_connecy/students/mandatory_fields_students/student_mandatory_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentMandatoryCubit extends Cubit<StudentMandatoryState> {
  StudentMandatoryCubit()
      : super(StudentMandatoryFillingState(
          name: '',
          email: '',
          phoneNumber: '',
          committeesSubscribed: [],
          committeesList: [],
        ));

  void emitUserEmail() {
    String? emailValue = FirebaseAuth.instance.currentUser != null
        ? FirebaseAuth.instance.currentUser!.email
        : '';
    emit((state as StudentMandatoryFillingState).copyWith(email: emailValue));
  }

  Future<void> updateUserDocument() async {
    List<dynamic> subList = [];

    if ((state as StudentMandatoryFillingState).committeesList != null &&
        (state as StudentMandatoryFillingState).committeesSubscribed != null) {
      for (int i = 0;
          i <
              (state as StudentMandatoryFillingState)
                  .committeesSubscribed!
                  .length;
          i++) {
        Committee comm = (state as StudentMandatoryFillingState)
            .committeesList!
            .firstWhere((item) =>
                item.name ==
                (state as StudentMandatoryFillingState)
                    .committeesList![i]
                    .name);

        CommitteesSubscribed subs = CommitteesSubscribed(
            committeeName: comm.name, dateSubscribed: DateTime.now());

        subList.add(subs.toJson());
      }
    }

    var document = await FirebaseFirestore.instance
        .collection(StudentFBConsts.collUsers)
        .where(StudentFBConsts.fieldEmail,
            isEqualTo: (state as StudentMandatoryFillingState).email)
        .get();

    if (document.docs.isNotEmpty) {
      String id = document.docs.first.id;
      debugPrint(id);

      await FirebaseFirestore.instance
          .collection(StudentFBConsts.collUsers)
          .doc(id)
          .update({
        StudentFBConsts.fieldEmail:
            (state as StudentMandatoryFillingState).email,
        StudentFBConsts.fieldName: (state as StudentMandatoryFillingState).name,
        StudentFBConsts.fieldPhone:
            (state as StudentMandatoryFillingState).phoneNumber,
        StudentFBConsts.fieldCommittees: subList
      });
    }

    emit(StudentMandatoryFilledState());
  }

  void getCommittees() async {
    List<Committee> committeList = [];

    var document = await FirebaseFirestore.instance
        .collection('back-end_data')
        .doc('committee_codes')
        .get();

    Map<String, dynamic>? documentData = document.data();

    documentData?.values.forEach((committeeJson) {
      Committee current = Committee.fromJson(committeeJson);
      committeList.add(current);
    });

    emit((state as StudentMandatoryFillingState)
        .copyWith(committeesList: committeList));
  }

  void nameChanged(String value) {
    emit((state as StudentMandatoryFillingState).copyWith(name: value));
  }

  void phoneNumberChanged(String value) {
    emit((state as StudentMandatoryFillingState).copyWith(phoneNumber: value));
  }

  void emailChanged(String value) {
    emit((state as StudentMandatoryFillingState).copyWith(email: value));
  }

  void listUpdated(List<String> newList) {
    List<String?> list = [];

    for (int i = 0; i < newList.length; i++) {
      String? comm = (state as StudentMandatoryFillingState)
          .committeesList!
          .singleWhere((committee) => committee.name == newList[i])
          .code;
      list.add(comm);
    }

    emit((state as StudentMandatoryFillingState)
        .copyWith(committeesSubscribed: list));
  }
}
