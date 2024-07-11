import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/auth/select_page.dart';
import 'package:campus_connecy/auth/login_page.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
import 'package:campus_connecy/components/build_snackbar.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/components/text_button.dart';
import 'package:campus_connecy/components/text_field.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:campus_connecy/models/committee.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommitteeCodePage extends StatelessWidget {
  const CommitteeCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthUnAuthenticatedState) {
          return AuthSkeleton(
            bodyContent: Column(
              children: [
                SpacingConsts().mediumHeightBetweenFields(context),
                AutoSizeText(
                  AuthStrings().selectCommittee,
                  style: const TextStyle(fontSize: 40.0),
                ),
                SpacingConsts().mediumHeightBetweenFields(context),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                          menuItemStyleData: MenuItemStyleData(),
                          dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                  color: accent2,
                                  borderRadius: BorderRadius.circular(10.0))),
                          buttonStyleData: ButtonStyleData(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: secondary3.withOpacity(0.7)),
                                  borderRadius: BorderRadius.circular(20.0)),
                              height:
                                  MediaQuery.of(context).size.height * 0.07),
                          isExpanded: true,
                          value: state.selectedCommittee,
                          hint: const AutoSizeText('Select your committee'),
                          onChanged: (dynamic value) {
                            context.read<AuthCubit>().committeeChanged(value);
                          },
                          items: state.availableCommittes!.map((c) {
                            return item(c);
                          }).toList())),
                ),
                SpacingConsts().mediumHeightBetweenFields(context),
                CustomTextField(
                    fieldWidth: 0.8,
                    fieldHeight: 0.07,
                    hintText: 'Enter code',
                    onChanged: context.read<AuthCubit>().codeChanged),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          AuthStrings().noteText,
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            AuthStrings().codeNote,
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )),
                SpacingConsts().mediumHeightBetweenFields(context),
                CustomButton(context, AuthStrings().verifyCode, accent3, () {
                  if (state.selectedCommittee == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        buildSnackbar(AuthStrings().selectCommitteeFirst));
                    return;
                  }

                  if (state.committeeCode == null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(buildSnackbar(AuthStrings().emptyCode));
                    return;
                  }

                  if (state.committeeCode != null) {
                    String trimmedCode = state.committeeCode!.trim();

                    if (trimmedCode.isEmpty) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(buildSnackbar(AuthStrings().emptyCode));
                      return;
                    }

                    if (state.selectedCommittee != null &&
                        state.selectedCommittee!.code != trimmedCode) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          buildSnackbar(AuthStrings().incorrectCode));
                      return;
                    }

                    if (state.selectedCommittee != null &&
                        state.committeeCode == state.selectedCommittee!.code) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (Route<dynamic> routes) => false);
                    }
                  }
                }, 0.8, 0.07),
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
            ),
          );
        }

        return Container();
      },
    );
  }

  DropdownMenuItem item(CommitteeList current) {
    return DropdownMenuItem(
        value: current,
        child: AutoSizeText(
          current.name,
          maxLines: 2,
          wrapWords: true,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontFamily: 'Futura', fontSize: 20.0),
        ));
  }
}
