import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/SearchFilterScreen/model/SearchMainModel.dart';
import '../../Style/app_colors.dart';
import '../../Utils/constant.dart';
import '../../enum/Method.dart';
import 'location_filter_controller.dart';
import 'model/location_filter.dart';

class LocationFilterView extends StatefulWidget {
  const LocationFilterView({Key? key}) : super(key: key);

  @override
  State<LocationFilterView> createState() => _LocationFilterViewState();
}

class _LocationFilterViewState extends State<LocationFilterView> {
  final _formKey = GlobalKey<FormState>();

  final _textSearchController = TextEditingController();

  LocationFilterController controller = Get.find();

  UserType _userType = UserType.buyer;

  List<SearchMainModel> tempSearchTypeList = [];

  bool isShowAdvanceMenu = false;
  final Rxn<LocationFilter> _items = Rxn<LocationFilter>();

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/filter_location.json');
    final data = await json.decode(response);
    _items.value = LocationFilter.fromJson(data);
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
        body: SingleChildScrollView(
          child: Column(
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
                    itemCount: _items.value?.item?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var searchTypeList = _items.value?.item![index];
                      return SizedBox(
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                searchTypeList?.lName ?? '',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Gibson',
                                    color: AppColors.black),
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
      ),
    );
  }

  onItemChanged(String value) {}

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
