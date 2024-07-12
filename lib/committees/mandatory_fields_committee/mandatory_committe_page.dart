import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/committees/mandatory_fields_committee/mandatory_committee_cubit.dart';
import 'package:campus_connecy/committees/mandatory_fields_committee/mandatory_committee_state.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/components/text_field.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandatoryCommittePage extends StatelessWidget {
  MandatoryCommittePage({super.key});

  List<String> availableRoles = [
    "Head",
    "Co-head",
    "Member",
    "Extended Member",
    "Department Head"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MandatoryCommitteeCubit(),
      child: BlocBuilder<MandatoryCommitteeCubit, MandatoryCommitteeState>(
        builder: (context, state) {
          final mandatoryCommCubit = context.read<MandatoryCommitteeCubit>();

          if (state is MandatoryCommitteeFillingState) {
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
                        child: Column(
                          children: [
                            SpacingConsts().largeHeightBetweenFields(context),
                            AutoSizeText(
                              AuthStrings().signInAsMember,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 40.0),
                            ),
                            SpacingConsts().largeHeightBetweenFields(context),
                            CustomTextField(
                              fieldWidth: 0.8,
                              icon: const Icon(Icons.person_2),
                              hintText: MandatoryConsts().enterName,
                              onChanged: mandatoryCommCubit.nameChanged,
                            ),
                            SpacingConsts().mediumHeightBetweenFields(context),
                            CustomTextField(
                              fieldWidth: 0.8,
                              icon: const Icon(Icons.email),
                              hintText: MandatoryConsts().enterEmail,
                              onChanged: mandatoryCommCubit.emailChanged,
                            ),
                            SpacingConsts().mediumHeightBetweenFields(context),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  value: state.memberRole,
                                  dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                          color: accent2,
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                  buttonStyleData: ButtonStyleData(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  secondary3.withOpacity(0.7)),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07),
                                  isExpanded: true,
                                  items: availableRoles.map((role) {
                                    return DropdownMenuItem(
                                      value: role,
                                      child: AutoSizeText(role),
                                    );
                                  }).toList(),
                                  onChanged: (dynamic value) {
                                    mandatoryCommCubit.roleChanged(value);
                                  },
                                ),
                              ),
                            ),
                            SpacingConsts().largeHeightBetweenFields(context),
                            CustomButton(
                                context,
                                MandatoryConsts().registerButton,
                                accent3,
                                () {},
                                0.8,
                                0.07)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
          }

          return Container();
        },
      ),
    );
  }
}