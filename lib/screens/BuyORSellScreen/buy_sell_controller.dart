import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';


import '../../Network/http_service.dart';
import 'package:dio/dio.dart' as d;

import '../../Service/StorageService.dart';
import '../../Utils/constant.dart';

class BuySellController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  HttpService httpService;

  BuySellController({required this.httpService});

  final storage = Get.find<StorageService>();


}