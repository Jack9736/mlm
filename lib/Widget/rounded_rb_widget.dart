import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Style/ButtonTextStyle.dart';
import '../Style/app_colors.dart';

class RoundedRadioButtonWidget extends StatelessWidget {
  int position;
  List<String> list;
  RxString obs;

  RoundedRadioButtonWidget(
    BuildContext context,
    this.position,
    this.list,
    this.obs, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double borderRadius = 70.0;
      var borderWidth = 1.0;
      var containerMargin = 4.0;
      var containerHeight = 40.0;
      return Container(
        margin: EdgeInsets.all(containerMargin),
        height: containerHeight,
        decoration: BoxDecoration(
          color: obs.value == list[position] ? AppColors.radio_selected_color : AppColors.appBgColor,
          border: Border.all(
            width: borderWidth,
            color: obs.value == list[position]
                ? AppColors.radio_selected_color
                : AppColors.radio_un_selected_color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(
                  borderRadius) //                 <--- border radius here
              ),
        ),
        child: MaterialButton(
          onPressed: () {
            obs.value = list[position];
          },
          child: Text(
            list[position],
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const ButtonTextStyle().textStyle.copyWith(
                color: obs.value == list[position]
                    ? AppColors.white
                    : AppColors.radio_button_text_color,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
      );
    });
  }
}
