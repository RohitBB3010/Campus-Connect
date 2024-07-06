import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/auth/select_page.dart';
import 'package:campus_connecy/auth/set_password_page.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
import 'package:campus_connecy/components/build_snackbar.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/components/text_button.dart';
import 'package:campus_connecy/components/text_field.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                  AuthStrings().verifyEmail,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 40.0),
                ),
                SpacingConsts().mediumHeightBetweenFields(context),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: AutoSizeText(
                    AuthStrings().verifyNote,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
                SpacingConsts().mediumHeightBetweenFields(context),
                CustomTextField(
                    fieldWidth: 0.8,
                    hintText: AuthStrings().enterEmail,
                    onChanged: context.read<AuthCubit>().emailChanged),
                SpacingConsts().mediumHeightBetweenFields(context),
                CustomButton(context, AuthStrings().verifyEmail, accent3,
                    () async {
                  String? returnMessage;

                  if (state.email == null || state.email!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        buildSnackbar(AuthStrings().verifyEnterEmail));
                  } else {
                    returnMessage = await context
                        .read<AuthCubit>()
                        .verifyUser(state.email!);

                    ScaffoldMessenger.of(context)
                        .showSnackBar(buildSnackbar(returnMessage));
                  }

                  if (returnMessage == "Verification email sent") {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => SetPasswordPage()),
                        (Route<dynamic> routes) => false);
                  }
                }, 0.8, 0.07),
                SpacingConsts().smallHeightBetweenFields(context),
                CustomTextButton(
                    buttonWidth: 0.8,
                    buttonText: AuthStrings().returnToSelectPage,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectPage()),
                          (Route<dynamic> routes) => false);
                    })
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
