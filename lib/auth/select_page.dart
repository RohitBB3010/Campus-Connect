import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/auth/committee_code_page.dart';
import 'package:campus_connecy/auth/student_login_page.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthSkeleton(
      bodyContent: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthUnAuthenticatedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SpacingConsts().mediumHeightBetweenFields(context),
                const AutoSizeText(
                  "Connecting Committees",
                  maxLines: 1,
                  style: TextStyle(
                    //fontFamily: "Futura",
                    fontSize: 40.0,
                  ),
                ),
                const AutoSizeText(
                  "Uniting Campuses",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
                SpacingConsts().customHeightBetweenFields(context, 0.03),
                CustomButton(context, AuthStrings().committeeAuth, accent3, () {
                  context.read<AuthCubit>().resetSelectedCommitteeAndCode();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const CommitteeCodePage()),
                    (Route<dynamic> route) => false,
                  );
                }, 0.6, 0.08),
                SpacingConsts().smallHeightBetweenFields(context),
                const AutoSizeText(
                  'Or',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                SpacingConsts().smallHeightBetweenFields(context),
                CustomButton(context, AuthStrings().studentAuth, primary1, () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const StudentLoginPage()),
                    (Route<dynamic> route) => false,
                  );
                }, 0.6, 0.08),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
