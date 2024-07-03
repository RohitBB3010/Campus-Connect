import 'package:flutter/material.dart';

class SpacingConsts {
  SizedBox smallHeightBetweenFields(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  }

  SizedBox mediumHeightBetweenFields(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
    );
  }

  SizedBox largeHeightBetweenFields(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
    );
  }

  SizedBox smallWidthBetweenFields(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.01,
    );
  }

  SizedBox mediumWidthBetweenFields(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.05,
    );
  }

  SizedBox largeWidthBetweenFields(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
    );
  }
}
