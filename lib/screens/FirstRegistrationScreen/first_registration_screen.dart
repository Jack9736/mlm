import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mlm/Utils/constant.dart';

import 'package:mlm/screens/FirstRegistrationScreen/first_registration_controller.dart';

class FirstRegistrationScreen extends StatefulWidget {
  @override
  State<FirstRegistrationScreen> createState() => _FirstRegistrationScreenState();
}

class _FirstRegistrationScreenState extends State<FirstRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late String userName, password, sessionName;

  var userType = '';
  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _showClearButton = false;

  FirstRegistrationController controller = Get.find();

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

        appBar: PreferredSize(
            preferredSize: Size.fromHeight(10.0), // here the desired height
            child: AppBar(
              backgroundColor: AppConstant.topHeaderClr,
              elevation: 0.0,
              centerTitle: false,
              titleSpacing: 0.0,

            )
        ),
        body: Form(
          key: _formKey,
          child: Container(

            color: Colors.white,
            padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 20.0,),


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
                  loginBuyerButton(context),
                  const SizedBox(height: 30),
                  createAccountButton(context),

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

  /* Login as a Buyer Button */
  Container loginBuyerButton(BuildContext context) {
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
                backgroundColor: Colors.black,
                strokeWidth: 2,
              ),
            ),
          ],
        )
            :  Text('Login as Buyer',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
            fontFamily: 'Gibson',
                color: AppConstant.submitBtnClr)
        ),
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
                side: BorderSide(color: AppConstant.submitBtnClr)
            ),
            primary: Colors.white,
            backgroundColor: Colors.white,

        ),
        onPressed: () {
          Get.toNamed(AppConstant.ROUTE_LOGIN);
          // Navigator.of(context).pushNamed(AppConstant.ROUTE_FIRST_REGISTRATION);

          //Get.to(FirstRegistrationsScreen());
        },
      )),
    );
  }

  /* Sell Pet Button */
  Container createAccountButton(BuildContext context) {
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
            : Text('CREATE ACCOUNT',
            style: TextStyle(
                fontSize: 15.0,
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

        ),
        onPressed: () {

          Get.toNamed(AppConstant.ROUTE_SIGNUP_STEP_ONE);
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            setState(() {
              // isApiRunning = true;
            });

            // controller.getToken(userName,password);
          }
        },
      )),
    );
  }


}