import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';

import '../Utils/constant.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final Color? backIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;

  const MainAppBar({
    Key? key,
    this.backgroundColor = AppColors.white,
    this.textIconColor = AppColors.white,
    this.backIconColor = AppColors.white,
    this.icon,
    this.title = '',
    this.menuItem,
    this.height = kToolbarHeight,
    this.hideBack = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: menuItem,
      toolbarHeight: preferredSize.height,
      iconTheme: IconThemeData(
        color: textIconColor,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: AppColors.appColor,
        ),
        onPressed: () {
          Get.toNamed(AppConstant.ROUTE_BUY_DRAWER);
        },
      ),
      title: Text(
        title!,
        style: TextStyle(
            color: textIconColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Barlow'),
      ),
      backgroundColor: backgroundColor,
      centerTitle: true,
    );
  }
}