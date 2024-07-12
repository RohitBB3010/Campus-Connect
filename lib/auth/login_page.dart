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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, this.committeeCode});
  String? committeeCode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthUnAuthenticatedState) {
          final authCubit = context.read<AuthCubit>();

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
                  if (authCubit.isStudent != null && authCubit.isStudent!) {
                    bool exists =
                        await authCubit.checkStudentExists(state.email!);

                    if (!exists) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          buildSnackbar(AuthStrings().accountDoesNotExist));
                    } else {
                      authCubit.signIn(state.email!, state.password!);
                    }
                  }
                }
              }, 0.8, 0.07),
              SpacingConsts().smallHeightBetweenFields(context),
              CustomTextButton(
                  buttonWidth: 0.8,
                  buttonText: context.read<AuthCubit>().getIsStudent()!
                      ? AuthStrings().studentSignUp
                      : AuthStrings().memberSignUp,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                        (Route<dynamic> routes) => false);
                  }),
              SpacingConsts().smallHeightBetweenFields(context),
              CustomTextButton(
                  buttonWidth: 0.8,
                  buttonText: AuthStrings().returnToSelectPage,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => SelectPage()),
                        (Route<dynamic> route) => false);
                  })
            ],
          ));
        }

        if (state is AuthAuthenticatedState) {
          if (context.read<AuthCubit>().isStudent ?? true) {
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

// if (context.read<AuthCubit>().isStudent != null &&
//                     context.read<AuthCubit>().isStudent!) {
//                   if (state.email != null) {
//                     bool exists = await context
//                         .read<AuthCubit>()
//                         .checkUserExists(state.email!);

//                     if (!exists) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                           buildSnackbar(AuthStrings().accountDoesNotExist));
//                     }

//                     context
//                         .read<AuthCubit>()
//                         .signIn(state.email!, state.password!);
//                   }
//                 }

//                 if (context.read<AuthCubit>().isStudent != null &&
//                     !context.read<AuthCubit>().isStudent!) {}