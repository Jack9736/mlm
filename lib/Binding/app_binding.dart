import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../Network/http_service.dart';
import '../Service/StorageService.dart';
import '../Utils/constant.dart';
import 'package:mlm/screens/loginScreen/login_controller.dart';
import 'package:mlm/screens/BuyORSellScreen/buy_sell_controller.dart';
import 'package:mlm/screens/FirstRegistrationScreen/first_registration_controller.dart';
import 'package:mlm/screens/ForgotPasswordScreen/forgot_password_controller.dart';
import 'package:mlm/screens/SignUpStepOne/signUp_step_one_controller.dart';
import 'package:mlm/screens/BuySecondRegistrationScreen/buy_sec_reg_controller.dart';
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

    Get.put(FirstRegistrationController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(SignUpStepOneController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));

    Get.put(BuySecRegControllerController(
        httpService: Get.find(tag: AppConstant.tagHttpService)));








  }
}
