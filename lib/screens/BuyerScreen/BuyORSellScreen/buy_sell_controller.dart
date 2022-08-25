import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mlm/Network/http_service.dart';
import 'package:mlm/Service/StorageService.dart';

class BuySellController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  HttpService httpService;

  BuySellController({required this.httpService});

  final storage = Get.find<StorageService>();
}
