import 'dart:math';

import 'package:campus_connecy/committees/mandatory_fields_committee/mandatory_committee_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandatoryCommitteeCubit extends Cubit<MandatoryCommitteeState> {
  MandatoryCommitteeCubit() : super(MandatoryCommitteeFillingState());

  void emitStateEmail() {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      emit((state as MandatoryCommitteeFillingState)
          .copyWith(memberEmail: currentUser.email));
    }
  }

  Future<void> addMember(String code) async {}

  void nameChanged(String value) {
    emit((state as MandatoryCommitteeFillingState).copyWith(memberName: value));
  }

  void emailChanged(String value) {
    emit(
        (state as MandatoryCommitteeFillingState).copyWith(memberEmail: value));
  }

  void phoneChanged(String value) {
    emit(
        (state as MandatoryCommitteeFillingState).copyWith(memberPhone: value));
  }

  void roleChanged(String value) {
    emit((state as MandatoryCommitteeFillingState).copyWith(memberRole: value));
  }
}
