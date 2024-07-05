import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:flutter/material.dart';

Widget CustomButton(
  BuildContext context,
  String buttonText,
  Color? buttonColor,
  void Function() onPressed,
  double? buttonWidth,
  double? buttonHeight,
) {
  return SizedBox(
    width: buttonWidth != null
        ? MediaQuery.of(context).size.width * buttonWidth
        : MediaQuery.of(context).size.width * 0.6,
    height: buttonHeight != null
        ? MediaQuery.of(context).size.height * buttonHeight
        : MediaQuery.of(context).size.height * 0.08,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? accent3,
        shape: RoundedRectangleBorder(
          side: buttonColor == null || buttonColor != accent3
              ? BorderSide(
                  color: secondary3.withAlpha(100),
                )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: AutoSizeText(
        buttonText,
        maxLines: 1,
        style: TextStyle(
          color: buttonColor == null || buttonColor == accent3
              ? primary1
              : secondary3,
          fontSize: 30.0,
        ),
      ),
    ),
  );
}
