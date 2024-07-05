import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.buttonWidth,
    required this.buttonText,
    this.textColor,
    required this.onPressed,
    this.icon,
  });
  final double buttonWidth;
  final String buttonText;
  final Color? textColor;
  final void Function() onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * buttonWidth,
      child: TextButton(
          onPressed: onPressed,
          child: AutoSizeText(
            buttonText,
            maxLines: 1,
            style: TextStyle(
                fontFamily: "Futura",
                color: accent3,
                decoration: TextDecoration.underline,
                fontSize: 20.0),
          )),
    );
  }
}
