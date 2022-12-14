import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Service/StorageService.dart';
import 'constant.dart';

class Helper {
  static final Helper _singleton = Helper._internal();

  final storage = Get.find<StorageService>();

  factory Helper() {
    return _singleton;
  }

  Helper._internal();

  // Handler({this.errorString, this.retryPressed});

  Future loading() => showDialog(
      barrierDismissible: false,
      builder: (ctx) => Center(
          child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: 60,
              height: 60,
              child: const CircularProgressIndicator(
                strokeWidth: 1.5,
                semanticsLabel: "Loading",
              ))),
      context: Get.context!);

  void errorSnackBar(String msg) => Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      message: msg,
      title: 'Error!',
      duration: const Duration(seconds: 3));

  void noInternetSnackBar() => Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      message: "Please check your Internet Connection!",
      title: 'No Internet');

  void getInternetSnackBar() => Get.rawSnackbar(
      snackPosition: SnackPosition.BOTTOM,
      message: "Internet connection has been restored",
      title: 'Internet Restored');

  void openLoginDialog(String title, String msg, String screenName) {
    Get.dialog(AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: [
        // The "Login" button
        TextButton(
            onPressed: () {
              Get.back();
              // Get.toNamed(AppConstant.routeLogin,
              //     parameters: {AppConstant.argScreenName: screenName});
            },
            child: const Text('Login')),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'))
      ],
    ));
  }

  bool checkIsUserIsLogin() {
    return storage.getBool(AppConstant.prefIsLogin) ?? false;
  }

}
