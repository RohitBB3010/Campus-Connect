import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/select_page.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
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
      bodyContent: Column(
        children: [
          SpacingConsts().mediumHeightBetweenFields(context),
          AutoSizeText(
            AuthStrings().signUp,
            maxLines: 1,
            style: const TextStyle(fontSize: 40.0),
          ),
          SpacingConsts().mediumHeightBetweenFields(context),
          CustomTextField(
              fieldWidth: 0.8,
              hintText: AuthStrings().enterEmail,
              onChanged: context.read<AuthCubit>().emailChanged),
          SpacingConsts().smallHeightBetweenFields(context),
          CustomTextField(
              fieldWidth: 0.8,
              hintText: AuthStrings().setPassword,
              onChanged: context.read<AuthCubit>().paswordChanged),
          SpacingConsts().smallHeightBetweenFields(context),
          CustomTextField(
              fieldWidth: 0.8,
              hintText: AuthStrings().confirmPassword,
              onChanged: context.read<AuthCubit>().confirmPasswordChanged),
          SpacingConsts().mediumHeightBetweenFields(context),
          CustomButton(
              context, AuthStrings().signUp, accent3, () {}, 0.8, 0.07),
          SpacingConsts().smallHeightBetweenFields(context),
          CustomTextButton(
              buttonWidth: 0.8,
              buttonText: AuthStrings().returnToSelectPage,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SelectPage()),
                    (Route<dynamic> routes) => false);
              })
        ],
      ),
    );
  }
}
