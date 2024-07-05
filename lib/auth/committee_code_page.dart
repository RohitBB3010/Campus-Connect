import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/auth_state.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
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
          Committee selectedCommittee = state.availableCommittes!.first;

          debugPrint(state.availableCommittes.toString());
          return AuthSkeleton(
            bodyContent: Column(
              children: [
                SpacingConsts().mediumHeightBetweenFields(context),
                AutoSizeText(
                  AuthStrings().selectCommittee,
                  style: const TextStyle(fontFamily: 'Futura', fontSize: 40.0),
                ),
                SpacingConsts().mediumHeightBetweenFields(context),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
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
                )
              ],
            ),
          );
        }

        return Container();
      },
    );
  }

  DropdownMenuItem item(Committee current) {
    return DropdownMenuItem(
        value: current,
        child: AutoSizeText(
          current.name,
          maxLines: 2,
          wrapWords: true,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontFamily: 'Futura', fontSize: 25.0),
        ));
  }
}
