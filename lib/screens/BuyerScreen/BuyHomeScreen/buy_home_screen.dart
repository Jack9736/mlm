
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/main_appbar.dart';
import 'package:mlm/enum/Method.dart';

import 'package:mlm/screens/BuyerScreen/BuyHomeScreen/buy_home_controller.dart';
import 'package:mlm/screens/BuyerScreen/DrawerScreen/BuySideDrawer.dart';


class BuyHomeScreen extends StatefulWidget {
  const BuyHomeScreen({Key? key}) : super(key: key);

  @override
  State<BuyHomeScreen> createState() => _BuyHomeScreenState();
}

class _BuyHomeScreenState extends State<BuyHomeScreen> {
  late String userName, password, sessionName;

  var userType = '';
  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  BuyHomeController controller = Get.find();

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
        ),
        drawer: SizedBox(
            // width: MediaQuery.of(context).size.width * 0.8,
            child: BuySideDrawer()),
        body: Container(),
      ),
    );
  }
}
