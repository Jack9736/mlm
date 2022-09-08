import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/screens/SearchFilterScreen/model/SearchMainModel.dart';
import '../../Network/http_service.dart';
import '../../Service/StorageService.dart';

class LocationFilterController extends GetxController {
  Logger logger = Get.find();

  var isLoading = false.obs;
  var isApiRunning = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  HttpService httpService;

  LocationFilterController({required this.httpService});

  final storage = Get.find<StorageService>();

}
