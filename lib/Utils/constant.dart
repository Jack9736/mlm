import 'package:flutter/material.dart';

class AppConstant {
  static final AppConstant _singleton = AppConstant._internal();

  factory AppConstant() {
    return _singleton;
  }

  AppConstant._internal();

  static const String TITLE_RECENTLY_VIEW = "RecentlyView";
  static const String TITLE_MY_MESSAGES = "My Messages";
  static const String TITLE_PET_PROFILE = "Pet Profile";
  static const String TITLE_FAVOURITE = "Favourites";
  static const String TITLE_MYPROFILE = "My Profile";

  static const String BASE_URL =
      "https://crmshannon.awdweb.com.au/webservice.php?";

  static const String STORAGE_NAME = "shannon_storage";

  static const String tagHttpService = "tagHttpService";

  static const String ROUTE = "/";
  static const String ROUTE_LOGIN = "/login";
  static const String ROUTE_FORGOT_PASSWORD = "/forgotPwd";
  static const String ROUTE_BUY_SELL = "/buysell";

  static const String ROUTE_FIRST_REG = "/FirstRegScreen";

  static const String ROUTE_BUY_FIRST_REG = "/BuyFirstRegView";
  static const String ROUTE_BUY_SEC_REG = "/BuySecRegView";
  static const String ROUTE_BUY_COMPLETE_REG = "/BuyCompleteRegView";
  static const String ROUTE_START_BROWSING = "/startBrowsingView";

  static const String ROUTE_SELL_FIRST_REG = "/SellFirstRegView";
  static const String ROUTE_SELL_SEC_REG = "/SellSecRegScreen";
  static const String ROUTE_SELL_HOME = "/SellHomeScreen";

  static const String ROUTE_BUY_HOME = "/BuyHomeScreen";
  static const String ROUTE_BUY_DRAWER = "/SideDrawer";
  static const String ROUTE_RECENTLY_VIEW = "/RecentlyView";
  static const String ROUTE_MY_MESSAGES = "/MyMessagesView";
  static const String ROUTE_FAVOURIRE = "/FavouriteView";
  static const String ROUTE_MY_PROFILE = "/MyProfileView";
  static const String ROUTE_SELLER_MY_PROFILE = "/SellerMyProfileView";
  static const String ROUTE_ADD_PET = "/AddPetView";

  static const String ROUTE_BREED_TYPE_SCREEN = "/BreedTypeScreen";
  static const String ROUTE_SEARCHFILTER_SCREEN = "/SearchFilterView";

  static const String ROUTE_PET_PROFILE_VIEW = "/PetProfileView";
  static const String ROUTE_BUY_SELLER_PROFILE_VIEW = "/BuySellerProfileView";
  static const String ROUTE_PET_ADD_VIEW = "/SellAddPetView";
  static const String ROUTE_SELL_PET_ADDED_VIEW = "/SellPetAddedView";
  static const String ROUTE_LOCATION_FILTER_VIEW = "/LocationFilterView";

  static const String prefUserDetail = "prefuserdetail";
  static const String prefIsInfoSeen = "prefisinfoseen";
  static const String prefCategoryDetail = "prefcategorydetail";
  static const String prefIsLogin = "prefislogin";
  static const String prefCartItem = "prefcartitem";
  static const String prefUserName = "prefusername";
  static const String prefPassword = "prefpassword";

  static const String argUserType = "userType";

  static const double appButtonSize = 50;

  static var deviceType = "android";

  List<String> filterTypeStringList = [
    "TYPE",
    "BREED",
    "AGE",
    "LOCATION",
    "SIZE",
    "GENDER",
    "PERSONALITY",
    "CRAATE TRAINED",
    "TRANSPORT",
    "VET CHECKED",
  ];

  List<String> typeOptionList = [
    "PURE BREED",
    "CROSS BREED",
    "STUD (SIRE/DAM)",
    "RESCUE"
  ];

 List<String> distanceOptionList = [
    "5 KM",
    "10 KM",
    "20 KM",
    "50 - 100 KM",
    "+ 100 KM"
  ];

  List<String> ageOptionList = [
    "8 WEEKS - 6 MONTHS",
    "7 MONTHS - 12 MONTHS",
    "13 MONTHS - 23 MONTHS",
    "2 - 5 YEARS",
    "OVER 5 YEARS"
  ];

  List<String> sizeOptionList = [
    "MINIATURE",
    "SMALL",
    "MEDIUM",
    "LARGE",
    "EXTRA LARGE",
  ];

  List<String> genderOptionList = [
    "MALE",
    "FEMALE",
  ];

  List<String> personalityOptionList = [
    "GOOD WITH KIDS",
    "GOOD WITH SENIORS",
    "SLEEPY /QUIET",
    "CLEVER",
    "VERY EXCITABLE",
    "PROTECTIVE",
  ];

  List<String> commonYesNoOptionList = [
    "YES",
    "NO",
  ];
}
