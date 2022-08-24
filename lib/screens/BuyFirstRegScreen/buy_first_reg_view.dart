import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mlm/screens/loginScreen/login_controller.dart';
import 'package:mlm/Utils/constant.dart';
import '../../Widget/widget_appbar.dart';

class BuyFirstRegView extends StatefulWidget {
  const BuyFirstRegView({Key? key}) : super(key: key);

  @override
  State<BuyFirstRegView> createState() => _BuyFirstRegViewState();
}

class _BuyFirstRegViewState extends State<BuyFirstRegView> {
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

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppBar(title: "Create Account"),
        body: SafeArea(
          bottom: true,
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    signUpText(),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 30.0, bottom: 0.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter first name';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          firstName = value!;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelText: 'First Name*',
                            labelStyle:
                                TextStyle(color: AppConstant.topHeaderBlueClr),
                            hintText: 'First Name'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 0.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter last name';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          lastName = value!;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelText: 'Last Name*',
                            labelStyle:
                                TextStyle(color: AppConstant.topHeaderBlueClr),
                            hintText: 'Last Name'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 0.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        cursorColor: Colors.black,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Passcode(hidden to public)';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          firstName = value!;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelText: 'Passcode (hidden to public)*',
                            labelStyle:
                                TextStyle(color: AppConstant.topHeaderBlueClr),
                            hintText: 'Passcode (hidden to public)'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 0.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        validator: (value) {
                          bool validEmail = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value!);
                          if (value.isEmpty || !validEmail) {
                            return 'Enter your email address';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          email = value!;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelText: 'Email (hidden to public)*',
                            labelStyle:
                                TextStyle(color: AppConstant.topHeaderBlueClr),
                            hintText: 'Enter your email address'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 0.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        obscureText: _obscureText,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        validator: (value) {
                          confirmPass = value;

                          if (value == null || value.isEmpty) {
                            return 'Enter valid password';
                          }
                          if (value.length < 8) {
                            return 'Your password must be more than 8 characters';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          password = value!;
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey[300],
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _toggle();
                                });
                              },
                            ),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            labelText: 'Create Password',
                            labelStyle: const TextStyle(
                                color: AppConstant.topHeaderBlueClr),
                            hintText: 'Create Password'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 20.0, left: 30.0, right: 30.0),
                      width: 160,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        obscureText: _obscureText,
                        //textInputAction: TextInputAction.next,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Re-enter valid password';
                          } else if (value.length < 8) {
                            return 'Your password must be more than 8 characters';
                          } else if (value != confirmPass) {
                            return "Password must be same as above";
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          confirmPwd = value!;
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey[300],
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _toggle();
                                });
                              },
                            ),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(
                                color: AppConstant.topHeaderBlueClr),
                            hintText: 'Confirm Password'),
                      ),
                    ),
                    const SizedBox(height: 55),
                    nextButton(context),
                  ],
                )),
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
            top: 30.0, bottom: 0.0, left: 30.0, right: 0.0),
        width: double.infinity,
        child: const Center(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 40.0,
                  color: AppConstant.topHeaderBlueClr,
                  fontFamily: 'Barlow'),
            ),
          ),
        ));
  }

  /* Next Button */
  Container nextButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, left: 30, right: 30),
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
                : const Text(
                    'NEXT',
                  ),
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: AppConstant.submitBtnClr)),
                backgroundColor: AppConstant.submitBtnClr,
                textStyle: const TextStyle(
                    fontSize: 18,
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
