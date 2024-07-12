import 'package:campus_connecy/models/committee.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'auth_state.g.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthAuthenticatedState extends AuthState {}

@CopyWith()
class AuthUnAuthenticatedState extends AuthState {
  String? email;
  String? password;
  String? confirmPassword;
  Committee? selectedCommittee;
  String? committeeCode;
  List<Committee>? availableCommittes;

  AuthUnAuthenticatedState(
      {this.email,
      this.password,
      this.confirmPassword,
      this.selectedCommittee,
      this.committeeCode,
      this.availableCommittes});

  @override
  List<Object?> get props => [
        email,
        password,
        confirmPassword,
        selectedCommittee,
        committeeCode,
        availableCommittes
      ];
}
