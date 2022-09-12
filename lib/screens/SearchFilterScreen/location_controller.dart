import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../Network/http_service.dart';
import '../../Service/StorageService.dart';
import 'model/location_filter.dart';
import 'model/location_sub.dart';

class LocationController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  @override
  void onInit() {
    readJson();
    super.onInit();
  }

  HttpService httpService;

  LocationController({required this.httpService});

  final storage = Get.find<StorageService>();
  RxList<LocationSub> item = RxList<LocationSub>();
  RxList<LocationSub> itemSub = RxList<LocationSub>();
  RxList<LocationSub> itemSubAll = RxList<LocationSub>();

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/filter_location.json');
    final data = await json.decode(response);
    item.value = LocationFilterModel.fromJson(data).item!;
  }


}
