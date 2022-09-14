import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mlm/Network/http_service.dart';
import 'package:mlm/Service/StorageService.dart';
import 'package:mlm/screens/SearchFilterScreen/search_filter_view.dart';
import 'package:mlm/screens/SellerScreen/AddPetScreen/sell_add_pet_view.dart';

import '../SearchFilterScreen/search_filter_controller.dart';
import '../SellerScreen/AddPetScreen/sell_add_pet_controller.dart';
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

  SellAddPetController sellAddPetController = Get.find();
  SearchFilterController searchFilterController = Get.find();

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

  onSelectListener(String index, String screenName) {
    for (var element in breedTypeList.value) {
      if (element.breedName == index) {
        if (screenName == (SellAddPetView).toString()) {
          sellAddPetController.selectedBreedType.value =
              sellAddPetController.selectedBreedType.value == element.breedName
                  ? ""
                  : element.breedName;
        } else if (screenName == (SearchFilterView).toString()) {
          searchFilterController.selectedBreedType.value =
              searchFilterController.selectedBreedType.value ==
                      element.breedName
                  ? ""
                  : element.breedName;
        }
      }
    }
    breedTypeList.refresh();
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
    initBreedTypeList();
    super.onInit();
  }

  void initBreedTypeList() {
    for (var value in breedTypeArray) {
      tempBreedTypeList.add(BreedType(value, false));
      breedTypeList.add(BreedType(value, false));
    }
  }

  void onLoad() {
    onSearch("");
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
}
