import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/main_appbar.dart';
import 'package:mlm/enum/Method.dart';

import 'package:mlm/screens/BuyerScreen/BuyHomeScreen/buy_home_controller.dart';
import 'package:mlm/screens/BuyerScreen/DrawerScreen/BuySideDrawer.dart';
import 'package:mlm/screens/SellerScreen/SellHomeScreen/sell_home_controller.dart';

import '../DrawerScreen/SellSideDrawer.dart';

class SellHomeScreen extends StatefulWidget {
  const SellHomeScreen({Key? key}) : super(key: key);

  @override
  State<SellHomeScreen> createState() => _SellHomeScreenState();
}

class _SellHomeScreenState extends State<SellHomeScreen> {
  late String userName, password, sessionName;

  var userType = '';
  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SellHomeController controller = Get.find();

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
        key: controller.scaffoldKey,
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
          onTap: () {
            controller.openDrawer();
          },
        ),
        drawer: SizedBox(
            // width: MediaQuery.of(context).size.width * 0.8,
            child: SellSideDrawer()),
        body: Container(),
      ),
    );
  }
}
