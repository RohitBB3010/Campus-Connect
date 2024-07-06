import 'dart:ffi';

import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/models/committee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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

    emit(
      (state as AuthUnAuthenticatedState)
          .copyWith(availableCommittes: committeList),
    );
  }

  Future<bool> checkUserExists(String email) async {
    var studentDocuments = await FirebaseFirestore.instance
        .collection('Students')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    return studentDocuments.docs.isNotEmpty;
  }

  Future<String> verifyUser(String email) async {
    String returnMessage = "";
    try {
      UserCredential userCreds = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email, password: 'tempPassword');

      User? user = userCreds.user;

      if (user != null) {
        user.sendEmailVerification();
        returnMessage = "Verification email sent";
      }
    } catch (error) {
      returnMessage = error.toString();
    }

    return returnMessage;
  }

  Future<String?> setPassword(String password) async {
    User? user = await FirebaseAuth.instance.currentUser;

    if (user == null) {
      return "User not found";
    }

    await user.reload();

    debugPrint(user.emailVerified.toString());

    if (!user.emailVerified) {
      return "Email Not Verified";
    }

    if (user.emailVerified) {
      user.updatePassword(password);
      return "Password updated Successfully";
    }
  }

  Future<void> deleteUser() async {
    User? user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      user.delete();
      debugPrint('User deleted');
    }
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
