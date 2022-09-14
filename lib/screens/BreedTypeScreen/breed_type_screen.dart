import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/BreedTypeScreen/breed_type_controller.dart';
import 'package:mlm/screens/SearchFilterScreen/search_filter_view.dart';
import 'package:mlm/screens/SellerScreen/AddPetScreen/sell_add_pet_view.dart';

import '../../Utils/constant.dart';
import '../../enum/Method.dart';
import '../SearchFilterScreen/search_filter_controller.dart';
import '../SearchFilterScreen/search_filter_controller.dart';
import '../SellerScreen/AddPetScreen/sell_add_pet_controller.dart';

class BreedTypeScreen extends StatelessWidget {
  BreedTypeScreen({Key? key}) : super(key: key);

  BreedTypeController controller = Get.find();
  SellAddPetController sellAddPetController = Get.find();
  SearchFilterController searchFilterController = Get.find();
  final TextEditingController _textSearchController = TextEditingController();

  String _screenName = "";

  void readArgument() {
    var argumentData = Get.arguments;
    _screenName = argumentData[0][AppConstant.argScreenName];
  }

  @override
  Widget build(BuildContext context) {
    readArgument();

    controller.onLoad();

    const textStyle = TextStyle(
        fontFamily: "Gibson", fontWeight: FontWeight.w600, fontSize: 14);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.appBgColor,
          appBar: const CustomAppBar(
            title: "Breed Type",
          ),
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
                            hintText: 'Search query',
                          ),
                          onChanged: onItemChanged,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Expanded(
                child: Obx(() => ListView.separated(
                      itemCount: controller.breedTypeList.value.length,
                      // the length
                      itemBuilder: (context, index) {
                        var breedTypeList =
                            controller.breedTypeList.value[index];
                        print("Selection::-{$index}" +
                            breedTypeList.isSelect.toString());
                        var icon = const Icon(
                          Icons.check,
                          color: AppColors.appSecondaryColor,
                        );
                        var breedName = breedTypeList.breedName;
                        return InkWell(
                          onTap: () {
                            controller.onSelectListener(breedName, _screenName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  breedName,
                                  style: textStyle,
                                ),
                                const Spacer(),
                                _screenName == (SellAddPetView).toString()
                                    ? breedName ==
                                            sellAddPetController
                                                .selectedBreedType.value
                                        ? icon
                                        : Container()
                                    : _screenName ==
                                            (SearchFilterView).toString()
                                        ? breedName ==
                                                searchFilterController
                                                    .selectedBreedType.value
                                            ? icon
                                            : Container()
                                        : Container()
                              ],
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
              ),
              buildApplyButton(context)
            ],
          )),
    );
  }

  onItemChanged(String value) {
    controller.onSearch(value);
  }

  Padding buildDividerPadding() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Divider(),
    );
  }

  /* Next Button */
  Container buildApplyButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
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
                : const Text('APPLY',
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

              if (_screenName == (SellAddPetView).toString()) {
                sellAddPetController.breedController.text =
                    sellAddPetController.selectedBreedType.value;
                sellAddPetController.strBreedTypeHint.refresh();
              } else if (_screenName == (SearchFilterView).toString()) {
                searchFilterController.breedController.text =
                    searchFilterController.selectedBreedType.value;
                searchFilterController.strBreedType.refresh();
              }

              controller.onLoad();

              Get.back();
            },
          )),
    );
  }
}
