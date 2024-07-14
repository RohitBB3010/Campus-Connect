import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/select_page.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:campus_connecy/mandatory_fields.dart/mandatory_fields_cubit.dart';
import 'package:campus_connecy/mandatory_fields.dart/mandatory_fields_state.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommitteePage extends StatelessWidget {
  CommitteePage({super.key});

  List<String> availableRoles = [
    "Head",
    "Co-head",
    "Member",
    "Extended Member"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            MandatoryFieldsCubit()..checkIsMemberAndRegistered(),
        child: BlocBuilder<MandatoryFieldsCubit, MandatoryFieldsState>(
          builder: (context, state) {
            if (state is MandatoryNewMemberState) {
              final mandatoryCubit = context.read<MandatoryFieldsCubit>();

              return SafeArea(
                  child: Scaffold(
                backgroundColor: primary1,
                body: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/mandatory.png'),
                                fit: BoxFit.fill)),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: MediaQuery.of(context).size.height * 0.25,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                            ),
                            color: primary1,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SpacingConsts()
                                    .mediumHeightBetweenFields(context),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: AutoSizeText(
                                      MandatoryConsts().selectRole,
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 40)),
                                ),
                                SpacingConsts()
                                    .mediumHeightBetweenFields(context),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      hint: const AutoSizeText("Select role",
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 20)),
                                      value: state.role,
                                      dropdownStyleData: DropdownStyleData(
                                          decoration: BoxDecoration(
                                              color: accent2,
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                      buttonStyleData: ButtonStyleData(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: secondary3
                                                      .withOpacity(0.7)),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07),
                                      isExpanded: true,
                                      items: availableRoles.map((role) {
                                        return DropdownMenuItem(
                                          value: role,
                                          child: AutoSizeText(role),
                                        );
                                      }).toList(),
                                      onChanged: (dynamic value) {
                                        mandatoryCubit.roleChanged(value);
                                      },
                                    ),
                                  ),
                                ),
                                SpacingConsts()
                                    .mediumHeightBetweenFields(context),
                                CustomButton(
                                    context,
                                    MandatoryConsts().registerButton,
                                    accent3, () {
                                  mandatoryCubit.addCommitteeMember();
                                }, 0.8, 0.07)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
            } else {
              return Scaffold(
                body: Column(
                  children: [
                    CustomButton(context, 'Sign out', accent3, () {
                      context.read<AuthCubit>().signOut(() {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SelectPage()),
                          (Route<dynamic> route) => false,
                        );
                      });
                    }, 0.6, 0.08)
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
