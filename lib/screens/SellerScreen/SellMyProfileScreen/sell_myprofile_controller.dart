import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mlm/Network/http_service.dart';
import 'package:mlm/Service/StorageService.dart';

class SellMyProfileController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;

  HttpService httpService;

  SellMyProfileController({required this.httpService});


  var scaffoldKey = GlobalKey<ScaffoldState>();

  final storage = Get.find<StorageService>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
}
