import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mlm/Utils/constant.dart';
import '../../Network/http_service.dart';
import '../../Service/StorageService.dart';
import 'model/search_main_model.dart';

class SearchFilterController extends GetxController {
  Logger logger = Get.find();

  TextEditingController breedController = TextEditingController();
  var isLoading = false.obs;
  var isApiRunning = false.obs;

  var memberListObs = "".obs;
  var typeOptionObs = "".obs;
  var ageOptionObs = "".obs;
  var sizeOptionObs = "".obs;
  var genderOptionObs = "".obs;
  var personalityOptionObs = RxList<String>();
  var crateTrainedOptionObs = "".obs;
  var transportObs = "".obs;
  var vetCheckedObs = "".obs;
  var distanceObs = "".obs;
  var requireTransportOptionObs = "".obs;
  var vetCheckedOptionObs = "".obs;
  var availableFromObs = "MM/DD/YYYY".obs;
  var strBreedType = "FIND BREED".obs;
  var selectedBreedType = "".obs;

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
    var list = AppConstant().filterTypeStringList;

    return time == list[6] ||
        time == list[7] ||
        time == list[8] ||
        time == list[9];
  }
}
