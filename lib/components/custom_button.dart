import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.buttonWidth, this.buttonHeight});
  double? buttonWidth;
  double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth == null
          ? MediaQuery.of(context).size.width * 0.7
          : MediaQuery.of(context).size.width * buttonWidth!,
      height: buttonHeight == null
          ? MediaQuery.of(context).size.height * 0.08
          : MediaQuery.of(context).size.height * buttonHeight!,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: accent3),
        child: AutoSizeText(
          AuthStrings().studentAuth,
          maxLines: 1,
          style:
              TextStyle(fontFamily: 'Futura', color: primary1, fontSize: 25.0),
        ),
      ),
    );
  }
}
