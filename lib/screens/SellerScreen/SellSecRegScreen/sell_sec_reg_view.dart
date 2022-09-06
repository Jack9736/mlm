import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/enum/Method.dart';
import 'package:mlm/screens/SellerScreen/SellSecRegScreen/sell_sec_reg_controller.dart';

import '../../../Utils/constant.dart';
import '../../../Widget/widget_appbar.dart';

class SellSecRegView extends StatefulWidget {
  const SellSecRegView({Key? key}) : super(key: key);

  @override
  State<SellSecRegView> createState() => _SellSecRegViewState();
}

class _SellSecRegViewState extends State<SellSecRegView> {
  final _formKey = GlobalKey<FormState>();
  late String userName, password, sessionName;
  int radioGroup = 1;
  var userType = '';

  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SellSecRegController controller = Get.find();

  var memberListObs = "".obs;

  @override
  void initState() {
    super.initState();
    memberListObs.value = controller.memberList[0];
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
                          child: Obx(
                            () {
                              return ListView(children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                signUpText(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 30.0,
                                      right: 30.0,
                                      left: 30.0),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Colors.black,
                                        style: buildTextStyle(14),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter Business Name';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Breeder Business Name',
                                          labelStyle: buildTextStyle(16.0),
                                          hintText: 'Name',
                                          hintStyle: buildRadioTextStyle(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Colors.black,
                                        style: buildTextStyle(14),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter ABN Number';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'ABN (If applicable)',
                                          labelStyle: buildTextStyle(16.0),
                                          hintText: 'ABN Number',
                                          hintStyle: buildRadioTextStyle(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Colors.black,
                                        style: buildTextStyle(14),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter Phone number';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText:
                                              'Phone number (hidden to public)',
                                          labelStyle: buildTextStyle(16.0),
                                          hintText: 'Phone number',
                                          hintStyle: buildRadioTextStyle(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Colors.black,
                                        style: buildTextStyle(14),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter BIN Number';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText:
                                              'Breeder Identification Number (hidden to public)',
                                          labelStyle: buildTextStyle(16.0),
                                          hintText: 'BIN Number',
                                          hintStyle: buildRadioTextStyle(),
                                        ),
                                      ),
                                      const SizedBox(height: 35),
                                      Text(
                                          'Member of (may select more than one)',
                                          style: buildTextStyle(16.0)),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),
                                Column(children: [
                                  RadioListTile(
                                    value: controller.memberList[0],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[0],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[1],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[1],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[2],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[2],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[3],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[3],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[4],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[4],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[5],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[5],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[6],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[6],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[7],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[7],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[8],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[8],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[9],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[9],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[10],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[10],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  RadioListTile(
                                    value: controller.memberList[11],
                                    dense: true,
                                    groupValue: memberListObs.value,
                                    activeColor: AppColors.topHeaderBlueClr,
                                    title: Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Text(controller.memberList[11],
                                            style: buildRadioTextStyle())),
                                    onChanged: (String? value) {
                                      memberListObs.value = value!;
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 30.0, left: 50.0),
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                      style: buildTextStyle(14),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Others';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Others',
                                        labelStyle: buildTextStyle(18.0),
                                        hintText: 'Other',
                                        hintStyle: buildRadioTextStyle(),
                                      ),
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30.0, left: 30.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Colors.black,
                                        style: buildTextStyle(14),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter Member Number';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText:
                                              'Member Number (hidden to public)',
                                          labelStyle: buildTextStyle(18.0),
                                          hintText: 'Number',
                                          hintStyle: buildRadioTextStyle(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        textInputAction: TextInputAction.next,
                                        cursorColor: Colors.black,
                                        style: buildTextStyle(14),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter PSAA Number';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'PSAA Number',
                                          labelStyle: buildTextStyle(18.0),
                                          hintText: 'Number',
                                          hintStyle: buildRadioTextStyle(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ),
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

  TextStyle buildTextFormFieldStyle() {
    return const TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Gibson',
        color: AppColors.topHeaderBlueClr);
  }

  TextStyle buildRadioTextStyle() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        fontFamily: 'Gibson',
        color: AppColors.topHeaderBlueClr);
  }

  TextStyle buildTextStyle(double fontSize) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Gibson',
        color: AppColors.topHeaderBlueClr);
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
                {AppConstant.argUserType: UserType.seller},
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
