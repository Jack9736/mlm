import 'dart:convert';

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

class LocationFilterView extends StatefulWidget {
  const LocationFilterView({Key? key}) : super(key: key);

  @override
  State<LocationFilterView> createState() => _LocationFilterViewState();
}

class _LocationFilterViewState extends State<LocationFilterView> {
  final _formKey = GlobalKey<FormState>();

  final _textSearchController = TextEditingController();

  LocationController controller = Get.find();

  UserType _userType = UserType.buyer;

  List<SearchMainModel> tempSearchTypeList = [];

  bool isShowAdvanceMenu = false;
  final Rxn<LocationFilterModel> _items = Rxn<LocationFilterModel>();

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/filter_location.json');
    final data = await json.decode(response);
    _items.value = LocationFilterModel.fromJson(data);
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
        appBar: CustomAppBar(
          title: "Location",
          hideBack: false,
          onTap: () {
            if (controller.itemSubAll.length != 1) {
              controller.itemSubAll.removeAt(controller.itemSubAll.length - 1);
              controller.itemSubAll.refresh();
            } else {
              Get.back();
            }
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Row(
              children: [
                Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                        controller
                            .itemSubAll[controller.itemSubAll.length - 1].name,
                        style: TextStyle(
                            fontFamily: 'Gibson',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.black),
                      ),
                )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Image.asset('assets/ic_noun_check.png'),
                )
              ],
            ),
            Expanded(
              child: Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 18),
                child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller
                              .itemSubAll[controller.itemSubAll.length - 1]
                              .sub
                              ?.length ??
                          0,
                      itemBuilder: (BuildContext context, int index) {
                        var searchTypeList = controller
                            .itemSubAll[controller.itemSubAll.length - 1]
                            .sub?[index];
                        return InkWell(
                          onTap: () {
                            controller.itemSubAll.add(controller
                                .itemSubAll[controller.itemSubAll.length - 1]
                                .sub![index]);
                            controller.itemSubAll.refresh();
                          },
                          child: SizedBox(
                            height: 55,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    searchTypeList?.name ?? '',
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
                    ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildApplyFiltersButton(context),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildClearFiltersButton(context),
            )
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

/* Apply filters Button */
  SizedBox buildApplyFiltersButton(BuildContext context) {
    return SizedBox(
      height: AppConstant.appButtonSize,
      width: double.infinity,
      child: Obx(() => TextButton(
            child: controller.isApiRunning.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  )
                : const Text('APPLY FILTERS',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gibson',
                        color: Colors.white)),
            style: TextButton.styleFrom(
                //foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                    side: BorderSide(color: AppColors.submitBtnClr)),
                backgroundColor: AppColors.submitBtnClr,
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              _userType == UserType.buyer
                  ? Get.toNamed(AppConstant.ROUTE_BUY_HOME)
                  : Get.toNamed(AppConstant.ROUTE_SELL_HOME);
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  // isApiRunning = true;
                });
                //Get.toNamed(AppConstant.ROUTE_FORGOT_PASSWORD);
              }
              //Get.toNamed(AppConstant.ROUTE_FORGOT_PASSWORD);
            },
          )),
    );
  }

/* Clear filters Button */
  SizedBox buildClearFiltersButton(BuildContext context) {
    return SizedBox(
      height: AppConstant.appButtonSize,
      width: double.infinity,
      child: Obx(() => TextButton(
            child: controller.isApiRunning.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  )
                : Text('CLEAR FILTERS'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Gibson',
                        color: AppColors.submitBtnClr)),
            style: TextButton.styleFrom(
              //foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  side: BorderSide(color: AppColors.submitBtnClr)),
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              // Get.toNamed(AppConstant.ROUTE_LOGIN);
            },
          )),
    );
  }
}
