import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/res/colors.dart';

Widget reusableText(
  String text, {
  Color color = AppColors.primaryText,
  int fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return SizedBox(
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    ),
  );
}
