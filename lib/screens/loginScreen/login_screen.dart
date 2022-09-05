import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/widget_appbar.dart';

import 'package:mlm/screens/loginScreen/login_controller.dart';
import '../../Utils/constant.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late String userName, password, sessionName;

  var userType = '';
  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _showClearButton = false;

  LoginController controller = Get.find();

  var token;

  @override
  void initState() {
    super.initState();

    userNmController.addListener(() {
      setState(() {
        _showClearButton = userNmController.text.isNotEmpty;
      });
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppBar(title: "Welcome"),
        body: Form(

          key: _formKey,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [


                Expanded(
                    child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20.0,),
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        loginText(),
                        const SizedBox(height: 60),
                        const SizedBox(height: 20),
                        textEmailController(context),
                        const SizedBox(height: 20),
                        textPasswordController(context),
                        const SizedBox(height: 5),
                        forgotButton(context),
                        const SizedBox(height: 150,),

                      ],
                    ),

                  ),
                )),
                loginButton(context),
              ],
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

  /* Container Login Text */
  Container loginText() {
    return Container(
        width: double.infinity,
        child: Center(
          child:  Align(
           // alignment: Alignment.topLeft,
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 38.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Gibson',
                  color: AppColors.topHeaderBlueClr),
            ),
          ),
        ));
  }

  /* Login Button */
  Container loginButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, left: 15, right: 15),
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
          :  const Text('NEXT',  style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Gibson',
              color: Colors.white)
          ),

        style: TextButton.styleFrom(
            //foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
                side: BorderSide(color: AppColors.submitBtnClr)
            ),
            backgroundColor: AppColors.submitBtnClr,
            textStyle:
            const TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.bold)
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            setState(() {
              // isApiRunning = true;
            });
            Get.toNamed(AppConstant.ROUTE_FORGOT_PASSWORD);
          }
          //Get.toNamed(AppConstant.ROUTE_FORGOT_PASSWORD);
        },
      )),
    );
  }

  /* Forgot Password Button */
  Column forgotButton(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Get.toNamed(AppConstant.ROUTE_FORGOT_PASSWORD);
          },
          child:  Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "Forgot your password?Tap here for assistance",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Gibson',
                  color: AppColors.topHeaderBlueClr),
              //textAlign: TextAlign.center
            ),
          ),
        ),
      ],
    );
  }


  /* Email TextFiled */
  Container textEmailController(BuildContext context) {

    return Container(
      width: 110,
      child: TextFormField(
        cursorColor: Colors.black,
       // initialValue: 'admin',

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your email';
          }
          return null;
        },
        onSaved: (String? value) {
          userName = value!;
        },
        style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'Gibson',
            color: AppColors.topHeaderBlueClr),
        decoration: const InputDecoration(

            labelText: 'Email',
            labelStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'Gibson',
                color: AppColors.topHeaderBlueClr
            ),

            // border: OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.grey)),
            // focusedBorder: OutlineInputBorder(
            //   // width: 0.0 produces a thin "hairline" border
            //   borderSide: BorderSide(color: Colors.grey),
            // ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Colors.grey,
            //     width: 1.0,
            //   ),
            // ),
            // labelText: 'Email',
            // labelStyle: TextStyle(color:CtrPublic.blblTextColor),

            //contentPadding: const EdgeInsets.all(15),
           // hintText: 'Enter your email'
        ),
      ),
    );

  }

  /* Password TextFiled */
  Container textPasswordController(BuildContext context) {
    return Container(
      width: 110,
      child: TextFormField(
        cursorColor: Colors.black,
        //controller: passwordController,
        obscureText: _obscureText,
        //initialValue: 'Shannon123*',

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your password';
          }
          return null;
        },
        onSaved: (String? value) {
          password = value!;
        },
        style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'Gibson',
            color: AppColors.topHeaderBlueClr),
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey[300],
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _toggle();
                });
              },
            ),

            labelText: 'Password',
            labelStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'Gibson',
                color: AppColors.topHeaderBlueClr
            ),

            // border: const OutlineInputBorder(
            //     borderSide: BorderSide(color: Colors.grey)),
            // focusedBorder: const OutlineInputBorder(
            //   // width: 0.0 produces a thin "hairline" border
            //   borderSide: const BorderSide(color: Colors.grey),
            // ),
            // enabledBorder: const OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Colors.grey,
            //     width: 1.0,
            //   ),
            // ),
           // labelText: 'Password',
            //labelStyle: const TextStyle(color:CtrPublic.blblTextColor),

            //contentPadding: const EdgeInsets.all(15),
           // hintText: 'Enter your password'
        ),
      ),
    );
  }


}
class CtrPublic {
  static const Color blblTextColor = Color.fromRGBO(20, 38, 101, 1);
}