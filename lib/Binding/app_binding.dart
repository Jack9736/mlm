import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mlm/screens/BuyerScreen/BuyComplateRegScreen/buy_complete_reg_controller.dart';
import 'package:mlm/screens/BuyerScreen/BuyFirstRegScreen/buy_first_reg_controller.dart';
import 'package:mlm/screens/BuyerScreen/BuyHomeScreen/buy_home_controller.dart';
import 'package:mlm/screens/BuyerScreen/BuyORSellScreen/buy_sell_controller.dart';
import 'package:mlm/screens/BuyerScreen/BuySecondRegistrationScreen/buy_sec_reg_controller.dart';
import 'package:mlm/screens/FirstRegScreen/first_reg_controller.dart';
import 'package:mlm/screens/ForgotPasswordScreen/forgot_password_controller.dart';
import 'package:mlm/screens/SellerScreen/SellFirstRegScreen/sell_first_reg_controller.dart';
import 'package:mlm/screens/SellerScreen/SellSecRegScreen/sell_sec_reg_controller.dart';
import 'package:mlm/screens/StartBrowsingScreen/start_browsing_controller.dart';
import '../Network/http_service.dart';
import '../Service/StorageService.dart';
import '../Utils/constant.dart';
import 'package:mlm/screens/loginScreen/login_controller.dart';

import '../screens/PetProfileScreen/pet_profile_controller.dart';
import '../screens/RecentlyViewScreen/recently_view_controller.dart';
import 'package:mlm/screens/MyMessageScreen/my_messages_controller.dart';

import '../screens/SellerScreen/SellHomeScreen/sell_home_controller.dart';
import '../screens/BuyerScreen/BuySellerProfileScreen/buy_seller_profile_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.lazyPut(() => Logger());

    Get.put(StorageService());

    Get.put(HttpService().init(), tag: AppConstant.tagHttpService);

    Get.put(LoginController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(ForgotPasswordController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(BuySellController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(SellFirstRegController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(SellSecRegController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(FirstRegController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(BuyFirstRegController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(BuySecRegController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(BuyCompleteRegController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(StartBrowsingController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(BuyHomeController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(RecentlyViewController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(MymessagesController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(SellHomeController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(BuySellerProfileController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(ProfilePetController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));
  }
}
