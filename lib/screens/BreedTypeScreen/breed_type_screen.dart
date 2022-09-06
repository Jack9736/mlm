import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/BreedTypeScreen/breed_type_controller.dart';

class BreedTypeScreen extends StatelessWidget {
  BreedTypeScreen({Key? key}) : super(key: key);

  BreedTypeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: const CustomAppBar(
          title: "My Messages",
        ),
        body: ListView.separated(
          itemCount: 10, // the length
          itemBuilder: (context, index) {
            return const Text("LABRADOR");
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ));
  }

  Padding buildDividerPadding() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Divider(),
    );
  }
}
