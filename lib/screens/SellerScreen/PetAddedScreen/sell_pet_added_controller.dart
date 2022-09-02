import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';


import 'package:dio/dio.dart' as d;
import 'package:mlm/Network/http_service.dart';
import 'package:mlm/Service/StorageService.dart';



class PetAddedController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  HttpService httpService;

  PetAddedController({required this.httpService});

  final storage = Get.find<StorageService>();


}
