import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Style/ButtonTextStyle.dart';
import '../Style/app_colors.dart';
import '../Style/k_text_style.dart';
import '../Utils/constant.dart';

class CustomRadioButtonWidget extends StatelessWidget {
  int position;
  List<String> list;
  RxString obs;

  CustomRadioButtonWidget(
    BuildContext context,
    this.position,
    this.list,
    this.obs, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
          margin: const EdgeInsets.all(4),
          color: obs.value == list[position]
              ? AppColors.radio_selected_color
              : AppColors.white,
          shape: OutlineInputBorder(
            borderSide: BorderSide(
                color: obs.value == list[position]
                    ? AppColors.radio_selected_color
                    : AppColors.radio_un_selected_color,
                width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: SizedBox(
            height: 35,
            child: MaterialButton(
              shape: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.appBgColor, width: 1),
                borderRadius: BorderRadius.zero,
              ),
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
          ),
        ));
  }
}
