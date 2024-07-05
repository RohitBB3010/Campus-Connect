import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/components/auth_skeleton.dart';
import 'package:campus_connecy/constants/spacingConsts.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:flutter/material.dart';

class CommitteeCodePage extends StatelessWidget {
  const CommitteeCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthSkeleton(
      bodyContent: Column(
        children: [
          SpacingConsts().mediumHeightBetweenFields(context),
          AutoSizeText(
            AuthStrings().selectCommittee,
            style: const TextStyle(fontFamily: 'Futura', fontSize: 40.0),
          ),
          SpacingConsts().mediumHeightBetweenFields(context),
        ],
      ),
    );
  }
}
