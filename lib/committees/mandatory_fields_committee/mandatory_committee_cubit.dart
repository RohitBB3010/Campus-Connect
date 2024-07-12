import 'dart:math';

import 'package:campus_connecy/committees/mandatory_fields_committee/mandatory_committee_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandatoryCommitteeCubit extends Cubit<MandatoryCommitteeState> {
  MandatoryCommitteeCubit() : super(MandatoryCommitteeFillingState());

  void nameChanged(String value) {
    emit((state as MandatoryCommitteeFillingState).copyWith(memberName: value));
  }

  void emailChanged(String value) {
    emit(
        (state as MandatoryCommitteeFillingState).copyWith(memberEmail: value));
  }

  void roleChanged(String value) {
    emit((state as MandatoryCommitteeFillingState).copyWith(memberRole: value));
  }
}
