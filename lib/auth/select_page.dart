import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/auth/committee_code_page.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
import 'package:campus_connecy/components/custom_button.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthSkeleton(
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SpacingConsts().mediumHeightBetweenFields(context),
          const AutoSizeText(
            "Connecting Committees",
            maxLines: 1,
            style: TextStyle(
              fontFamily: "Futura",
              fontSize: 40.0,
            ),
          ),
          const AutoSizeText(
            "Uniting Campuses",
            maxLines: 1,
            style: TextStyle(
              fontFamily: "Futura",
              fontSize: 40.0,
            ),
          ),
          SpacingConsts().customHeightBetweenFields(context, 0.03),
          CustomButton(context, AuthStrings().committeeAuth, accent3, () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CommitteeCodePage()));
          }, 0.6, 0.08),
          SpacingConsts().smallHeightBetweenFields(context),
          const AutoSizeText(
            'Or',
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: 30.0,
            ),
          ),
          SpacingConsts().smallHeightBetweenFields(context),
          CustomButton(
              context, AuthStrings().studentAuth, primary1, () {}, 0.6, 0.08),
        ],
      ),
    );
  }
}
