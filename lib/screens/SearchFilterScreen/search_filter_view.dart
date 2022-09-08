import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/enum/SearchMenuType.dart';
import 'package:mlm/screens/SearchFilterScreen/model/SearchMainModel.dart';
import 'package:mlm/screens/SearchFilterScreen/search_filter_controller.dart';

import 'package:mlm/screens/loginScreen/login_controller.dart';
import '../../Utils/constant.dart';
import '../../enum/Method.dart';

class SearchFilterView extends StatefulWidget {
  const SearchFilterView({Key? key}) : super(key: key);

  @override
  State<SearchFilterView> createState() => _SearchFilterViewState();
}

class _SearchFilterViewState extends State<SearchFilterView> {
  final _formKey = GlobalKey<FormState>();

  final _textSearchController = TextEditingController();

  SearchFilterController controller = Get.find();

  UserType _userType = UserType.buyer;

  List<SearchMainModel> tempSearchTypeList = [];

  bool isShowAdvanceMenu = false;

  @override
  void initState() {
    super.initState();

    // readArgument();
  }

  void readArgument() {
    var argumentData = Get.arguments;
    _userType = argumentData[0][AppConstant.argUserType];
  }

  @override
  Widget build(BuildContext context) {
    tempSearchTypeList.addAll(controller.searchType.map((e) {
      return SearchMainModel()
        ..menuType = searchStringToMenu(e.replaceAll(" ", "").toUpperCase())
        ..menuName = e
        ..isAdvanceMenu =
            controller.searchStringToLevel(e.replaceAll(" ", "").toUpperCase());
    }).toList());

    controller.searchTypeList.addAll(
        tempSearchTypeList.where((element) => !element.isAdvanceMenu).toList());

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppBar(title: "Search Filters", hideBack: false),
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
                            hintText: 'Search query',
                          ),
                          onChanged: onItemChanged,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.searchTypeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var searchTypeList = controller.searchTypeList[index];
                      return _buildList(searchTypeList);
                    },
                  )),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: InkWell(
                    onTap: () {
                      if (!isShowAdvanceMenu) {
                        controller.searchTypeList.value = tempSearchTypeList;
                      } else {
                        controller.searchTypeList.value = tempSearchTypeList
                            .where((element) => !element.isAdvanceMenu)
                            .toList();
                      }
                      isShowAdvanceMenu = !isShowAdvanceMenu;
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "SHOW ADVANCED FILTERS",
                          style: TextStyle(
                            color: AppColors.appSecondaryColor,
                            fontFamily: "Gibson",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Icon(
                          Icons.expand_more,
                          color: AppColors.appSecondaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: applyFiltersButton(context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: clearFiltersButton(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  onItemChanged(String value) {
    // controller.onSearch(value);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  Widget _buildList(SearchMainModel searchTypeList) {
    return ExpansionTile(
      title: Text(
        searchTypeList.menuName,
        style: const TextStyle(
          fontFamily: "Gibson",
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: [Container()],
    );
  }



  /* Apply filters Button */
  SizedBox applyFiltersButton(BuildContext context) {
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

  SizedBox clearFiltersButton(BuildContext context) {
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
