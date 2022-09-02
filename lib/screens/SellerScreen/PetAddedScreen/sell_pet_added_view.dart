import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/enum/Method.dart';

import 'package:mlm/screens/loginScreen/login_controller.dart';

class PetAddedView extends StatefulWidget {
  const PetAddedView({Key? key}) : super(key: key);

  @override
  State<PetAddedView> createState() => _PetAddedViewState();
}

class _PetAddedViewState extends State<PetAddedView> {
  final _formKey = GlobalKey<FormState>();

  bool _showClearButton = false;

  LoginController controller = Get.find();

  var token;

  UserType _userType = UserType.buyer;

  @override
  void initState() {
    super.initState();

   // readArgument();
  }

  void readArgument() {
    var argumentData = Get.arguments;
    _userType = argumentData[0][AppConstant.argUserType];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        //appBar: const CustomAppBar(title: "Welcome"),
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            petAddedText(),
                            contentText(),
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
                          ],
                        ),
                      ),
                    )),
                okyButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* Container PetAddedText Text */
  Container petAddedText() {
    return Container(
        margin: const EdgeInsets.only(
            top: 0.0, bottom: 30.0, left: 30.0, right: 30.0),
        width: double.infinity,
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Pet has been added",
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'Gibson',
                color: AppColors.topHeaderBlueClr),
          ),
        ));
  }

  Container contentText() {
    return Container(
        margin: const EdgeInsets.only(
            top: 10.0, bottom: 80.0, left: 60.0, right: 60.0),
        width: double.infinity,
        child: const Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Gibson',
                  color: AppColors.topHeaderBlueClr),
            ),
          ),
        ));
  }

  /* Start Browsing Button */
  Container okyButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 38, left: 38, right: 38,),
      height: AppConstant.appButtonSize,
      width: double.infinity,
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
            : const Text('OK',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Gibson',
                color: Colors.white)),
        style: TextButton.styleFrom(
          //foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
                side: BorderSide(color: AppColors.submitBtnClr)),
            backgroundColor: AppColors.submitBtnClr,
            textStyle: const TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      )),
    );
  }
}
