
import 'package:flutter/material.dart';

import '../Style/app_colors.dart';
import '../Style/k_text_style.dart';


class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CustomButtonWidget({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        margin: const EdgeInsets.only(left: 15, right: 15),
        decoration: const BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            text,
            style: KTextStyle.authButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
