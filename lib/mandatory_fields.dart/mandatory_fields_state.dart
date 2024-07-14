import 'package:campus_connecy/models/committee.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'mandatory_fields_state.g.dart';

class MandatoryFieldsState {}

@CopyWith()
class MandatoryFieldsFillingState extends MandatoryFieldsState {
  String? name;
  String? email;
  String? phone;
  String? role;
  List<String?>? committeesSubscribed;
  List<Committee>? committeesList;
  bool? isStudent;

  MandatoryFieldsFillingState(
      {this.name,
      this.email,
      this.phone,
      this.role,
      this.committeesSubscribed,
      this.committeesList,
      this.isStudent});
}

class MandatoryFieldsFilledState extends MandatoryFieldsState {
  bool isStudent;

  MandatoryFieldsFilledState({required this.isStudent});
}

@CopyWith()
class MandatoryNewMemberState extends MandatoryFieldsState {
  bool isStudent;
  String? role;
  List<Committee>? committeeList;

  MandatoryNewMemberState(
      {required this.isStudent, this.role, this.committeeList});
}
