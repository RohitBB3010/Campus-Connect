import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/auth/select_page.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
import 'package:campus_connecy/components/build_snackbar.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/components/text_button.dart';
import 'package:campus_connecy/components/text_field.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:campus_connecy/mandatory_fields.dart/mandatory_fields_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      final authCubit = context.read<AuthCubit>();
      final String committeeCode;

      if (state is AuthUnAuthenticatedState) {
        return AuthSkeleton(
          bodyContent: Column(
            children: [
              SpacingConsts().largeHeightBetweenFields(context),
              AutoSizeText(
                AuthStrings().setPasswordText,
                maxLines: 1,
                style: TextStyle(fontSize: 25.0),
              ),
              SpacingConsts().mediumHeightBetweenFields(context),
              CustomTextField(
                  fieldWidth: 0.8,
                  hintText: AuthStrings().setPassword,
                  onChanged: authCubit.paswordChanged),
              SpacingConsts().mediumHeightBetweenFields(context),
              CustomTextField(
                  fieldWidth: 0.8,
                  hintText: AuthStrings().confirmPassword,
                  onChanged: authCubit.confirmPasswordChanged),
              SpacingConsts().largeHeightBetweenFields(context),
              CustomButton(context, AuthStrings().setPassword, accent3,
                  () async {
                if (state.password == null || state.confirmPassword == null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(buildSnackbar(AuthStrings().fillFields));
                }

                if (state.password != state.confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      buildSnackbar(AuthStrings().passwordsMismatch));
                }

                if (state.password != null && state.confirmPassword != null) {
                  String? returnMessage =
                      await authCubit.setPassword(state.password!);

                  ScaffoldMessenger.of(context)
                      .showSnackBar(buildSnackbar(returnMessage!));
                } else {
                  authCubit.signInMember();
                }
              }, 0.8, 0.08),
              SpacingConsts().mediumHeightBetweenFields(context),
              CustomTextButton(
                  buttonWidth: 0.8,
                  buttonText: AuthStrings().returnToSelectPage,
                  onPressed: () async {
                    context.read<AuthCubit>().deleteUser();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const SelectPage()),
                        (Route<dynamic> routes) => false);
                  })
            ],
          ),
        );
      }

      if (state is AuthAuthenticatedState) {
        return MandatoryFieldsPage();
      }

      return Container();
    });
  }
}
