import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../Network/http_service.dart';
import '../../../Service/StorageService.dart';
import 'package:dio/dio.dart' as d;

import '../../../base/BaseResponse.dart';

class SellAddPetController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  var strBreedTypeHint = "FIND BREED".obs;
  var selectedBreedType = "".obs;

  TextEditingController breedController = TextEditingController();

  HttpService httpService;

  SellAddPetController({required this.httpService});

  final storage = Get.find<StorageService>();

  void addPet(Map<String, dynamic> param) async {
    isLoading.value = true;
    try {
      final result = await httpService.request(
          url: "Order", method: Method.POST, params: param);
      if (result != null) {
        if (result is d.Response) {
          var productRes = BaseResponse.fromJson(result.data);
          Get.snackbar(
            'Success',
            productRes.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      }
    } catch (ex) {
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
