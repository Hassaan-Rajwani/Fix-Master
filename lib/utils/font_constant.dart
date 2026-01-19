import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fix_master/utils/color_constant.dart';

TextStyle appFont({
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 14.0,
  Color color = AppColor.textColor,
  TextDecoration decoration = TextDecoration.none,
  Color decorationColor = AppColor.textColor,
}) {
  return GoogleFonts.urbanist(
    textStyle: TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize.sp,
      decoration: decoration,
      decorationColor: decorationColor,
    ),
  );
}
