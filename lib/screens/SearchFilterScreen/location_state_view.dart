import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/SearchFilterScreen/model/SearchMainModel.dart';
import '../../Style/app_colors.dart';
import '../../Utils/constant.dart';
import '../../enum/Method.dart';
import 'location_controller.dart';
import 'model/location_filter.dart';

class LocationStateView extends StatefulWidget {
  const LocationStateView({Key? key}) : super(key: key);

  @override
  State<LocationStateView> createState() => _LocationStateViewState();
}

class _LocationStateViewState extends State<LocationStateView> {
  final _formKey = GlobalKey<FormState>();

  final _textSearchController = TextEditingController();

  LocationController controller = Get.find();

  UserType _userType = UserType.buyer;

  List<SearchMainModel> tempSearchTypeList = [];

  bool isShowAdvanceMenu = false;
  final Rxn<LocationFilterModel> _items = Rxn<LocationFilterModel>();

  // Fetch content from the json file
  Future<void> readJson() async {
    // final String response =
    // await rootBundle.loadString('assets/json/filter_location.json');
    // final data = await json.decode(response);
    // _items.value = LocationFilterModel.fromJson(data);
  }

  @override
  void initState() {
    super.initState();
  }

  void readArgument() {
    var argumentData = Get.arguments;
    _userType = argumentData[0][AppConstant.argUserType];
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppBar(title: "Location", hideBack: false),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(children: [
                    Flexible(
                      child: TextField(
                        controller: _textSearchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search by location name or postcode',
                        ),
                        onChanged: onItemChanged,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Obx(() => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.item.length,
                  itemBuilder: (BuildContext context, int index) {
                    var searchTypeList = controller.item[index];
                    return InkWell(
                      onTap: () {
                        if (controller.item[index].sub!.isNotEmpty) {
                          controller.itemSubAll.clear();
                          controller.itemSubAll.value
                              .add(controller.item[index]);
                          Get.toNamed(AppConstant.ROUTE_LOCATION_FILTER_VIEW);
                        } else {
                          Get.snackbar(
                            "Warning!",
                            "No location found",
                          );
                        }
                      },
                      child: SizedBox(
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                searchTypeList.name ?? '',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Gibson',
                                    color: AppColors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  onItemChanged(String value) {}

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }
}
