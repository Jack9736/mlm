import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mlm/enum/SearchMenuType.dart';
import 'package:mlm/screens/SearchFilterScreen/model/SearchMainModel.dart';

import '../../Network/http_service.dart';
import 'package:dio/dio.dart' as d;

import '../../Service/StorageService.dart';
import '../../Utils/constant.dart';

class SearchFilterController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  var searchType = [
    'TYPE',
    'BREED',
    'AGE',
    'LOCATION',
    'SIZE',
    'GENDER',
    'PERSONALITY',
    'CRAATE TRAINED',
    'TRANSPORT',
    'VET CHECKED',
  ];

  RxList<SearchMainModel> searchTypeList = RxList<SearchMainModel>();

  @override
  void onInit() {
    super.onInit();
  }

  HttpService httpService;

  SearchFilterController({required this.httpService});

  final storage = Get.find<StorageService>();

  searchStringToLevel(String time) {
    switch (time) {
      case "PERSONALITY":
      case "CRAATETRAINED":
      case "TRANSPORT":
      case "VETCHECKED":
        return true;
      default:
        return false;
    }
  }
}
