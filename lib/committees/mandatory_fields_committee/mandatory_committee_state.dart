import 'package:copy_with_extension/copy_with_extension.dart';

part 'mandatory_committee_state.g.dart';

abstract class MandatoryCommitteeState {}

@CopyWith()
class MandatoryCommitteeFillingState extends MandatoryCommitteeState {
  String? memberName;
  String? memberEmail;
  String? memberRole;
  DateTime? joiningDate;

  MandatoryCommitteeFillingState(
      {this.memberName, this.memberEmail, this.memberRole, this.joiningDate});
}

class MandatoryCommitteeFilledState extends MandatoryCommitteeState {}
