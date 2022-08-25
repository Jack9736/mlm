
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/screens/loginScreen/login_controller.dart';
import 'package:mlm/Utils/constant.dart';
import '../../Widget/widget_appbar.dart';

class BuyCompleteRegView extends StatefulWidget {
  const BuyCompleteRegView({Key? key}) : super(key: key);

  @override
  State<BuyCompleteRegView> createState() => _BuyCompleteRegViewState();
}

class _BuyCompleteRegViewState extends State<BuyCompleteRegView> {
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

  @override
  Widget build(BuildContext context) {
    var horizontalPadding = 38.0;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                  children: <Widget>[
                    buildSignUpLabelText(),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                                textCapitalization: TextCapitalization.sentences,
                                textInputAction: TextInputAction.next,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                // Only numbers can be entered
                                cursorColor: Colors.black,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                    suffixIcon: buildSendButton(context),

                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Gibson',
                                      color: AppConstant.topHeaderBlueClr
                                  ),
                                    // hintStyle: TextStyle(
                                    //     fontSize: 15.0,
                                    //     fontWeight: FontWeight.w400,
                                    //     fontFamily: 'Gibson',
                                    //     color: AppConstant.topHeaderBlueClr),
                                    // hintText: "Phone Number"
                                  )
                            ),
                            const SizedBox(height: 10),
                            const Text("You can send another code in 30 seconds", style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Gibson',
                                color: AppConstant.topHeaderBlueClr),),
                            const SizedBox(height: 40),
                            const Text(
                              "Phone Number Verification Code",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Gibson',
                                  color: AppConstant.topHeaderBlueClr),
                            ),
                            TextField(
                                textCapitalization: TextCapitalization.sentences,
                                textInputAction: TextInputAction.next,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],

                                maxLength: 5,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                // Only numbers can be entered
                                cursorColor: Colors.black,

                                decoration: const InputDecoration(
                                    counterText: "",
                                    labelText: '5 digit code here',
                                    labelStyle: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Gibson',
                                        color: AppConstant.topHeaderBlueClr
                                    ),
                                    // hintStyle: TextStyle(
                                    //     fontSize: 15.0,
                                    //     fontWeight: FontWeight.w300,
                                    //     fontFamily: 'Gibson',
                                    //     color: AppConstant.topHeaderBlueClr),
                                    //hintText: "5 digit code here"
                                ),

                            ),
                            const SizedBox(height: 40),
                            //bodyContent(),


                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: horizontalPadding),
                      child: nextButton(context),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
  bodyContent(){
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(12),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://picsum.photos/600"),
                        fit: BoxFit.cover
                    )
                ),
                child: Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                        "Some Text",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70
                        )
                    )
                )
            )
        )
    );
  }


  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /* Container Sign Up Text */
  Container buildSignUpLabelText() {
    return Container(
        margin: const EdgeInsets.only(
            top: 30.0, bottom: 0.0, left: 30.0, right: 0.0),
        width: double.infinity,
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Complete Sign Up",
              style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Gibson',
                  color: AppConstant.topHeaderBlueClr),
            ),
          ),
        ));
  }

  /* Next Button */
  SizedBox nextButton(BuildContext context) {
    return SizedBox(
      height: 50,
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
                : const Text(
                    'VERIFY', style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Gibson',
                color: Colors.white),
                  ),
            style: TextButton.styleFrom(
                //foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: AppConstant.submitBtnClr)),
                backgroundColor: AppConstant.submitBtnClr,
                textStyle: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Get.toNamed(AppConstant.ROUTE_START_BROWSING);
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

  Container buildSendButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, bottom: 10),
      height: 38,
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
                : Text(
                    'SEND', style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Gibson',
                color: Colors.white),
                  ),
            style: TextButton.styleFrom(
                //foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: AppConstant.submitBtnClr)),
                backgroundColor: AppConstant.submitBtnClr,
                textStyle: const TextStyle(
                    fontSize: 12,
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
