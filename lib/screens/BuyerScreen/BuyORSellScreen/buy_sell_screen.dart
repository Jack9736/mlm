import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:get/get.dart';
import 'package:mlm/Widget/Message.dart';
import 'package:mlm/enum/Method.dart';

import 'package:mlm/Utils/constant.dart';
import 'package:mlm/screens/BuyerScreen/BuyORSellScreen/buy_sell_controller.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../Style/app_colors.dart';
import '../../../Widget/custom_image_widget.dart';

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

  UserType _userType = UserType.buyer;

  @override
  void initState() {
    super.initState();

    userNmController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              left: 35.0,
              right: 35.0,
              top: 0.0,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/lady.png",
                                fit: BoxFit.none,
                                width: double.infinity,
                              ),
                            ],
                          ),

                          // const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      facebookLogin();
                      // doSignInFacebook();
                    },
                    child: const Text("FaceBook Login")),
                buyPetButton(context),
                const SizedBox(height: 30),
                sellPetButton(context),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  facebookLogin() async {
    print("FaceBook");
    try {
      final result =
          await FacebookAuth.i.login();
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        if (userData.containsKey('email')) {
          print(userData['email']);
        }

        if (userData.containsKey('name')) {
          print(userData['name']);
        }
        if (userData["picture"]["data"]["url"] != null) {
          print(userData["picture"]["data"]["url"]);
          showCustomDialog(context, userData["picture"]["data"]["url"]);
        }
        print(userData);
      }
    } catch (error) {
      print(error);
    }
  }

  void showCustomDialog(BuildContext context, String image) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: CustomImageWidget(
              imgUrl: image,
              height: 130,
              width: 130,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
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
      width: double.infinity,
      height: AppConstant.appButtonSize,
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
                    side: BorderSide(color: AppColors.submitBtnClr)),
                backgroundColor: AppColors.submitBtnClr,
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Get.toNamed(AppConstant.ROUTE_FIRST_REG, arguments: [
                {AppConstant.argUserType: UserType.buyer},
              ]);
              //Get.toNamed(AppConstant.ROUTE_SELL_PET_ADDED_VIEW);
            },
          )),
    );
  }

  /* Sell Pet Button */
  SizedBox sellPetButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppConstant.appButtonSize,
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
                    side: BorderSide(color: AppColors.submitBtnClr)),
                primary: Colors.white,
                backgroundColor: AppColors.submitBtnClr,
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Get.toNamed(AppConstant.ROUTE_FIRST_REG, arguments: [
                {AppConstant.argUserType: UserType.seller},
              ]);
            },
          )),
    );
  }
}
