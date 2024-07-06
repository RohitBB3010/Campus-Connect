import 'package:campus_connecy/models/committee.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'auth_state.g.dart';

class AuthState {}

class AuthAuthenticatedState extends AuthState {
  bool? isStudent;

  AuthAuthenticatedState({this.isStudent});
}

@CopyWith()
class AuthUnAuthenticatedState extends AuthState {
  String? email;
  String? password;
  String? confirmPassword;
  bool? isStudent;
  Committee? selectedCommittee;
  String? committeeCode;
  List<Committee>? availableCommittes;

  AuthUnAuthenticatedState(
      {this.email,
      this.password,
      this.confirmPassword,
      this.isStudent,
      this.selectedCommittee,
      this.committeeCode,
      this.availableCommittes});

  @override
  List<Object?> get props => [
        email,
        password,
        confirmPassword,
        isStudent,
        selectedCommittee,
        committeeCode,
        availableCommittes
      ];
}
