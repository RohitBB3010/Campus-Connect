import 'package:campus_connecy/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.fieldWidth,
    this.fieldHeight,
    required this.hintText,
    this.icon,
    required this.onChanged,
    this.controller,
  });
  final double fieldWidth;
  final double? fieldHeight;
  final String hintText;
  final Icon? icon;
  final dynamic onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * fieldWidth,
      height: fieldHeight != null
          ? MediaQuery.of(context).size.height * fieldHeight!
          : MediaQuery.of(context).size.height * 0.06,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            enabled: controller != null && controller!.text.isNotEmpty
                ? false
                : true,
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: controller != null && controller!.text.isNotEmpty
                        ? secondary3
                        : secondary2.withOpacity(0.5))),
            prefixIcon: icon,
            iconColor: controller != null && controller!.text.isNotEmpty
                ? secondary3
                : secondary2.withOpacity(0.5),
            hintText: hintText,
            hintStyle: const TextStyle(
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
