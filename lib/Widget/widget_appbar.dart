import 'package:flutter/material.dart';

import '../Utils/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textIconColor;
  final Color? backIconColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;

  const CustomAppBar({
    Key? key,
    this.backgroundColor = AppConstant.topHeaderBlueClr,
    this.textIconColor = Colors.white,
    this.backIconColor = Colors.white,
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
      leading: hideBack
          ? Container()
          : icon == null
              ?  BackButton(color: backIconColor,)
              : IconButton(
                  icon: Image.asset(
                    icon!,
                    height: 18,
                    width: 18,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
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
