import 'package:bloc/bloc.dart';
import 'package:campus_connecy/auth/committee_auth/committee_auth_state.dart';

class CommitteeAuthCubit extends Cubit<CommitteeAuthState> {
  CommitteeAuthCubit() : super(CommitteeUnAuthenticatedState());
}
