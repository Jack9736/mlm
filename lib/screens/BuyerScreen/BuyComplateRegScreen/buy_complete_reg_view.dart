import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/loginScreen/login_controller.dart';
import 'package:mlm/Utils/constant.dart';

import '../../../enum/Method.dart';

class BuyCompleteRegView extends StatefulWidget {
  const BuyCompleteRegView({Key? key}) : super(key: key);

  @override
  State<BuyCompleteRegView> createState() => _BuyCompleteRegViewState();
}

class _BuyCompleteRegViewState extends State<BuyCompleteRegView> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late String userName, password, sessionName;
  var confirmPass;
  late String firstName, lastName, email, phone, confirmPwd;
  bool isApiRunning = false;

  var userType = '';
  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginController controller = Get.find();

  var token;

  UserType _userType = UserType.buyer;

  @override
  void initState() {
    super.initState();

    userNmController.addListener(() {
      setState(() {});
    });
    readArgument();
  }

  void readArgument() {
    var argumentData = Get.arguments;
    _userType = argumentData[0][AppConstant.argUserType];
  }

  @override
  Widget build(BuildContext context) {
    var horizontalPadding = 38.0;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppBar(title: "Create Account"),
        body: SafeArea(
          bottom: true,
          child: Form(
              key: _formKey,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    buildSignUpLabelText(),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                                textCapitalization: TextCapitalization.sentences,
                                textInputAction: TextInputAction.next,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                // Only numbers can be entered
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    suffixIcon: buildSendButton(context),

                                  labelText: 'Phone Number',
                                  labelStyle: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Gibson',
                                      color: AppColors.topHeaderBlueClr),


                            )),
                            const SizedBox(height: 10),
                            const Text("You can send another code in 30 seconds", style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Gibson',
                                color: AppColors.topHeaderBlueClr),
                            ),const SizedBox(height: 40),
                            const Text(
                              "Phone Number Verification Code",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Gibson',
                                  color: AppColors.topHeaderBlueClr),
                            ),
                            TextField(
                                textCapitalization: TextCapitalization.sentences,
                                textInputAction: TextInputAction.next,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],

                                maxLength: 5,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                // Only numbers can be entered
                                cursorColor: Colors.black,

                                decoration: const InputDecoration(
                                    counterText: "",
                                    labelText: '5 digit code here',
                                    labelStyle: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Gibson',
                                        color: AppColors.topHeaderBlueClr
                                    ),


                            ),
                            ),
                            const SizedBox(height: 40),
                            //bodyContent(),


                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: horizontalPadding),
                      child: nextButton(context),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /* Container Sign Up Text */
  Container buildSignUpLabelText() {
    return Container(
        margin: const EdgeInsets.only(
            top: 30.0, bottom: 0.0, left: 30.0, right: 0.0),
        width: double.infinity,
        child: const Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Complete Sign Up",
              style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Gibson',
                  color: AppColors.topHeaderBlueClr),
            ),
          ),
        ));
  }

  /* Next Button */
  SizedBox nextButton(BuildContext context) {
    return SizedBox(
      height: 50,
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
                : const Text(
                    'VERIFY',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gibson',
                        color: Colors.white),
                  ),
            style: TextButton.styleFrom(
                //foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: AppColors.submitBtnClr)),
                backgroundColor: AppColors.submitBtnClr,
                textStyle: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Get.toNamed(AppConstant.ROUTE_START_BROWSING, arguments: [
                {AppConstant.argUserType: _userType},
              ]);
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  // isApiRunning = true;
                });
                setState(() {
                  // getTokens();
                });
              }
            },
          )),
    );
  }

  Container buildSendButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, bottom: 10),
      height: 38,
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
                : const Text(
                    'SEND',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gibson',
                        color: Colors.white),
                  ),
            style: TextButton.styleFrom(
                //foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: AppColors.submitBtnClr)),
                backgroundColor: AppColors.submitBtnClr,
                textStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Get.toNamed(AppConstant.ROUTE_BUY_SEC_REG);
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  // isApiRunning = true;
                });
                setState(() {
                  // getTokens();
                });
              }
            },
          )),
    );
  }
}
