import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/auth_cubit.dart';
import 'package:campus_connecy/auth/select_page.dart';
import 'package:campus_connecy/committees/committee_page.dart';
import 'package:campus_connecy/components/build_snackbar.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/components/text_button.dart';
import 'package:campus_connecy/components/text_field.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:campus_connecy/mandatory_fields.dart/mandatory_fields_cubit.dart';
import 'package:campus_connecy/mandatory_fields.dart/mandatory_fields_state.dart';
import 'package:campus_connecy/students/student_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MandatoryFieldsPage extends StatelessWidget {
  MandatoryFieldsPage({super.key});

  List<String> availableRoles = [
    "Head",
    "Co-head",
    "Member",
    "Extended Member",
  ];

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MandatoryFieldsCubit()..getCommittees(),
        child: BlocBuilder<MandatoryFieldsCubit, MandatoryFieldsState>(
          builder: (context, state) {
            final mandatoryCubit = context.read<MandatoryFieldsCubit>();

            if (state is MandatoryFieldsFillingState) {
              emailController.text = mandatoryCubit.getUserEmail() ?? '';
              state.email = mandatoryCubit.getUserEmail() ?? '';

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
                                AutoSizeText(
                                  MandatoryConsts().register,
                                  style: const TextStyle(fontSize: 40),
                                ),
                                SpacingConsts()
                                    .mediumHeightBetweenFields(context),
                                CustomTextField(
                                  fieldWidth: 0.8,
                                  icon: const Icon(Icons.person),
                                  hintText: MandatoryConsts().enterName,
                                  onChanged: mandatoryCubit.nameChanged,
                                ),
                                SpacingConsts()
                                    .smallHeightBetweenFields(context),
                                CustomTextField(
                                  controller: emailController,
                                  fieldWidth: 0.8,
                                  icon: const Icon(Icons.email),
                                  hintText: MandatoryConsts().enterEmail,
                                  onChanged: mandatoryCubit.emailChanged,
                                ),
                                SpacingConsts()
                                    .smallHeightBetweenFields(context),
                                CustomTextField(
                                  fieldWidth: 0.8,
                                  icon: const Icon(Icons.phone),
                                  hintText: MandatoryConsts().enterPhone,
                                  onChanged: mandatoryCubit.phoneChanged,
                                ),
                                SpacingConsts()
                                    .smallHeightBetweenFields(context),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: CustomDropdown<String>.multiSelect(
                                      hintText:
                                          MandatoryConsts().selectCommittees,
                                      maxlines: 2,
                                      decoration: CustomDropdownDecoration(
                                          closedBorder:
                                              Border.all(color: secondary1),
                                          closedBorderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(10.0))),
                                      items: state.committeesList != null
                                          ? state.committeesList!
                                              .map(
                                                  (committee) => committee.name)
                                              .toList()
                                          : [],
                                      onListChanged: (value) {
                                        mandatoryCubit.listUpdated(value);
                                      }),
                                ),
                                SpacingConsts()
                                    .smallHeightBetweenFields(context),
                                if (state.isStudent != null &&
                                    !state.isStudent!)
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
                                                    BorderRadius.circular(
                                                        10.0))),
                                        buttonStyleData: ButtonStyleData(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: secondary3
                                                        .withOpacity(0.7)),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
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
                                  if (state.name == null ||
                                      state.phone == null ||
                                      state.email == null ||
                                      !state.isStudent! && state.role == null) {
                                    debugPrint(state.isStudent.toString());
                                    debugPrint(state.name.toString());
                                    debugPrint(state.email.toString());
                                    debugPrint(state.role.toString());
                                    debugPrint(state.phone.toString());
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        buildSnackbar(
                                            MandatoryConsts().fillFields));
                                  } else {
                                    if (state.isStudent != null &&
                                        state.isStudent!) {
                                      mandatoryCubit.registerUser();
                                    } else {
                                      mandatoryCubit.registerUserMember();
                                    }
                                  }
                                }, 0.8, 0.07),
                                SpacingConsts()
                                    .smallHeightBetweenFields(context),
                                CustomTextButton(
                                    buttonWidth: 0.8,
                                    buttonText:
                                        AuthStrings().returnToSelectPage,
                                    onPressed: () {
                                      context.read<AuthCubit>().signOut(() {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SelectPage()),
                                          (Route<dynamic> route) => false,
                                        );
                                      });
                                    })
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
            }

            if (state is MandatoryFieldsFilledState) {
              if (state.isStudent) {
                return const StudentHome();
              } else {
                return CommitteePage();
              }
            }

            return Container();
          },
        ));
  }
}
