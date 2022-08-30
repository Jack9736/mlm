import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/enum/Method.dart';
import '../../Widget/widget_appbar.dart';
import 'first_reg_controller.dart';

class FirstRegScreen extends StatefulWidget {
  const FirstRegScreen({Key? key}) : super(key: key);

  @override
  State<FirstRegScreen> createState() => _FirstRegScreenState();
}

class _FirstRegScreenState extends State<FirstRegScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late String userName, password, sessionName;

  var userType = '';
  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _showClearButton = false;

  FirstRegController controller = Get.find();

  var token;

  UserType _userType = UserType.buyer;

  @override
  void initState() {
    super.initState();

    userNmController.addListener(() {
      setState(() {
        _showClearButton = userNmController.text.isNotEmpty;
      });
    });

    readArgument();
  }

  void readArgument() {
    var argumentData = Get.arguments;
    _userType = argumentData[0][AppConstant.argUserType];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppBar(
          backgroundColor: Colors.white,
          backIconColor: AppColors.topHeaderBlueClr,
        ),
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 20.0,
            ),
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
  SizedBox loginBuyerButton(BuildContext context) {
    return SizedBox(
      height: AppConstant.appButtonSize,
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
                : Text(
                    _userType == UserType.buyer
                        ? 'Login as Buyer'
                        : 'Login as Seller',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Gibson',
                        color: AppColors.submitBtnClr)),
            style: TextButton.styleFrom(
              //foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: AppColors.submitBtnClr)),
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Get.toNamed(AppConstant.ROUTE_LOGIN);
            },
          )),
    );
  }

  /* Create Account Button */
  SizedBox createAccountButton(BuildContext context) {
    return SizedBox(
      height: AppConstant.appButtonSize,
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
                : const Text('CREATE ACCOUNT',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gibson',
                        color: Colors.white)),
            style: TextButton.styleFrom(
              //foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: AppColors.submitBtnClr)),
              backgroundColor: AppColors.submitBtnClr,
            ),
            onPressed: () {
              Get.toNamed(
                  _userType == UserType.buyer
                      ? AppConstant.ROUTE_BUY_FIRST_REG
                      : AppConstant.ROUTE_SELL_FIRST_REG,
                  arguments: [
                    {AppConstant.argUserType: _userType},
                  ]);
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
          )),
    );
  }
}
