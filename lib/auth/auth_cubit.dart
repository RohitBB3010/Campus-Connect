import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/constants/fb_consts.dart';
import 'package:campus_connecy/models/committee.dart';
import 'package:campus_connecy/models/student.dart';
import 'package:campus_connecy/user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState()) {
    initialize();
  }

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isStudent = prefs.getBool("isStudent");
    User? currentUser = FirebaseAuth.instance.currentUser;
    List<Committee> committeeList = await getBackendData();

    debugPrint((currentUser == null).toString());
    if (currentUser != null) {
      emit(AuthAuthenticatedState(isStudent: isStudent));
    } else {
      emit(AuthUnAuthenticatedState()
          .copyWith(availableCommittes: committeeList, isStudent: isStudent));
    }
  }

  void checkSignIn() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      emit(AuthAuthenticatedState());
    }
  }

  Future<List<Committee>> getBackendData() async {
    List<Committee> committeList = [];
    var document = await FirebaseFirestore.instance
        .collection('back-end_data')
        .doc('committee_codes')
        .get();

    Map<String, dynamic>? documentData = document.data();

    if (documentData != null) {
      documentData.forEach((key, value) {
        Committee current = Committee.fromJson(value);
        committeList.add(current);
      });
    }

    return committeList;
  }

  Future<bool> checkAccountExists(String email) async {
    var studentDocuments = await FirebaseFirestore.instance
        .collection(StudentFBConsts.collUsers)
        .where(StudentFBConsts.fieldEmail, isEqualTo: email)
        .limit(1)
        .get();

    return studentDocuments.docs.isNotEmpty;
  }

  Future<bool?> verifyIsMember(String email, String committeeCode) async {
    String code = committeeCode;

    var document = await FirebaseFirestore.instance
        .collection(CommitteeConsts.collCommittee)
        .doc(code)
        .get();

    if (document.data() == null) {
      return false;
    } else {
      List<CommitteeMember>? members =
          Committee.fromJson(document.data()!).members;

      if (members == null) {
        return false;
      } else {
        bool isMember = members.any((member) => member.memberEmail == email);
        return isMember;
      }
    }
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

  void signInMember() async {
    bool isStudent = await UserPreferences().getUserType();
    emit(AuthAuthenticatedState(isStudent: isStudent));
  }

  Future<String?> setPassword(String password) async {
    User? user = await FirebaseAuth.instance.currentUser;

    if (user == null) {
      return "User not found";
    }

    await user.reload();

    user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 1));

    if (!user!.emailVerified) {
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

      bool isStudent = await UserPreferences().getUserType();
      emit(AuthAuthenticatedState(isStudent: isStudent));
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

  void signOut(VoidCallback? onSignOut) async {
    FirebaseAuth.instance.signOut();
    emit(AuthUnAuthenticatedState());
    if (onSignOut != null) {
      onSignOut();
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
