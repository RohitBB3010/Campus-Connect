import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connecy/constants/colors.dart';
import 'package:flutter/material.dart';

SnackBar buildSnackbar(String snackBarText) {
  return SnackBar(
    content: Center(
      child: AutoSizeText(
        snackBarText,
        style: TextStyle(fontSize: 20.0, color: primary1),
      ),
    ),
    backgroundColor: accent3,
    elevation: 20.0,
    behavior: SnackBarBehavior.floating,
  );
}
