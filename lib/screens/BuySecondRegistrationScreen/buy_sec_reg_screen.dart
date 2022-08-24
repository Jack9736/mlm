import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';

import 'package:mlm/screens/BuySecondRegistrationScreen/buy_sec_reg_controller.dart';
import 'package:mlm/Utils/constant.dart';

class BuySecRegScreen extends StatefulWidget {
  @override
  State<BuySecRegScreen> createState() => _BuySecRegScreenState();
}

class _BuySecRegScreenState extends State<BuySecRegScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late String userName, password, sessionName;
  int radioGroup = 1;
  var userType = '';
  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  BuySecRegControllerController controller = Get.find();

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
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(10.0), // here the desired height
            child: AppBar(
              backgroundColor: AppConstant.topHeaderClr,
              elevation: 0.0,
              centerTitle: false,
              titleSpacing: 0.0,

            )
        ),
        body: SafeArea(
          bottom: true,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 70,
                        color:AppConstant.topHeaderBlueClr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),

                            Center(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Create Account',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Gibson',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 25, width: 25,),

                          ],
                        ),

                    ),

                    signUpText(),
                    const SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.all(30),
                      child: Text('Have you got kids?') ,
                    ),
                    Radio(
                      value: 1,
                      groupValue: radioGroup,
                      onChanged: (T){
                        print(T);

                        setState(() {
                          
                        });
                      },
                    )
                  ],
                ),
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

  /* Container Sign Up Text */
  Container signUpText() {
    return Container(
        margin: EdgeInsets.only(top:30.0, bottom: 0.0, left: 30.0, right: 0.0),
        width: double.infinity,
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 40.0, color: AppConstant.topHeaderBlueClr, fontFamily: 'Barlow'),
          ),
        ));
  }





}
