import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Style/app_colors.dart';
import '../Style/k_text_style.dart';
import '../Utils/constant.dart';

class CustomAppButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Widget icon;

  const CustomAppButtonWidget(
      {Key? key, required this.onTap, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle2 = TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        fontFamily: 'Gibson',
        color: Colors.white);
    return Container(
        margin: const EdgeInsets.all(
          15,
        ),
        height: AppConstant.appButtonSize,
        width: double.infinity,
        child: TextButton.icon(
          label: Text(text, style: textStyle2),
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: AppColors.submitBtnClr)),
              backgroundColor: AppColors.submitBtnClr,
              textStyle: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold)),
          onPressed: onTap,
          icon: icon,
        ));
  }
}
