import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../Network/http_service.dart';
import '../../../Service/StorageService.dart';

class SellSecRegController extends GetxController {
  Logger logger = Get.find();

  List<String> memberList = [
    "ANKC",
    "Dogs NSW",
    "Dogs Victoria",
    "Dogs West",
    "Dogs SA",
    "Canine Control Council of Queensland",
    "Tasmanian Canine Association",
    "Dogs NT",
    "AAPDB",
    "MDBA",
    "RBPA",
    "Others",
  ];

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  HttpService httpService;

  SellSecRegController({required this.httpService});

  final storage = Get.find<StorageService>();
}
