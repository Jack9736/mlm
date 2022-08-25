import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mlm/Network/http_service.dart';
import 'package:mlm/Service/StorageService.dart';


class BuySecRegController extends GetxController {
  Logger logger = Get.find();

  List<String> kidsList = [
    "Kids under 5 years",
    "Kids 5 - 12",
    "years Teenagers"
  ];
  List<String> liveInTypeList = ["House", "Apartment", "Acreage"];
  List<String> otherPetsList = ["Yes", "No"];
  List<String> insurePetsList = ["Yes", "No", "Not Sure"];

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  HttpService httpService;

  BuySecRegController({required this.httpService});

  final storage = Get.find<StorageService>();
}
