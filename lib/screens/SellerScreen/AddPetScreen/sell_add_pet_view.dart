import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:intl/intl.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/k_text_style.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/Utils/helper.dart';
import 'package:mlm/screens/SellerScreen/AddPetScreen/sell_add_pet_controller.dart';
import '../../../Utils/XFile.dart';
import '../../../Utils/constant.dart';
import '../../../Widget/rounded_cb_widget.dart';
import '../../../Widget/rounded_form_field_widget.dart';
import '../../../Widget/rounded_rb_widget.dart';
import '../../../Widget/widget_appbar.dart';
import '../SellSecRegScreen/sell_sec_reg_controller.dart';

class SellAddPetView extends StatefulWidget {
  const SellAddPetView({Key? key}) : super(key: key);

  @override
  State<SellAddPetView> createState() => _SellAddPetViewState();
}

class _SellAddPetViewState extends State<SellAddPetView> {
  final _formKey = GlobalKey<FormState>();
  late String userName, password, sessionName;
  int radioGroup = 1;
  var userType = '';

  XFile? customerLogoImageFile;

  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SellSecRegController secRegController = Get.find();
  SellAddPetController sellAddPetController = Get.find();

  var memberListObs = "".obs;
  var typeOptionObs = "".obs;
  var ageOptionObs = "".obs;
  var sizeOptionObs = "".obs;
  var genderOptionObs = "".obs;
  RxList<String> personalityOptionObs = RxList<String>();
  var crateTrainedOptionObs = "".obs;
  var requireTransportOptionObs = "".obs;
  var vetCheckedOptionObs = "".obs;
  var availableFromObs = "MM/DD/YYYY".obs;

  RxList<XFile> imageFileList = RxList<XFile>();

  double sum = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    memberListObs.value = secRegController.memberList[0];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          title: "Add Pet",
          menuItem: [
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
        body: SafeArea(
          bottom: true,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Helper().buildColumn(
                    "NAME",
                    RoundedTextFormFieldWidget(
                        'TYPE NAME HERE', 'Please Enter name', true,
                        controller: nameController),
                  ),
                  Helper().buildColumn(
                      "PROFILE PHOTO",
                      SizedBox(
                        height: size.width / 3,
                        width: size.width / 3,
                        child: galleryWidget(7, customerLogoImageFile),
                      )),
                  Helper().buildColumn(
                      "TYPE",
                      Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: RoundedRadioButtonWidget(context, 0,
                                  AppConstant().typeOptionList, typeOptionObs),
                            ),
                            Expanded(
                              child: RoundedRadioButtonWidget(context, 1,
                                  AppConstant().typeOptionList, typeOptionObs),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundedRadioButtonWidget(context, 2,
                                  AppConstant().typeOptionList, typeOptionObs),
                            ),
                            Expanded(
                              child: RoundedRadioButtonWidget(context, 3,
                                  AppConstant().typeOptionList, typeOptionObs),
                            ),
                          ],
                        )
                      ])),
                  Helper().buildColumn(
                    "BREED",
                    InkWell(
                      onTap: () => {
                        Get.toNamed(AppConstant.ROUTE_BREED_TYPE_SCREEN,
                            arguments: [
                              {
                                AppConstant.argScreenName:
                                    (SellAddPetView).toString()
                              },
                            ])
                      },
                      child: Obx(
                        () => RoundedTextFormFieldWidget(
                            sellAddPetController.strBreedTypeHint.value,
                            'Please select breed',
                            false,
                            controller: sellAddPetController.breedController),
                      ),
                    ),
                  ),
                  Helper().buildColumn(
                    "AGE",
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RoundedRadioButtonWidget(context, 0,
                              AppConstant().ageOptionList, ageOptionObs),
                          RoundedRadioButtonWidget(context, 1,
                              AppConstant().ageOptionList, ageOptionObs),
                          RoundedRadioButtonWidget(context, 2,
                              AppConstant().ageOptionList, ageOptionObs),
                          Row(
                            children: [
                              Expanded(
                                child: RoundedRadioButtonWidget(context, 3,
                                    AppConstant().ageOptionList, ageOptionObs),
                              ),
                              Expanded(
                                child: RoundedRadioButtonWidget(context, 4,
                                    AppConstant().ageOptionList, ageOptionObs),
                              ),
                            ],
                          )
                        ]),
                  ),
                  Helper().buildColumn(
                    "LOCATION",
                    RoundedTextFormFieldWidget(
                        'FIND LOCATION', 'Please select breed', true,
                        controller: locationController),
                  ),
                  Helper().buildColumn(
                      "PRICE",
                      RoundedTextFormFieldWidget(
                          'ENTER PRICE', 'Please select breed', true,
                          controller: priceController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true))),
                  Helper().buildColumn(
                    "SIZE",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: RoundedRadioButtonWidget(context, 0,
                                AppConstant().sizeOptionList, sizeOptionObs),
                          ),
                          Expanded(
                            child: RoundedRadioButtonWidget(context, 1,
                                AppConstant().sizeOptionList, sizeOptionObs),
                          ),
                          Expanded(
                            child: RoundedRadioButtonWidget(context, 2,
                                AppConstant().sizeOptionList, sizeOptionObs),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundedRadioButtonWidget(context, 3,
                                AppConstant().sizeOptionList, sizeOptionObs),
                          ),
                          Expanded(
                            child: RoundedRadioButtonWidget(context, 4,
                                AppConstant().sizeOptionList, sizeOptionObs),
                          ),
                        ],
                      )
                    ]),
                  ),
                  Helper().buildColumn(
                    "GENDER",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: RoundedRadioButtonWidget(
                                context,
                                0,
                                AppConstant().genderOptionList,
                                genderOptionObs),
                          ),
                          Expanded(
                            child: RoundedRadioButtonWidget(
                                context,
                                1,
                                AppConstant().genderOptionList,
                                genderOptionObs),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Helper().buildColumn(
                    "PERSONALITY",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: RoundedCheckBoxWidget(
                                context,
                                0,
                                AppConstant().personalityOptionList,
                                personalityOptionObs),
                          ),
                          Expanded(
                            child: RoundedCheckBoxWidget(
                                context,
                                1,
                                AppConstant().personalityOptionList,
                                personalityOptionObs),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundedCheckBoxWidget(
                                context,
                                2,
                                AppConstant().personalityOptionList,
                                personalityOptionObs),
                          ),
                          Expanded(
                            child: RoundedCheckBoxWidget(
                                context,
                                3,
                                AppConstant().personalityOptionList,
                                personalityOptionObs),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundedCheckBoxWidget(
                                context,
                                4,
                                AppConstant().personalityOptionList,
                                personalityOptionObs),
                          ),
                          Expanded(
                            child: RoundedCheckBoxWidget(
                                context,
                                5,
                                AppConstant().personalityOptionList,
                                personalityOptionObs),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Helper().buildColumn(
                    "CRATE TRAINED",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: RoundedRadioButtonWidget(
                                context,
                                0,
                                AppConstant().commonYesNoOptionList,
                                crateTrainedOptionObs),
                          ),
                          Expanded(
                            child: RoundedRadioButtonWidget(
                                context,
                                1,
                                AppConstant().commonYesNoOptionList,
                                crateTrainedOptionObs),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Helper().buildColumn(
                    "REQUIRE TRANSPORT",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: RoundedRadioButtonWidget(
                                context,
                                0,
                                AppConstant().commonYesNoOptionList,
                                requireTransportOptionObs),
                          ),
                          Expanded(
                            child: RoundedRadioButtonWidget(
                                context,
                                1,
                                AppConstant().commonYesNoOptionList,
                                requireTransportOptionObs),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Helper().buildColumn(
                      "MICROCHIP (hidden to public)",
                      RoundedTextFormFieldWidget(
                          'ENTER NUMBER', 'Please enter number', true,
                          controller: microchipController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true))),
                  Helper().buildColumn(
                    "REHOMING NUMBER (hidden to public)",
                    RoundedTextFormFieldWidget(
                        'ENTER NUMBER', 'Please enter number', true,
                        controller: rehomingNumberController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true)),
                  ),
                  Helper().buildColumn(
                    "VET CHECKED",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: RoundedRadioButtonWidget(
                                context,
                                0,
                                AppConstant().commonYesNoOptionList,
                                vetCheckedOptionObs),
                          ),
                          Expanded(
                            child: RoundedRadioButtonWidget(
                                context,
                                1,
                                AppConstant().commonYesNoOptionList,
                                vetCheckedOptionObs),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Helper().buildColumn(
                    "AVAILABLE FROM",
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: RoundedTextFormFieldWidget(
                            availableFromObs.value, 'Please Enter date', false,
                            controller: availableFromController),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "*Cats and Dogs are not available for sales until about 8 weeks after they are born",
                      style: KTextStyle.noteTextStyle,
                    ),
                  ),
                  Helper().buildColumn(
                    "NOTES",
                    RoundedTextFormFieldWidget(
                        "Type here…", 'Please Enter note', true,
                        minLines: 4,
                        maxLines: 4,
                        radius: 10,
                        controller: notesController),
                  ),
                  Helper().buildColumn(
                      "GALLERY",
                      Column(
                        children: [
                          SizedBox(
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 6,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemBuilder: (BuildContext context, int index) {
                                  return Obx(() => galleryWidget(
                                      index,
                                      imageFileList.length > index
                                          ? imageFileList[index]
                                          : null));
                                }),
                            width: double.infinity,
                          ),
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "*Upload up to 6 images or videos. Max. Size 5MB",
                        style: KTextStyle.noteTextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: buildAddPetButton(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController microchipController = TextEditingController();
  TextEditingController rehomingNumberController = TextEditingController();
  TextEditingController availableFromController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  TextStyle buildRadioTextStyle() {
    return const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'Gibson',
        color: Colors.grey);
  }

  TextStyle buildHeaderTextStyle() {
    return const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'Gibson',
        color: AppColors.topHeaderBlueClr);
  }

  Widget galleryWidget(int index, XFile? file) {
    return GestureDetector(
      onTap: () {
        _showImagePickerDialog(index, file);
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(5),
        strokeWidth: 1,
        dashPattern: const [4, 4, 4, 4],
        color: file == null ? Colors.black : Colors.transparent,
        child: Stack(
          children: <Widget>[
            file != null
                ? Positioned.fill(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop),
                                image: FileImage(File(file.path))),
                          ),
                        )),
                  )
                : Container(),
            // new Center(child: Icon(Icons.add, color: Colors.black)),
            Center(
              child: IconButton(
                icon: Icon(Icons.add,
                    color: file == null ? Colors.black : Colors.white),
                onPressed: () {
                  _showImagePickerDialog(index, file);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _showImagePickerDialog(int index, XFile? file) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              //reverse: true,
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      if (index == 7) {
                        _openGallery(index);
                      } else {
                        _openGalleryForImages(index, 6);
                        // loadAssets();
                      }
                      Navigator.of(context).pop();
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(index);
                      Navigator.of(context).pop();
                    },
                    title: const Text("Camera"),
                    leading: const Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                  if (file != null)
                    const Divider(
                      height: 1,
                      color: Colors.blue,
                    ),
                  if (file != null)
                    ListTile(
                      onTap: () {
                        showImage(context, file);
                      },
                      title: const Text("View"),
                      leading: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.blue,
                      ),
                    ),
                  if (file != null)
                    const Divider(
                      height: 1,
                      color: Colors.blue,
                    ),
                  if (file != null)
                    ListTile(
                      onTap: () {
                        removeImageFile(index);
                        Navigator.of(context).pop();
                      },
                      title: const Text("Remove"),
                      leading: const Icon(
                        Icons.highlight_remove_outlined,
                        color: Colors.blue,
                      ),
                    ),
                ],
              ),
            ),
          );
        });
  }

  //Date Picker 11-Aug-2020
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.appSecondaryColor, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.appSecondaryColor, //body text color
              // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.appSecondaryColor,
                primary: AppColors.appSecondaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      availableFromController.text = getFormattedDate(picked.toString());
      availableFromObs.refresh();
    }
  }

  String getFormattedDate(String date) {
    var localDate = DateTime.parse(date).toLocal();

    /// e.g If 2021-05-27 9:34:12.781341 then format must be yyyy-MM-dd HH:mm
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }

  void _openGallery(int index) async {
    List<Media>? res = await ImagesPicker.pick(
        count: 1,
        pickType: PickType.image,
        language: Language.System,
        maxSize: 5);
    if (kDebugMode) {
      print(res);
    }
    if (res != null) {
      for (int i = 0; i < res.length; i++) {
        loadImages(index, XFile(res[i].path));
      }
    }
  }

  void _openGalleryForImages(int index, int imgCount) async {
    ///storage/emulated/0/Android/data/com.example.mlm/files/Pictures/image_picker_crop_df00cfb7-2449-40f9-a05e-8e9a6f9bc759_20220906114226672.jpg
    List<Media>? res = await ImagesPicker.pick(
        count: 6 - imageFileList.length,
        pickType: PickType.image,
        language: Language.System,
        maxSize: 5);
    if (kDebugMode) {
      print(res);
    }
    if (res != null) {
      if (kDebugMode) {
        print(res.map((e) => e.path).toList());
      }

      for (int i = 0; i < res.length; i++) {
        if (imageFileList.length != 6) {
          XFile(res[i].path);
          imageFileList.add(XFile(res[i].path));

          var size2 = res[i].size;
          var ii = (log(size2) / log(1024)).floor();
          sum += (res[i].size / 1024);

          print(getFileSize(size2, 2));
        } else {
          break;
        }
      }

      if (sum > 5) {
        print("Size is bigger " + sum.toString());
      } else {
        print("Size is smaller " + sum.toString());
      }
    }
  }

  getFileSize(double bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  void _openCamera(int index) async {
    List<Media>? res = await ImagesPicker.openCamera(
        pickType: PickType.image,
        language: Language.System,
        maxSize: 5);
    if (kDebugMode) {
      print(res);
    }
    if (res != null) {
      for (int i = 0; i < res.length; i++) {
        loadImages(index, XFile(res[i].path));
      }
    }
  }

  loadImages(int index, XFile file) {
    setState(() {
      if (index == 7) {
        customerLogoImageFile = file;
      }
    });
  }

  removeImageFile(int index) {
    setState(() {
      if (index == 7) {
        customerLogoImageFile = null;
      } else {
        imageFileList.removeAt(index);
      }
    });
  }

  void showImage(BuildContext context, XFile file,
      {Function(String, String)? onActionClick}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width - 25,
            height: MediaQuery.of(context).size.height / 1.5,
            padding: const EdgeInsets.all(20),
            color: Colors.transparent,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      margin:
                          const EdgeInsets.only(top: 16, left: 16, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.8),
                                BlendMode.dstATop),
                            image: FileImage(File(file.path))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.highlight_remove_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  SizedBox buildAddPetButton(BuildContext context) {
    return SizedBox(
      height: AppConstant.appButtonSize,
      child: Obx(() => TextButton(
            child: secRegController.isApiRunning.value
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
                : const Text('ADD PET',
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
            ),
            onPressed: () {
              Get.toNamed(AppConstant.ROUTE_SELL_PET_ADDED_VIEW);
            },
          )),
    );
  }
}
