import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Style/ButtonTextStyle.dart';
import '../Style/app_colors.dart';
import '../Style/k_text_style.dart';
import '../Utils/constant.dart';

class RoundedCheckBoxWidget extends StatelessWidget {
  int position;
  List<String> list;
  RxList<String> obs;

  RoundedCheckBoxWidget(
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
          color: obs.contains(list[position])
              ? AppColors.radio_selected_color
              : AppColors.white,
          border: Border.all(
            width: borderWidth,
            color: obs.contains(list[position])
                ? AppColors.radio_selected_color
                : AppColors.radio_un_selected_color,
          ),
          borderRadius: BorderRadius.all(Radius.circular(
                  borderRadius) //                 <--- border radius here
              ),
        ),
        child: MaterialButton(
          onPressed: () {
            obs.contains(list[position])
                ? obs.remove(list[position])
                : obs.add(list[position]);
            obs.refresh();
          },
          child: Text(
            list[position],
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const ButtonTextStyle().textStyle.copyWith(
                color: obs.contains(list[position])
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
