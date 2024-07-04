import 'package:campus_connecy/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.fieldWidth,
      this.fieldHeight,
      required this.hintText});
  final double fieldWidth;
  final double? fieldHeight;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * fieldWidth,
      height: fieldHeight != null
          ? MediaQuery.of(context).size.height * fieldHeight!
          : MediaQuery.of(context).size.height * 0.06,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: 'Futura',
              fontSize: 20.0,
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.02),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: secondary3),
                borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }
}
