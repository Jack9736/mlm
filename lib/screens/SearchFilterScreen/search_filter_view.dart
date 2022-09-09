import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/rounded_cb_widget.dart';
import 'package:mlm/Widget/rounded_rb_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/enum/SearchMenuType.dart';
import 'package:mlm/screens/SearchFilterScreen/model/SearchMainModel.dart';
import 'package:mlm/screens/SearchFilterScreen/search_filter_controller.dart';
import '../../Utils/constant.dart';
import '../../Widget/rounded_form_field_widget.dart';
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

  var isShowAdvanceMenu = false.obs;

  var verticalPadding = 15.0;

  TextEditingController locationController = TextEditingController();
  TextEditingController breedController = TextEditingController();

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
    tempSearchTypeList.addAll(controller.searchType.map((e) {
      return SearchMainModel()
        ..menuType = searchStringToMenu(e)
        ..menuName = e
        ..isAdvanceMenu = controller.searchStringToLevel(e);
    }).toList());

    controller.searchTypeList.value =
        tempSearchTypeList.where((element) => !element.isAdvanceMenu).toList();

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
                      if (!isShowAdvanceMenu.value) {
                        controller.searchTypeList.value = tempSearchTypeList;
                      } else {
                        controller.searchTypeList.value = tempSearchTypeList
                            .where((element) => !element.isAdvanceMenu)
                            .toList();
                      }
                      isShowAdvanceMenu.value = !isShowAdvanceMenu.value;
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => Text(
                              isShowAdvanceMenu.value
                                  ? "HIDE ADVANCED FILTERS"
                                  : "SHOW ADVANCED FILTERS",
                              style: const TextStyle(
                                color: AppColors.appSecondaryColor,
                                fontFamily: "Gibson",
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                        const Icon(
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
                child: buildApplyFiltersButton(context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildClearFiltersButton(context),
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
    // controller.dispose();

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
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: buildSubWidget(searchTypeList.menuName),
        )
      ],
    );
  }

  Widget buildSubWidget(String time) {
    var menu = searchStringToMenu(time);

    var commonYesNoOptionList = AppConstant().commonYesNoOptionList;

    switch (menu) {
      case SearchMenuType.type:
        {
          return buildTypeWidget();
        }
      case SearchMenuType.breed:
        {
          return buildBreedWidget();
        }
      case SearchMenuType.age:
        {
          return buildAgeWidget();
        }
      case SearchMenuType.location:
        {
          return buildLocationWidget();
        }
      case SearchMenuType.size:
        {
          var optionList = AppConstant().sizeOptionList;
          var optionObs = controller.sizeOptionObs;
          return buildSizeWidget(optionList, optionObs);
        }
      case SearchMenuType.gender:
        {
          return buildGenderWidget();
        }
      case SearchMenuType.personality:
        {
          var list = AppConstant().personalityOptionList;
          var obs = controller.personalityOptionObs;
          return buildPersonalityWidget(list, obs);
        }
      case SearchMenuType.craatetrained:
        {
          return buildCraatetrainedWidget(commonYesNoOptionList);
        }
      case SearchMenuType.transport:
        {
          return buildTransportWidget(commonYesNoOptionList);
        }
      case SearchMenuType.vetChecked:
        {
          return buildVetCheckedWidget(commonYesNoOptionList);
        }
      default:
        {
          return Container();
        }
    }
  }

  Padding buildBreedWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: InkWell(
        onTap: () => {
          Get.toNamed(AppConstant.ROUTE_BREED_TYPE_SCREEN),
        },
        child: Obx(
          () => RoundedTextFormFieldWidget(
              controller.strBreedType.value, 'Please select breed', false,
              controller: breedController),
        ),
      ),
    );
  }

  Padding buildLocationWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(AppConstant.ROUTE_LOCATION_STATE_VIEW);
            },
            child: RoundedTextFormFieldWidget(
                'FIND LOCATION', 'Please select breed', false,
                controller: locationController),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 10, left: 10),
            child: Row(
              children: const [
                Text("DISTANCE",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gibson',
                        color: AppColors.black)),
                Text("\t(select location first)",
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Gibson',
                        color: AppColors.black)),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RoundedRadioButtonWidget(context, 0,
                    AppConstant().distanceOptionList, controller.distanceObs),
              ),
              Expanded(
                child: RoundedRadioButtonWidget(context, 1,
                    AppConstant().distanceOptionList, controller.distanceObs),
              ),
              Expanded(
                child: RoundedRadioButtonWidget(context, 2,
                    AppConstant().distanceOptionList, controller.distanceObs),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: RoundedRadioButtonWidget(context, 3,
                    AppConstant().distanceOptionList, controller.distanceObs),
              ),
              Expanded(
                child: RoundedRadioButtonWidget(context, 4,
                    AppConstant().distanceOptionList, controller.distanceObs),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildTypeWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: RoundedRadioButtonWidget(context, 0,
                  AppConstant().typeOptionList, controller.typeOptionObs),
            ),
            Expanded(
              child: RoundedRadioButtonWidget(context, 1,
                  AppConstant().typeOptionList, controller.typeOptionObs),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RoundedRadioButtonWidget(context, 2,
                  AppConstant().typeOptionList, controller.typeOptionObs),
            ),
            Expanded(
              child: RoundedRadioButtonWidget(context, 3,
                  AppConstant().typeOptionList, controller.typeOptionObs),
            ),
          ],
        )
      ]),
    );
  }

  Padding buildVetCheckedWidget(List<String> commonYesNoOptionList) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: RoundedRadioButtonWidget(
                  context, 0, commonYesNoOptionList, controller.vetCheckedObs),
            ),
            Expanded(
              child: RoundedRadioButtonWidget(
                  context, 1, commonYesNoOptionList, controller.vetCheckedObs),
            ),
          ],
        ),
      ]),
    );
  }

  Padding buildTransportWidget(List<String> commonYesNoOptionList) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: RoundedRadioButtonWidget(
                  context, 0, commonYesNoOptionList, controller.transportObs),
            ),
            Expanded(
              child: RoundedRadioButtonWidget(
                  context, 1, commonYesNoOptionList, controller.transportObs),
            ),
          ],
        ),
      ]),
    );
  }

  Padding buildCraatetrainedWidget(List<String> commonYesNoOptionList) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: RoundedRadioButtonWidget(context, 0, commonYesNoOptionList,
                  controller.crateTrainedOptionObs),
            ),
            Expanded(
              child: RoundedRadioButtonWidget(context, 1, commonYesNoOptionList,
                  controller.crateTrainedOptionObs),
            ),
          ],
        ),
      ]),
    );
  }

  Padding buildPersonalityWidget(List<String> list, RxList<String> obs) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: RoundedCheckBoxWidget(context, 0, list, obs),
            ),
            Expanded(
              child: RoundedCheckBoxWidget(context, 1, list, obs),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RoundedCheckBoxWidget(context, 2, list, obs),
            ),
            Expanded(
              child: RoundedCheckBoxWidget(context, 3, list, obs),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: RoundedCheckBoxWidget(context, 4, list, obs),
            ),
            Expanded(
              child: RoundedCheckBoxWidget(context, 5, list, obs),
            ),
          ],
        ),
      ]),
    );
  }

  Padding buildGenderWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: RoundedRadioButtonWidget(context, 0,
                  AppConstant().genderOptionList, controller.genderOptionObs),
            ),
            Expanded(
              child: RoundedRadioButtonWidget(context, 1,
                  AppConstant().genderOptionList, controller.genderOptionObs),
            ),
          ],
        ),
      ]),
    );
  }

  Padding buildSizeWidget(List<String> optionList, RxString optionObs) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child:
                  RoundedRadioButtonWidget(context, 0, optionList, optionObs),
            ),
            Expanded(
              child:
                  RoundedRadioButtonWidget(context, 1, optionList, optionObs),
            ),
            Expanded(
              child:
                  RoundedRadioButtonWidget(context, 2, optionList, optionObs),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child:
                  RoundedRadioButtonWidget(context, 3, optionList, optionObs),
            ),
            Expanded(
              child:
                  RoundedRadioButtonWidget(context, 4, optionList, optionObs),
            ),
          ],
        )
      ]),
    );
  }

  Padding buildAgeWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        RoundedRadioButtonWidget(
            context, 0, AppConstant().ageOptionList, controller.ageOptionObs),
        RoundedRadioButtonWidget(
            context, 1, AppConstant().ageOptionList, controller.ageOptionObs),
        RoundedRadioButtonWidget(
            context, 2, AppConstant().ageOptionList, controller.ageOptionObs),
        Row(
          children: [
            Expanded(
              child: RoundedRadioButtonWidget(context, 3,
                  AppConstant().ageOptionList, controller.ageOptionObs),
            ),
            Expanded(
              child: RoundedRadioButtonWidget(context, 4,
                  AppConstant().ageOptionList, controller.ageOptionObs),
            ),
          ],
        )
      ]),
    );
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

  TextFormField buildTextFormField(
    String hintText,
    String msg,
    bool enabled, {
    int minLines: 1,
    int maxLines: 1,
    int radius = 50,
    keyboardType: TextInputType.text,
    required TextEditingController controller,
  }) {
    var textStyle = const TextStyle(
        fontSize: 16,
        fontFamily: "Gibson",
        fontWeight: FontWeight.w600,
        color: AppColors.appSecondaryColor);
    double mPadding = 10;
    var outlineInputBorder = OutlineInputBorder(
      borderSide:
          const BorderSide(color: AppColors.txt_field_border_color, width: 1.0),
      borderRadius: BorderRadius.circular(radius.toDouble()),
    );
    return TextFormField(
      controller: controller,
      enabled: enabled,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.next,
      cursorColor: AppColors.appSecondaryColor,
      style: textStyle,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return msg;
        }
        return null;
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            EdgeInsets.fromLTRB(mPadding, mPadding, mPadding, mPadding),
        hintText: hintText,
        hintStyle: buildRadioTextStyle(),
        disabledBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
      ),
    );
  }

  TextStyle buildRadioTextStyle() {
    return const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'Gibson',
        color: Colors.grey);
  }
}
