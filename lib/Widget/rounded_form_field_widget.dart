import 'package:flutter/material.dart';

import '../Style/app_colors.dart';

class RoundedTextFormFieldWidget extends StatelessWidget {
  String hintText;
  String msg;
  bool enabled;
  bool isRightIcons;
  int? minLines;
  int? maxLines;
  int? radius;
  TextInputType keyboardType;
  TextEditingController controller;

  TextStyle buildRadioTextStyle() {
    return const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'Gibson',
        color: Colors.grey);
  }

  RoundedTextFormFieldWidget(
    this.hintText,
    this.msg,
    this.enabled, {
    Key? key,
    this.maxLines,
    this.minLines,
    this.radius = 50,
    this.keyboardType = TextInputType.text,
    this.isRightIcons = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
        fontSize: 12,
        fontFamily: "Gibson",
        fontWeight: FontWeight.w600,
        color: AppColors.appSecondaryColor);
    double mPadding = 10;
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
      borderRadius: BorderRadius.circular(radius?.toDouble() ?? 10),
    );
    double borderRadius = 70.0;
    var borderWidth = 1.0;
    var containerMargin = 4.0;
    var containerHeight = 40.0;
    return Container(
      // height: containerHeight,
      margin: EdgeInsets.all(containerMargin),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          width: borderWidth,
          color: AppColors.radio_un_selected_color,
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius?.toDouble() ??
                10) //                 <--- border radius here
            ),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.next,
          cursorColor: AppColors.appSecondaryColor,
          style: textStyle,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return msg;
            }
            return null;
          },
          decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              contentPadding: EdgeInsets.fromLTRB(
                  mPadding, mPadding + 10, mPadding, mPadding - 5),
              hintStyle: buildRadioTextStyle(),
              disabledBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              border: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              suffixIcon: isRightIcons
                  ? const Icon(Icons.arrow_forward_ios_outlined)
                  :  null),
        ),
      ),
    );
  }
}
