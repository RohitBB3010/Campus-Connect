import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: primary2,
          body: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/signin_bg.png'),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.40,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                        color: primary1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SpacingConsts().mediumHeightBetweenFields(context),
                        const AutoSizeText(
                          "Connecting Committess",
                          maxLines: 1,
                          style:
                              TextStyle(fontFamily: "Futura", fontSize: 40.0),
                        ),
                        const AutoSizeText(
                          "Uniting Campuses",
                          maxLines: 1,
                          style:
                              TextStyle(fontFamily: "Futura", fontSize: 40.0),
                        ),
                        SpacingConsts().smallHeightBetweenFields(context),
                        CustomButton()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
