import 'package:flutter/material.dart';

class AppConstant {

  static const String BASE_URL = "https://crmshannon.awdweb.com.au/webservice.php?";

  static Color submitBtnClr = Color.fromRGBO(214, 74, 76, 1);
  static Color topHeaderClr = Color.fromRGBO(87, 188, 223, 1);
  static Color topHeaderBlueClr = Color.fromRGBO(20, 38, 101, 1);
  static final String STORAGE_NAME = "shannon_storage";


  static const String tagHttpService = "tagHttpService";

  static final String ROUTE = "/";
  static final String ROUTE_LOGIN = "/login";
  static final String ROUTE_FORGOT_PASSWORD = "/forgotPwd";
  static final String ROUTE_BUY_SELL = "/buysell";
  static final String ROUTE_FIRST_REGISTRATION = "/firstRegistration";
  static final String ROUTE_SIGNUP_STEP_ONE = "/signUpStepOne";
  static final String ROUTE_BUY_SEC_REG = "/buySecReg";



  static const String prefUserDetail = "prefuserdetail";
  static const String prefIsInfoSeen = "prefisinfoseen";
  static const String prefCategoryDetail = "prefcategorydetail";
  static const String prefIsLogin = "prefislogin";
  static const String prefCartItem = "prefcartitem";
  static const String prefUserName = "prefusername";
  static const String prefPassword = "prefpassword";

  static var deviceType = "android";
}
