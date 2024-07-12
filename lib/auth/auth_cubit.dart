import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/models/committee.dart';
import 'package:campus_connecy/models/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState()) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      emit(AuthAuthenticatedState());
    } else {
      emit(AuthUnAuthenticatedState());
    }
  }

  void getCurrentState() {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      emit(AuthAuthenticatedState());
    } else {
      emit(AuthUnAuthenticatedState());
    }
  }

  bool? isStudent;

  bool? getIsStudent() {
    return isStudent;
  }

  void setIsStudent(bool setValue) {
    isStudent = setValue;
  }

  void checkSignIn() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      emit(AuthAuthenticatedState());
    }
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

    emit(
      (state as AuthUnAuthenticatedState)
          .copyWith(availableCommittes: committeList),
    );
  }

  Future<bool> checkUserExists(String email) async {
    var studentDocuments = await FirebaseFirestore.instance
        .collection('Users')
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

    try {
      user.updatePassword(password);
      await addUserDoc((state as AuthUnAuthenticatedState).email!);

      emit(AuthAuthenticatedState());
      return "Password set Successfully";
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> addUserDoc(String studentEmail) async {
    Student student = Student(email: studentEmail);

    FirebaseFirestore.instance.collection('Users').add(student.toJson());
  }

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      bool isStudentData = true;

      emit(AuthAuthenticatedState());
      debugPrint("Emitted AuthAuthenticatedState");
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void deleteUser() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      user.delete();
      debugPrint('User deleted');
    }
  }

  void signOut() async {
    FirebaseAuth.instance.signOut();
    emit(AuthUnAuthenticatedState());
  }

  void committeeChanged(CommitteeList committee) {
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
