import 'package:copy_with_extension/copy_with_extension.dart';

part 'mandatory_committee_state.g.dart';

abstract class MandatoryCommitteeState {}

@CopyWith()
class MandatoryCommitteeFillingState extends MandatoryCommitteeState {
  String? memberName;
  String? memberEmail;
  String? memberPhone;
  String? memberRole;
  DateTime? joiningDate;
  String? committeeCode;

  MandatoryCommitteeFillingState({
    this.memberName,
    this.memberEmail,
    this.memberRole,
    this.memberPhone,
    this.joiningDate,
    this.committeeCode,
  });
}

class MandatoryCommitteeFilledState extends MandatoryCommitteeState {}
