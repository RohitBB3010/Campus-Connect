import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/components/build_snackbar.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/components/text_field.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:campus_connecy/students/mandatory_fields_students/student_mandatory_cubit.dart';
import 'package:campus_connecy/students/mandatory_fields_students/student_mandatory_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class StudentMandatoryFields extends StatelessWidget {
  StudentMandatoryFields({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentMandatoryCubit()
        ..emitUserEmail()
        ..getCommitteesList(),
      child: BlocBuilder<StudentMandatoryCubit, StudentMandatoryState>(
        builder: (context, state) {
          final mandatoryCubit = context.read<StudentMandatoryCubit>();
          emailController.text = state.email ?? '';

          return SafeArea(
              child: Scaffold(
            backgroundColor: primary1,
            body: SingleChildScrollView(
              child: SizedBox(
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
                        height: MediaQuery.of(context).size.height * 0.65,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                          color: primary1,
                        ),
                        child: Column(
                          children: [
                            SpacingConsts().mediumHeightBetweenFields(context),
                            AutoSizeText(
                              StudentMandatoryConsts().register,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 40),
                            ),
                            SpacingConsts().largeHeightBetweenFields(context),
                            CustomTextField(
                                icon: const Icon(Icons.person_2_sharp),
                                fieldWidth: 0.8,
                                hintText: StudentMandatoryConsts().enterName,
                                onChanged: mandatoryCubit.nameChanged),
                            SpacingConsts().mediumHeightBetweenFields(context),
                            CustomTextField(
                                icon: const Icon(Icons.email_outlined),
                                controller: emailController,
                                fieldWidth: 0.8,
                                hintText: StudentMandatoryConsts().enterName,
                                onChanged: mandatoryCubit.nameChanged),
                            SpacingConsts().mediumHeightBetweenFields(context),
                            CustomTextField(
                              icon: const Icon(Icons.phone_android),
                              fieldWidth: 0.8,
                              hintText: StudentMandatoryConsts().enterPhone,
                              onChanged: mandatoryCubit.phoneNumberChanged,
                            ),
                            SpacingConsts().mediumHeightBetweenFields(context),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: CustomDropdown<String>.multiSelect(
                                  maxlines: 2,
                                  decoration: CustomDropdownDecoration(
                                      closedBorder:
                                          Border.all(color: secondary1),
                                      closedBorderRadius:
                                          const BorderRadius.all(
                                              Radius.circular(10.0))),
                                  items: state.committeesList != null
                                      ? state.committeesList!
                                          .map((committee) => committee.name)
                                          .toList()
                                      : [],
                                  onListChanged: (value) {
                                    mandatoryCubit.listUpdated(value);
                                  }),
                            ),
                            SpacingConsts().mediumHeightBetweenFields(context),
                            CustomButton(context, "Register", accent3, () {
                              if (state.name == null ||
                                  state.name == null && state.name!.isEmpty ||
                                  state.phoneNumber == null ||
                                  state.phoneNumber != null &&
                                      state.phoneNumber!.isEmpty ||
                                  state.committeesSubscribed == null ||
                                  state.committeesSubscribed != null &&
                                      state.committeesSubscribed!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    buildSnackbar("Please fill all fields"));
                              }
                            }, 0.8, 0.07)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
