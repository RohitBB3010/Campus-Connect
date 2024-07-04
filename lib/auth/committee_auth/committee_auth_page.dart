import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/committee_auth/committee_auth_cubit.dart';
import 'package:campus_connecy/components/text_field.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommitteeAuthPage extends StatelessWidget {
  const CommitteeAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommitteeAuthCubit(),
      child: SafeArea(
        child: SafeArea(
          child: SafeArea(
            child: Scaffold(
              backgroundColor: primary2,
              body: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/signin_bg.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: MediaQuery.of(context).size.height * 0.35,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.7,
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                            ),
                            color: primary1,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SpacingConsts()
                                  .mediumHeightBetweenFields(context),
                              AutoSizeText(
                                AuthStrings().signIn,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontFamily: 'Futura', fontSize: 40.0),
                              ),
                              SpacingConsts()
                                  .mediumHeightBetweenFields(context),
                              CustomTextField(
                                fieldWidth: 0.7,
                                hintText: AuthStrings().committeeUsername,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
