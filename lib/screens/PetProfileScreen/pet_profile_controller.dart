import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../Network/http_service.dart';
import '../../Service/StorageService.dart';

class ProfilePetController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  HttpService httpService;

  ProfilePetController({required this.httpService});

  final storage = Get.find<StorageService>();
}
