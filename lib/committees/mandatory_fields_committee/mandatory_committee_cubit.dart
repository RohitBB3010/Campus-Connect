import 'package:campus_connecy/committees/mandatory_fields_committee/mandatory_committee_state.dart';
import 'package:campus_connecy/constants/fb_consts.dart';
import 'package:campus_connecy/models/committee.dart';
import 'package:campus_connecy/user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> committeeCode() async {
    String? code = await UserPreferences().getCode();
    emit((state as MandatoryCommitteeFillingState)
        .copyWith(committeeCode: code));
  }

  Future<void> addMember() async {
    CommitteeMember member = CommitteeMember(
      memberName: (state as MandatoryCommitteeFillingState).memberName,
      memberEmail: (state as MandatoryCommitteeFillingState).memberEmail,
      memberPhone: (state as MandatoryCommitteeFillingState).memberPhone,
      memberRole: (state as MandatoryCommitteeFillingState).memberRole,
    );

    FirebaseFirestore.instance
        .collection(CommitteeConsts.collCommittee)
        .doc((state as MandatoryCommitteeFillingState).committeeCode)
        .update({
      CommitteeConsts.fieldMembers: FieldValue.arrayUnion([member.toJson()])
    });
  }

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
