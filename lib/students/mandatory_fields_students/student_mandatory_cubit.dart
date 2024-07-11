import 'package:campus_connecy/models/committee.dart';
import 'package:campus_connecy/students/mandatory_fields_students/student_mandatory_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentMandatoryCubit extends Cubit<StudentMandatoryState> {
  StudentMandatoryCubit() : super(StudentMandatoryState());

  void emitUserEmail() {
    String? emailValue = FirebaseAuth.instance.currentUser != null
        ? FirebaseAuth.instance.currentUser!.email
        : '';
    emit(state.copyWith(email: emailValue));
  }

  void getCommitteesList() async {
    List<CommitteeList> committeList = [];

    var document = await FirebaseFirestore.instance
        .collection('back-end_data')
        .doc('committee_codes')
        .get();

    Map<String, dynamic>? documentData = document.data();

    documentData?.values.forEach((committeeJson) {
      CommitteeList current = CommitteeList.fromJson(committeeJson);
      committeList.add(current);
    });

    emit(state.copyWith(committeesList: committeList));
  }

  void nameChanged(String value) {
    emit(state.copyWith(name: value));
  }

  void phoneNumberChanged(String value) {
    emit(state.copyWith(phoneNumber: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void listUpdated(List<String> newList) {
    List<String> list = [];

    for (int i = 0; i < newList.length; i++) {
      String comm = state.committeesList!
          .singleWhere((committee) => committee.name == newList[i])
          .code;
      list.add(comm);
    }

    emit(state.copyWith(committeesSubscribed: list));
  }
}
