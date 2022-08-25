import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Widget/widget_appbar.dart';

import 'package:mlm/screens/loginScreen/login_controller.dart';
import '../../Utils/constant.dart';



class StartBrowsingView extends StatefulWidget {
  const StartBrowsingView({Key? key}) : super(key: key);

  @override
  State<StartBrowsingView> createState() => _StartBrowsingViewState();
}

class _StartBrowsingViewState extends State<StartBrowsingView> {
  final _formKey = GlobalKey<FormState>();




  bool _showClearButton = false;

  LoginController controller = Get.find();

  var token;

  @override
  void initState() {
    super.initState();

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

                  child: Center(
                    child: ListView(

                      shrinkWrap: true,
                      children: [
                        welcomeToText(),
                        welcomeText(),
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
                startBrowsingButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }




  /* Container Welcome Text */
  Container welcomeToText() {
    return Container(
        margin: const EdgeInsets.only(
            top: 10.0, bottom: 0.0, left: 30.0, right: 0.0),
        width: double.infinity,
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Welcome to",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Gibson',
                  color: AppConstant.topHeaderBlueClr),
            ),
          ),
        ));
  }
  Container welcomeText() {
    return Container(
        margin: const EdgeInsets.only(
            top: 10.0, bottom: 20.0, left: 30.0, right: 0.0),
        width: double.infinity,
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "My Little Mate",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Gibson',
                  color: AppConstant.topHeaderBlueClr),
            ),
          ),
        ));
  }

  /* Start Browsing Button */
  Container startBrowsingButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, left: 15, right: 15),

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
            :  const Text('START BROWSING',  style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Gibson',
            color: Colors.white)
        ),

        style: TextButton.styleFrom(
          //foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
                side: BorderSide(color: AppConstant.submitBtnClr)
            ),
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
            //Get.toNamed(AppConstant.ROUTE_FORGOT_PASSWORD);
          }
          //Get.toNamed(AppConstant.ROUTE_FORGOT_PASSWORD);
        },
      )),
    );
  }









}
