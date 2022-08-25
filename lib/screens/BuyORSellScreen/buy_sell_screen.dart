import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mlm/screens/BuyORSellScreen/buy_sell_controller.dart';
import 'package:mlm/Utils/constant.dart';

class BuySellScreen extends StatefulWidget {
  const BuySellScreen({Key? key}) : super(key: key);

  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late String userName, password, sessionName;

  var userType = '';
  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  BuySellController controller = Get.find();

  var token;

  @override
  void initState() {
    super.initState();

    userNmController.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        // appBar: PreferredSize(
        //     preferredSize: const Size.fromHeight(10.0),
        //     // here the desired height
        //     child: AppBar(
        //       backgroundColor: AppConstant.topHeaderClr,
        //     )),
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 20.0,
            ),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/lady.png",
                        fit: BoxFit.contain,
                        width: 175,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/puppy.png",
                        fit: BoxFit.contain,
                        width: 175,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  buyPetButton(context),
                  const SizedBox(height: 30),
                  sellPetButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /* Buy Pet Button */
  SizedBox buyPetButton(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Obx(() => TextButton(
            child: controller.isApiRunning.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  )
                : const Text('I WANT TO BUY A PET',
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gibson')),
            style: TextButton.styleFrom(
                //foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: AppConstant.submitBtnClr)),
                backgroundColor: AppConstant.submitBtnClr,
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Get.toNamed(AppConstant.ROUTE_FIRST_REGISTRATION);
            },
          )),
    );
  }

  /* Sell Pet Button */
  Container sellPetButton(BuildContext context) {
    return Container(
      height: 60,
      child: Obx(() => TextButton(
            child: controller.isApiRunning.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  )
                : const Text('I WANT TO SELL A PET',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gibson')),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: AppConstant.submitBtnClr)),
                primary: Colors.white,
                backgroundColor: AppConstant.submitBtnClr,
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Get.toNamed(AppConstant.ROUTE_FIRST_REGISTRATION);

            },
          )),
    );
  }
}
