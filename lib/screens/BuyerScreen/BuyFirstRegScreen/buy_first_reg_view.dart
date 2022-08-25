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
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/loginScreen/login_controller.dart';
import 'package:mlm/Utils/constant.dart';

class BuyFirstRegView extends StatefulWidget {
  const BuyFirstRegView({Key? key}) : super(key: key);

  @override
  State<BuyFirstRegView> createState() => _BuyFirstRegViewState();
}

class _BuyFirstRegViewState extends State<BuyFirstRegView> {
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
        appBar: const CustomAppBar(title: "Create Account",),
        body: SafeArea(
          bottom: true,
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    signUpText(),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 30.0, bottom: 0.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gibson',
                            color: AppColors.topHeaderBlueClr),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter first name';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          firstName = value!;
                        },
                        decoration: const InputDecoration(
                          labelText: 'First Name*',
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gibson',
                              color: AppColors.topHeaderBlueClr
                          ),

                          //hintText: 'First Name'
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 0.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gibson',
                            color: AppColors.topHeaderBlueClr),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter last name';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          lastName = value!;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Last Name*',
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gibson',
                              color: AppColors.topHeaderBlueClr
                          ),
                          //hintText: 'Last Name'
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 0.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        cursorColor: Colors.black,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gibson',
                            color: AppColors.topHeaderBlueClr),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Passcode(hidden to public)';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          firstName = value!;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Passcode (hidden to public)*',
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gibson',
                              color: AppColors.topHeaderBlueClr
                          ),
                          //hintText: 'Passcode (hidden to public)'
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 0.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gibson',
                            color: AppColors.topHeaderBlueClr),
                        validator: (value) {
                          bool validEmail = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value!);
                          if (value.isEmpty || !validEmail) {
                            return 'Enter your email address';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          email = value!;
                        },
                        decoration: const InputDecoration(

                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gibson',
                              color: AppColors.topHeaderBlueClr
                          ),
                          labelText: 'Enter your email address (hidden to public)*',

                          // hintText: 'Enter your email address'
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 0.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        obscureText: _obscureText,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gibson',
                            color: AppColors.topHeaderBlueClr),
                        validator: (value) {
                          confirmPass = value;

                          if (value == null || value.isEmpty) {
                            return 'Enter valid password';
                          }
                          if (value.length < 8) {
                            return 'Your password must be more than 8 characters';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          password = value!;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey[300],
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _toggle();
                              });
                            },
                          ),

                          labelText: 'Create Password',
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gibson',
                              color: AppColors.topHeaderBlueClr
                          ),

                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 20.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        obscureText: _obscureText,
                        //textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gibson',
                            color: AppColors.topHeaderBlueClr),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Re-enter valid password';
                          } else if (value.length < 8) {
                            return 'Your password must be more than 8 characters';
                          } else if (value != confirmPass) {
                            return "Password must be same as above";
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          confirmPwd = value!;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey[300],
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _toggle();
                              });
                            },
                          ),

                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gibson',
                              color: AppColors.topHeaderBlueClr
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 55),
                    nextButton(context),
                  ],
                )),
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

  /* Container Sign Up Text */
  Container signUpText() {
    return Container(
        margin: const EdgeInsets.only(
            top: 30.0, bottom: 0.0, left: 30.0, right: 0.0),
        width: double.infinity,
        child: const Center(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Sign Up",
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
  Container nextButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, left: 30, right: 30),
      height: 60,
      width: double.infinity,
      child: Obx(() =>
          TextButton(
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
                'NEXT', style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Gibson',
                color: Colors.white)
            ),
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
