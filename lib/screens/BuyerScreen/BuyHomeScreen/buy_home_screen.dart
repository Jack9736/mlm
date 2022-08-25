import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/main_appbar.dart';
import 'package:mlm/enum/Method.dart';

import 'package:mlm/Utils/constant.dart';
import 'package:mlm/screens/BuyerScreen/BuyORSellScreen/buy_sell_controller.dart';

class BuyHomeScreen extends StatefulWidget {
  const BuyHomeScreen({Key? key}) : super(key: key);

  @override
  State<BuyHomeScreen> createState() => _BuyHomeScreenState();
}

class _BuyHomeScreenState extends State<BuyHomeScreen> {

  bool _obscureText = true;

  late String userName, password, sessionName;

  var userType = '';
  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  BuySellController controller = Get.find();

  var token;

  final UserType _userType = UserType.buyer;

  @override
  void initState() {
    super.initState();

    userNmController.addListener(() {
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: MainAppBar(
          menuItem: [
            IconButton(
              icon: Image.asset(
                'assets/ic_chat.png',
                color: AppColors.appColor,
                height: 18,
                width: 18,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}
