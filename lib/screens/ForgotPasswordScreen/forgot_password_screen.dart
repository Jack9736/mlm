import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Widget/widget_appbar.dart';

import 'package:mlm/screens/loginScreen/login_controller.dart';

import 'package:mlm/Utils/constant.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
        appBar: const CustomAppBar(title: "Help"),
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

                        forgotText(),
                        const SizedBox(height: 30),
                        resetLinkText(),
                        const SizedBox(height: 30),
                        textEmailController(context),
                        const SizedBox(height: 60),



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
  Container forgotText() {
    return Container(
        width: double.infinity,
        child: Center(
          child:  Align(
            // alignment: Alignment.topLeft,
            child: Text(
              "Forgot Password",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Gibson',
                  color: AppConstant.topHeaderBlueClr),
            ),
          ),
        ));
  }

  /* Container Reset Link Text */
  Container resetLinkText() {
    return Container(
        width: double.infinity,
        child: Center(
          child:  Align(
            // alignment: Alignment.topLeft,
            child: Text(
              "A password reset link will be sent to your email",
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Gibson',
                  color: AppConstant.topHeaderBlueClr),
            ),
          ),
        ));
  }

  /* Login Button */
  Container loginButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40, left: 15, right: 15),
      height: 60,
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
            :  Text('SUBMIT',
            style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Gibson',
            color: Colors.white)
        ),
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
                side: BorderSide(color: AppConstant.submitBtnClr)
            ),
            primary: Colors.white,
            backgroundColor: AppConstant.submitBtnClr,
            textStyle:
            const TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.bold)
        ),
        onPressed: () {
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
            color: AppConstant.topHeaderBlueClr),
        decoration:  InputDecoration(

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

            labelText: 'Email',
            labelStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'Gibson',
                color: AppConstant.topHeaderBlueClr
            ),
           // labelText: 'Email',
            //labelStyle: TextStyle(color:AppConstant.topHeaderBlueClr),

            //contentPadding: const EdgeInsets.all(15),
           // hintText: 'Enter your email'
        ),
      ),
    );

  }

}
