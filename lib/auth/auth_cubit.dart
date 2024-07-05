import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/models/committee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthUnAuthenticatedState());

  void getCommitteesList() async {
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

    print(committeList);
    emit(
      (state as AuthUnAuthenticatedState)
          .copyWith(availableCommittes: committeList),
    );
  }

  void committeeChanged(Committee committee) {
    emit(
      (state as AuthUnAuthenticatedState)
          .copyWith(selectedCommittee: committee),
    );
  }

  void codeChanged(String code) {
    emit((state as AuthUnAuthenticatedState).copyWith(committeeCode: code));
  }

  void resetSelectedCommitteeAndCode() {
    emit((state as AuthUnAuthenticatedState)
        .copyWith(selectedCommittee: null, committeeCode: null));
  }

  void emailChanged(String value) {
    emit((state as AuthUnAuthenticatedState).copyWith(email: value));
  }

  void paswordChanged(String value) {
    emit((state as AuthUnAuthenticatedState).copyWith(password: value));
  }

  void confirmPasswordChanged(String value) {
    emit((state as AuthUnAuthenticatedState).copyWith(confirmPassword: value));
  }
}
