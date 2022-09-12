import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mlm/Network/http_service.dart';
import 'package:mlm/Service/StorageService.dart';

import 'model/breed_type_model.dart';

class BreedTypeController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;

  HttpService httpService;

  BreedTypeController({required this.httpService});

  var isApiRunning = false.obs;

  var title = "menu_products".obs;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  final storage = Get.find<StorageService>();

  var breedTypeArray = [
    "LABRADOR HUSKY",
    "LABRADOR RETRIEVER",
    "LAGOTTO ROMAGNOLO",
    "LAIZHOU HONG",
    "LAKELAND TERRIER",
    "LAKOTA MASTINO",
    "LANCASHIRE HEELER",
    "LANDSEER",
    "LAPINPOROKOIRA"
  ];

  List<BreedType> tempBreedTypeList = [];
  RxList<BreedType> breedTypeList = RxList<BreedType>();

  onSelectListener(String index) {
    List<BreedType> tempList = [];
    tempList.addAll(tempBreedTypeList);

    List<BreedType> originalList = [];
    originalList.addAll(breedTypeList.value);

    for (var element in originalList) {
      var indexOf = originalList.indexOf(element);
      originalList[indexOf].isSelect = element.breedName == index;
    }
    breedTypeList.clear();
    breedTypeList.value = originalList;

    for (var element in tempList) {
      var indexOf = tempList.indexOf(element);
      tempList[indexOf].isSelect = element.breedName == index;
    }
    tempBreedTypeList.clear();
    tempBreedTypeList.addAll(tempList);
  }

  onSearch(String index) {
    if (index.isEmpty) {
      breedTypeList.value = tempBreedTypeList;
    } else {
      var list = tempBreedTypeList
          .where((data) =>
              data.breedName.toLowerCase().contains(index.toLowerCase()))
          .toList();
      breedTypeList.value = list;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  void onLoad() {
    tempBreedTypeList.clear();
    breedTypeList.clear();
    var list = breedTypeArray.map((e) => BreedType(e, false)).toList();
    tempBreedTypeList.addAll(list);
    breedTypeList.value.addAll(list);
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
}
