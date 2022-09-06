import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../Network/http_service.dart';
import '../../../Service/StorageService.dart';

class SellAddPetController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;
  var isApiRunning = false.obs;
  var strBreedType = "FIND BREED".obs;

  HttpService httpService;

  SellAddPetController({required this.httpService});

  final storage = Get.find<StorageService>();
}
