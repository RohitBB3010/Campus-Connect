import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
import 'package:campus_connecy/components/build_snackbar.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/components/text_field.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthSkeleton(bodyContent:
        BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthUnAuthenticatedState) {
        return Column(
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
                onChanged: context.read<AuthCubit>().paswordChanged),
            SpacingConsts().mediumHeightBetweenFields(context),
            CustomTextField(
                fieldWidth: 0.8,
                hintText: AuthStrings().confirmPassword,
                onChanged: context.read<AuthCubit>().confirmPasswordChanged),
            SpacingConsts().largeHeightBetweenFields(context),
            CustomButton(context, AuthStrings().setPassword, accent3, () async {
              if (state.password == null || state.confirmPassword == null) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(buildSnackbar(AuthStrings().fillFields));
              }

              if (state.password != state.confirmPassword) {
                ScaffoldMessenger.of(context).showSnackBar(
                    buildSnackbar(AuthStrings().passwordsMismatch));
              }

              if (state.password != null && state.confirmPassword != null) {
                String? returnMessage = await context
                    .read<AuthCubit>()
                    .setPassword(state.password!);

                ScaffoldMessenger.of(context)
                    .showSnackBar(buildSnackbar(returnMessage!));
              }
            }, 0.8, 0.08)
          ],
        );
      }
      return Container();
    }));
  }
}
