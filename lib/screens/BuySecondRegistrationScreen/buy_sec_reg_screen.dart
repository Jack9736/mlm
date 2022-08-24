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


                  Expanded(
                      child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 20.0,),

                          child:Container(
                            color: Colors.white,
                            child: ListView(
                              shrinkWrap: true,
                                children:[
                                  signUpText(),
                                  const SizedBox(height: 15),
                                  Container(
                                    margin: EdgeInsets.only(top: 20, bottom: 0.0, left: 30.0, right: 0.0),
                                    child: Text('Have you got kids?') ,
                                  ),
                                  Column
                                    (
                                      children:[
                                        RadioListTile(
                                          dense:true,
                                          value: 1,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('Kids under 5 years',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);
                                            setState(() {
                                            });

                                          },
                                        ),
                                        RadioListTile(
                                          dense:true,
                                          value: 2,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('Kids 5-12 years',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);
                                            setState(() {
                                            });
                                          },
                                        ),
                                        RadioListTile(
                                          value: 3,
                                          dense:true,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('Teenagers',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);

                                          },
                                        )
                                      ]

                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 0.0, left: 30.0, right: 0.0),
                                    child: Text('What type of dwelling do you live in?') ,
                                  ),
                                  Column
                                    (
                                      children:[
                                        RadioListTile(
                                          dense:true,
                                          value: 1,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('House',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);
                                            setState(() {
                                            });

                                          },
                                        ),
                                        RadioListTile(
                                          value: 2,
                                          dense:true,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('Apartment',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);
                                            setState(() {
                                            });
                                          },
                                        ),
                                        RadioListTile(
                                          value: 3,
                                          dense:true,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('Acreage',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);

                                          },
                                        )
                                      ]

                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 0.0, left: 30.0, right: 0.0),
                                    child: Text('Any other pets') ,
                                  ),
                                  Column
                                    (
                                      children:[
                                        RadioListTile(
                                          value: 1,
                                          dense:true,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('Yes',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);
                                            setState(() {
                                            });

                                          },
                                        ),
                                        RadioListTile(
                                          value: 2,
                                          dense:true,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('No',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);
                                            setState(() {
                                            });
                                          },
                                        ),

                                      ]

                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 0.0, left: 30.0, right: 0.0),
                                    child: Text('Will you insure your pet?') ,
                                  ),
                                  Column
                                    (
                                      children:[
                                        RadioListTile(
                                          value: 1,
                                          dense:true,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('Yes',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);
                                            setState(() {
                                            });

                                          },
                                        ),
                                        RadioListTile(
                                          value: 2,
                                          dense:true,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('No',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);
                                            setState(() {
                                            });
                                          },
                                        ),
                                        RadioListTile(
                                          // contentPadding: EdgeInsets.only(top: 0.0, bottom: 20.0,),

                                          value: 2,
                                          dense:true,
                                          groupValue: radioGroup,
                                          title: Transform.translate(
                                              offset: const Offset(-20, 0),
                                              child: Text('Not sure',
                                                  style: TextStyle(fontSize: 14))),
                                          onChanged: (T){
                                            print(T);
                                            setState(() {
                                            });
                                          },
                                        ),
                                      ]

                                  ),

                                  nextButton(context),
                              ]

                            ),
                          )

                  ))

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

  /* Container Sign Up Text */
  Container signUpText() {
    return Container(
        margin: EdgeInsets.only(top:0.0, bottom: 0.0, left: 30.0, right: 0.0),
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


  /* Next Button */
  Container nextButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 0, left: 30, right: 30),
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
            : const Text('NEXT', ),
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
