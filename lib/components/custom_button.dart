import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:campus_connecy/constants/string_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.buttonWidth,
      this.buttonHeight,
      this.color,
      this.onPressed,
      required this.buttonText});
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? color;
  final VoidCallback? onPressed;
  final String buttonText;

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
        onPressed: () {
          onPressed;
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? accent3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        child: AutoSizeText(
          buttonText,
          maxLines: 1,
          style: TextStyle(
              fontFamily: 'Futura',
              color: color == null ? primary1 : secondary3,
              fontSize: 25.0),
        ),
      ),
    );
  }
}
