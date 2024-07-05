import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/auth/select_page.dart';
import 'package:campus_connecy/auth/sign_up_page.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/components/text_button.dart';
import 'package:campus_connecy/components/text_field.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentLoginPage extends StatelessWidget {
  const StudentLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthSkeleton(
      bodyContent: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthUnAuthenticatedState) {
            return Column(
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
                  if (state.email != null) {
                    bool exists = await context
                        .read<AuthCubit>()
                        .checkUserExists(state.email!);

                    if (!exists) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          buildSnackbar(AuthStrings().accountDoesNotExist));
                    }
                  }
                }, 0.8, 0.07),
                SpacingConsts().smallHeightBetweenFields(context),
                CustomTextButton(
                    buttonWidth: 0.8,
                    buttonText: AuthStrings().studentSignUp,
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
            );
          }

          return Container();
        },
      ),
    );
  }

  SnackBar buildSnackbar(String snackBarText) {
    return SnackBar(
      content: Center(
        child: AutoSizeText(
          snackBarText,
          style: TextStyle(fontSize: 20.0, color: primary1),
        ),
      ),
      backgroundColor: accent3,
      elevation: 20.0,
      behavior: SnackBarBehavior.floating,
    );
  }
}
