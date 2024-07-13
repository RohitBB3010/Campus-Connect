import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/auth/select_page.dart';
import 'package:campus_connecy/auth/verify_email.dart';
import 'package:campus_connecy/committees/committee_page.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
import 'package:campus_connecy/components/build_snackbar.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/components/text_button.dart';
import 'package:campus_connecy/components/text_field.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:campus_connecy/students/student_page.dart';
import 'package:campus_connecy/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.committeeCode});
  String? committeeCode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthUnAuthenticatedState) {
          final authCubit = context.read<AuthCubit>();
          bool isStudent;

          return AuthSkeleton(
              bodyContent: Column(
            children: [
              SpacingConsts().mediumHeightBetweenFields(context),
              AutoSizeText(
                AuthStrings().signIn,
                maxLines: 1,
                style: const TextStyle(fontSize: 40.0),
              ),
              SpacingConsts().largeHeightBetweenFields(context),
              CustomTextField(
                fieldWidth: 0.8,
                hintText: AuthStrings().enterEmail,
                onChanged: context.read<AuthCubit>().emailChanged,
              ),
              SpacingConsts().mediumHeightBetweenFields(context),
              CustomTextField(
                  fieldWidth: 0.8,
                  hintText: AuthStrings().enterPassword,
                  onChanged: context.read<AuthCubit>().paswordChanged),
              SpacingConsts().largeHeightBetweenFields(context),
              CustomButton(context, AuthStrings().signIn, accent3, () async {
                if (state.email == null || state.password == null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(buildSnackbar(AuthStrings().fillFields));
                } else {
                  if (state.isStudent != null && state.isStudent!) {
                    bool exists =
                        await authCubit.checkStudentExists(state.email!);

                    if (!exists) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          buildSnackbar(AuthStrings().accountDoesNotExist));
                    } else {
                      authCubit.signIn(state.email!, state.password!);
                    }
                  } else {
                    bool? isMember = await authCubit.verifyIsMember(
                        state.email!, committeeCode!);

                    if (isMember != null && !isMember) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          buildSnackbar(AuthStrings().notAMember));
                    }
                  }
                }
              }, 0.8, 0.07),
              SpacingConsts().smallHeightBetweenFields(context),
              CustomTextButton(
                  buttonWidth: 0.8,
                  buttonText: context.read<AuthCubit>().isClosed
                      ? AuthStrings().studentSignUp
                      : AuthStrings().memberSignUp,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                        (Route<dynamic> routes) => false);
                  }),
              SpacingConsts().smallHeightBetweenFields(context),
              CustomTextButton(
                  buttonWidth: 0.8,
                  buttonText: AuthStrings().returnToSelectPage,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const SelectPage()),
                        (Route<dynamic> route) => false);
                  })
            ],
          ));
        }

        if (state is AuthAuthenticatedState) {
          if (state.isStudent != null && state.isStudent!) {
            return const StudentHome();
          } else {
            return const CommitteePage();
          }
        }

        return Container();
      },
    );
  }
}
