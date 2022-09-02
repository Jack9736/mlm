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

  List<String> typeOptionList = [
    "PURE BREED",
    "CROSS BREED",
    "STUD (SIRE/DAM)",
    "RESCUE"
  ];
  List<String> ageOptionList = [
    "8 WEEKS - 6 MONTHS",
    "7 MONTHS - 12 MONTHS",
    "13 MONTHS - 23 MONTHS",
    "2 - 5 YEARS",
    "OVER 5 YEARS"
  ];

  List<String> sizeOptionList = [
    "MINIATURE",
    "SMALL",
    "MEDIUM",
    "LARGE",
    "EXTRA LARGE",
  ];

  List<String> genderOptionList = [
    "MALE",
    "FEMALE",
  ];

  List<String> personalityOptionList = [
    "GOOD WITH KIDS",
    "GOOD WITH SENIORS",
    "SLEEPY /QUIET",
    "CLEVER",
    "VERY EXCITABLE",
    "PROTECTIVE",
  ];

  List<String> commonYesNoOptionList = [
    "YES",
    "NO",
  ];

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  HttpService httpService;

  SellSecRegController({required this.httpService});

  final storage = Get.find<StorageService>();
}
