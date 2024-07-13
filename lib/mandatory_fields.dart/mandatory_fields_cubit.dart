import 'package:campus_connecy/constants/fb_consts.dart';
import 'package:campus_connecy/mandatory_fields.dart/mandatory_fields_state.dart';
import 'package:campus_connecy/models/committee.dart';
import 'package:campus_connecy/models/student.dart';
import 'package:campus_connecy/user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandatoryFieldsCubit extends Cubit<MandatoryFieldsState> {
  MandatoryFieldsCubit() : super(MandatoryFieldsFillingState());

  String? getUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return user.email;
    }
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

    emit((state as MandatoryFieldsFillingState)
        .copyWith(committeesList: committeList));
  }

  Future<void> registerUser() async {
    List<dynamic> commSubsList = [];

    if ((state as MandatoryFieldsFillingState).committeesList != null &&
        (state as MandatoryFieldsFillingState).committeesSubscribed != null) {
      for (int i = 0;
          i <
              (state as MandatoryFieldsFillingState)
                  .committeesSubscribed!
                  .length;
          i++) {
        Committee comm = (state as MandatoryFieldsFillingState)
            .committeesList!
            .firstWhere((comm) =>
                comm.name ==
                (state as MandatoryFieldsFillingState)
                    .committeesSubscribed![i]);

        CommitteesSubscribed commSubs = CommitteesSubscribed(
            committeeName: comm.name, dateSubscribed: DateTime.now());

        commSubsList.add(commSubs.toJson());
      }
    }

    var document = await FirebaseFirestore.instance
        .collection(StudentFBConsts.collUsers)
        .where(StudentFBConsts.fieldEmail,
            isEqualTo: (state as MandatoryFieldsFillingState).email)
        .limit(1)
        .get();

    if (document.docs.isNotEmpty) {
      String id = document.docs.first.id;

      FirebaseFirestore.instance
          .collection(StudentFBConsts.collUsers)
          .doc(id)
          .update({
        StudentFBConsts.fieldName: (state as MandatoryFieldsFillingState).name,
        StudentFBConsts.fieldEmail:
            (state as MandatoryFieldsFillingState).email,
        StudentFBConsts.fieldPhone:
            (state as MandatoryFieldsFillingState).phone,
        StudentFBConsts.fieldCommittees: commSubsList
      });

      bool isStudent = await UserPreferences().getUserType();
      emit(MandatoryFieldsFilledState(isStudent: isStudent));
    }
  }

  void listUpdated(List<String> newList) {
    List<String?> list = [];

    for (int i = 0; i < newList.length; i++) {
      String? comm = (state as MandatoryFieldsFillingState)
          .committeesList!
          .singleWhere((committee) => committee.name == newList[i])
          .name;
      list.add(comm);
    }

    emit((state as MandatoryFieldsFillingState)
        .copyWith(committeesSubscribed: list));
  }

  void nameChanged(String value) {
    emit((state as MandatoryFieldsFillingState).copyWith(name: value));
  }

  void emailChanged(String value) {
    emit((state as MandatoryFieldsFillingState).copyWith(email: value));
  }

  void phoneChanged(String value) {
    emit((state as MandatoryFieldsFillingState).copyWith(phone: value));
  }

  void roleChanged(String value) {
    emit((state as MandatoryFieldsFillingState).copyWith(role: value));
  }
}
