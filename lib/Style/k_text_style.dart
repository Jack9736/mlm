import 'package:flutter/material.dart';

import 'app_colors.dart';

class KTextStyle {
  static const headerTextStyle = TextStyle(
      color: AppColors.whiteshade, fontSize: 28, fontWeight: FontWeight.w700);

  static const textFieldHeading =
      TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500);

  static const textFieldHintStyle = TextStyle(
      color: AppColors.hintText, fontSize: 14, fontWeight: FontWeight.w500);

  static const authButtonTextStyle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.whiteshade);

  static const noteTextStyle = TextStyle(
      fontFamily: 'Gibson', fontWeight: FontWeight.w100, fontSize: 14,color: AppColors.txt_field_hint_color);
}
