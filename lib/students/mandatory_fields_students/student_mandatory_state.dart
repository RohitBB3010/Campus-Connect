import 'package:campus_connecy/models/committee.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'student_mandatory_state.g.dart';

abstract class StudentMandatoryState {}

@CopyWith()
class StudentMandatoryFillingState extends StudentMandatoryState {
  String? name;
  String? email;
  String? phoneNumber;
  List<String>? committeesSubscribed;
  List<CommitteeList>? committeesList;

  StudentMandatoryFillingState(
      {this.name,
      this.email,
      this.committeesSubscribed,
      this.phoneNumber,
      this.committeesList});
}

class StudentMandatoryFilledState extends StudentMandatoryState {}
