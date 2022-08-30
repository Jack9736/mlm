import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';

import 'package:mlm/Utils/constant.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/enum/Method.dart';
import 'package:mlm/screens/BuyerScreen/BuySecondRegistrationScreen/buy_sec_reg_controller.dart';

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class BuySecRegView extends StatefulWidget {
  const BuySecRegView({Key? key}) : super(key: key);

  @override
  State<BuySecRegView> createState() => _BuySecRegViewState();
}

class _BuySecRegViewState extends State<BuySecRegView> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late String userName, password, sessionName;
  int radioGroup = 1;
  var userType = '';

  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  BuySecRegController controller = Get.find();

  var token;

  Rx<BestTutorSite> site = BestTutorSite.javatpoint.obs;
  var kidsListObs = "".obs;
  var liveInTypeListObs = "".obs;
  var otherPetsListObs = "".obs;
  var insurePetsListObs = "".obs;

  @override
  void initState() {
    super.initState();
    kidsListObs.value = controller.kidsList[0];
    liveInTypeListObs.value = controller.liveInTypeList[0];
    otherPetsListObs.value = controller.otherPetsList[0];
    insurePetsListObs.value = controller.insurePetsList[0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                children: [
                  Expanded(
                      child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            right: 15.0,
                            top: 20.0,
                          ),
                          child: Obx(
                            () {
                              return ListView(children: [
                                signUpText(),
                                const SizedBox(height: 15),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 0.0,
                                      left: 30.0,
                                      right: 0.0),
                                  child: const Text('Have you got kids?',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Gibson',
                                          color: AppColors.topHeaderBlueClr)),
                                ),
                                Column(children: [
                                  RadioListTile(
                                    dense: true,
                                    value: controller.kidsList[0],
                                    groupValue: kidsListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('Kids under 5 years',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      kidsListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    dense: true,
                                    value: controller.kidsList[1],
                                    groupValue: kidsListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('Kids 5-12 years',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      kidsListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.kidsList[2],
                                    dense: true,
                                    groupValue: kidsListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('Teenagers',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      kidsListObs.value = value!;
                                    },
                                  )
                                ]),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 0.0,
                                      left: 30.0,
                                      right: 0.0),
                                  child: const Text(
                                      'What type of dwelling do you live in?',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Gibson',
                                          color: AppColors.topHeaderBlueClr)),
                                ),
                                Column(children: [
                                  RadioListTile(
                                    dense: true,
                                    value: controller.liveInTypeList[0],
                                    groupValue: liveInTypeListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('House',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      liveInTypeListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.liveInTypeList[1],
                                    dense: true,
                                    groupValue: liveInTypeListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('Apartment',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      liveInTypeListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.liveInTypeList[2],
                                    dense: true,
                                    groupValue: liveInTypeListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('Acreage',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      liveInTypeListObs.value = value!;
                                    },
                                  )
                                ]),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 0.0,
                                      left: 30.0,
                                      right: 0.0),
                                  child: const Text('Any other pets',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Gibson',
                                          color: AppColors.topHeaderBlueClr)),
                                ),
                                Column(children: [
                                  RadioListTile(
                                    value: controller.otherPetsList[0],
                                    dense: true,
                                    groupValue: otherPetsListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('Yes',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      otherPetsListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.otherPetsList[1],
                                    dense: true,
                                    groupValue: otherPetsListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('No',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      otherPetsListObs.value = value!;
                                    },
                                  ),
                                ]),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 0.0,
                                      left: 30.0,
                                      right: 0.0),
                                  child: const Text('Will you insure your pet?',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Gibson',
                                          color: AppColors.topHeaderBlueClr)),
                                ),
                                Column(children: [
                                  RadioListTile(
                                    value: controller.insurePetsList[0],
                                    dense: true,
                                    groupValue: insurePetsListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('Yes',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      insurePetsListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.insurePetsList[1],
                                    dense: true,
                                    groupValue: insurePetsListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('No',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      insurePetsListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    // contentPadding: EdgeInsets.only(top: -10.0, bottom: 0.0,),

                                    value: controller.insurePetsList[2],
                                    dense: true,
                                    groupValue: insurePetsListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: const Text('Not sure',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Gibson',
                                                color: AppColors
                                                    .topHeaderBlueClr))),
                                    onChanged: (String? value) {
                                      insurePetsListObs.value = value!;
                                    },
                                  ),
                                ]),
                                nextButton(context),
                              ]);
                            },
                          )))
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
        margin: const EdgeInsets.only(
            top: 0.0, bottom: 0.0, left: 30.0, right: 0.0),
        width: double.infinity,
        child: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.w300,
                fontFamily: 'Gibson',
                color: AppColors.topHeaderBlueClr),
          ),
        ));
  }

  /* Next Button */
  Container nextButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0, left: 30, right: 30),
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
                : const Text('NEXT',
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
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Gibson',
                    color: Colors.white)),
            onPressed: () {
              Get.toNamed(AppConstant.ROUTE_BUY_COMPLETE_REG, arguments: [
                {AppConstant.argUserType: UserType.buyer},
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
}
