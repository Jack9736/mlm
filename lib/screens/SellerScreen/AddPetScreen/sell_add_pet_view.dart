import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';
import 'package:intl/intl.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Style/k_text_style.dart';
import 'package:mlm/screens/SellerScreen/AddPetScreen/sell_add_pet_controller.dart';
import '../../../Style/ButtonTextStyle.dart';
import '../../../Utils/constant.dart';
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

  final ImagePicker imagePicker = ImagePicker();

  XFile? galleryImgFirst;
  XFile? galleryImgSecond;
  XFile? galleryImgThree;
  XFile? galleryImgFour;
  XFile? galleryImgFive;
  XFile? galleryImgSix;
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
                  buildColumn(
                    "NAME",
                    buildTextFormField(
                        'TYPE NAME HERE', 'Please Enter name', true,
                        controller: nameController),
                  ),
                  buildColumn(
                      "PROFILE PHOTO",
                      SizedBox(
                        height: size.width / 3,
                        width: size.width / 3,
                        child: galleryWidget(7, customerLogoImageFile),
                      )),
                  buildColumn(
                      "TYPE",
                      Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: buildCustomRadioButton(
                                  context,
                                  0,
                                  secRegController.typeOptionList,
                                  typeOptionObs),
                            ),
                            Expanded(
                              child: buildCustomRadioButton(
                                  context,
                                  1,
                                  secRegController.typeOptionList,
                                  typeOptionObs),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: buildCustomRadioButton(
                                  context,
                                  2,
                                  secRegController.typeOptionList,
                                  typeOptionObs),
                            ),
                            Expanded(
                              child: buildCustomRadioButton(
                                  context,
                                  3,
                                  secRegController.typeOptionList,
                                  typeOptionObs),
                            ),
                          ],
                        )
                      ])),
                  buildColumn(
                    "BREED",
                    InkWell(
                      onTap: () => {
                        Get.toNamed(AppConstant.ROUTE_BREED_TYPE_SCREEN),
                      },
                      child: Obx(
                        () => buildTextFormField(
                            sellAddPetController.strBreedType.value,
                            'Please select breed',
                            false,
                            controller: breedController),
                      ),
                    ),
                  ),
                  buildColumn(
                    "AGE",
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          buildCustomRadioButton(context, 0,
                              secRegController.ageOptionList, ageOptionObs),
                          buildCustomRadioButton(context, 1,
                              secRegController.ageOptionList, ageOptionObs),
                          buildCustomRadioButton(context, 2,
                              secRegController.ageOptionList, ageOptionObs),
                          Row(
                            children: [
                              Expanded(
                                child: buildCustomRadioButton(
                                    context,
                                    3,
                                    secRegController.ageOptionList,
                                    ageOptionObs),
                              ),
                              Expanded(
                                child: buildCustomRadioButton(
                                    context,
                                    4,
                                    secRegController.ageOptionList,
                                    ageOptionObs),
                              ),
                            ],
                          )
                        ]),
                  ),
                  buildColumn(
                    "LOCATION",
                    buildTextFormField(
                        'FIND LOCATION', 'Please select breed', true,
                        controller: locationController),
                  ),
                  buildColumn(
                      "PRICE",
                      buildTextFormField(
                          'ENTER PRICE', 'Please select breed', true,
                          controller: priceController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true))),
                  buildColumn(
                    "AGE",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildCustomRadioButton(context, 0,
                                secRegController.sizeOptionList, sizeOptionObs),
                          ),
                          Expanded(
                            child: buildCustomRadioButton(context, 1,
                                secRegController.sizeOptionList, sizeOptionObs),
                          ),
                          Expanded(
                            child: buildCustomRadioButton(context, 2,
                                secRegController.sizeOptionList, sizeOptionObs),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: buildCustomRadioButton(context, 3,
                                secRegController.sizeOptionList, sizeOptionObs),
                          ),
                          Expanded(
                            child: buildCustomRadioButton(context, 4,
                                secRegController.sizeOptionList, sizeOptionObs),
                          ),
                        ],
                      )
                    ]),
                  ),
                  buildColumn(
                    "GENDER",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildCustomRadioButton(
                                context,
                                0,
                                secRegController.genderOptionList,
                                genderOptionObs),
                          ),
                          Expanded(
                            child: buildCustomRadioButton(
                                context,
                                1,
                                secRegController.genderOptionList,
                                genderOptionObs),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  buildColumn(
                    "PERSONALITY",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildCustomCheckBox(
                                context,
                                0,
                                secRegController.personalityOptionList,
                                personalityOptionObs),
                          ),
                          Expanded(
                            child: buildCustomCheckBox(
                                context,
                                1,
                                secRegController.personalityOptionList,
                                personalityOptionObs),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: buildCustomCheckBox(
                                context,
                                2,
                                secRegController.personalityOptionList,
                                personalityOptionObs),
                          ),
                          Expanded(
                            child: buildCustomCheckBox(
                                context,
                                3,
                                secRegController.personalityOptionList,
                                personalityOptionObs),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: buildCustomCheckBox(
                                context,
                                4,
                                secRegController.personalityOptionList,
                                personalityOptionObs),
                          ),
                          Expanded(
                            child: buildCustomCheckBox(
                                context,
                                5,
                                secRegController.personalityOptionList,
                                personalityOptionObs),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  buildColumn(
                    "CRATE TRAINED",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildCustomRadioButton(
                                context,
                                0,
                                secRegController.commonYesNoOptionList,
                                crateTrainedOptionObs),
                          ),
                          Expanded(
                            child: buildCustomRadioButton(
                                context,
                                1,
                                secRegController.commonYesNoOptionList,
                                crateTrainedOptionObs),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  buildColumn(
                    "REQUIRE TRANSPORT",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildCustomRadioButton(
                                context,
                                0,
                                secRegController.commonYesNoOptionList,
                                requireTransportOptionObs),
                          ),
                          Expanded(
                            child: buildCustomRadioButton(
                                context,
                                1,
                                secRegController.commonYesNoOptionList,
                                requireTransportOptionObs),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  buildColumn(
                      "MICROCHIP (hidden to public)",
                      buildTextFormField(
                          'ENTER NUMBER', 'Please enter number', true,
                          controller: microchipController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true))),
                  buildColumn(
                    "REHOMING NUMBER (hidden to public)",
                    buildTextFormField(
                        'ENTER NUMBER', 'Please enter number', true,
                        controller: rehomingNumberController,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true)),
                  ),
                  buildColumn(
                    "VET CHECKED",
                    Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildCustomRadioButton(
                                context,
                                0,
                                secRegController.commonYesNoOptionList,
                                vetCheckedOptionObs),
                          ),
                          Expanded(
                            child: buildCustomRadioButton(
                                context,
                                1,
                                secRegController.commonYesNoOptionList,
                                vetCheckedOptionObs),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  buildColumn(
                    "AVAILABLE FROM",
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: buildTextFormField(
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
                  buildColumn(
                    "NOTES",
                    buildTextFormField("Type here…", 'Please Enter note', true,
                        minLines: 4,
                        maxLines: 4,
                        radius: 10,
                        controller: notesController),
                  ),
                  buildColumn(
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
  TextEditingController breedController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController microchipController = TextEditingController();
  TextEditingController rehomingNumberController = TextEditingController();
  TextEditingController availableFromController = TextEditingController();
  TextEditingController notesController = TextEditingController();

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

  Obx buildCustomRadioButton(BuildContext context, int position,
      List<String> typeOptionList, RxString typeOptionObs) {
    return Obx(() => Card(
          margin: const EdgeInsets.all(4),
          color: typeOptionObs.value == typeOptionList[position]
              ? AppColors.radio_selected_color
              : AppColors.white,
          shape: OutlineInputBorder(
            borderSide: BorderSide(
                color: typeOptionObs.value == typeOptionList[position]
                    ? AppColors.radio_selected_color
                    : AppColors.radio_un_selected_color,
                width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: SizedBox(
            height: 35,
            child: MaterialButton(
              shape: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.appBgColor, width: 1),
                borderRadius: BorderRadius.zero,
              ),
              onPressed: () {
                setState(() {
                  typeOptionObs.value = typeOptionList[position];
                });
              },
              child: Text(
                typeOptionList[position],
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const ButtonTextStyle().textStyle.copyWith(
                    color: typeOptionObs.value == typeOptionList[position]
                        ? AppColors.white
                        : AppColors.radio_button_text_color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ));
  }

  Obx buildCustomCheckBox(BuildContext context, int position,
      List<String> mList, RxList<String> personalityOptionObs) {
    return Obx(() => Card(
          margin: const EdgeInsets.all(4),
          color: personalityOptionObs.contains(mList[position])
              ? AppColors.radio_selected_color
              : AppColors.white,
          shape: OutlineInputBorder(
            borderSide: BorderSide(
                color: personalityOptionObs.contains(mList[position])
                    ? AppColors.radio_selected_color
                    : AppColors.radio_un_selected_color,
                width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: SizedBox(
            height: 35,
            child: MaterialButton(
              shape: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.appBgColor, width: 1),
                borderRadius: BorderRadius.zero,
              ),
              onPressed: () {
                setState(() {
                  personalityOptionObs.contains(mList[position])
                      ? personalityOptionObs.remove(mList[position])
                      : personalityOptionObs.add(mList[position]);
                });
              },
              child: Text(
                mList[position],
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const ButtonTextStyle().textStyle.copyWith(
                    color: personalityOptionObs.contains(mList[position])
                        ? AppColors.white
                        : AppColors.radio_button_text_color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ));
  }

  Column buildColumn(String header, Widget sizedBox) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(header, style: buildHeaderTextStyle()),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: sizedBox,
        )
      ],
    );
  }

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
                        _openGalleryForImages(index);
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
              onSurface: AppColors.appSecondaryColor, // body text color
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
      availableFromController.text=getFormattedDate(picked.toString());
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
    final pickedFile = await ImagePicker().pickImage(
        // getImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxHeight: 480,
        maxWidth: 640);
    if (pickedFile != null) {
      loadImages(index, pickedFile);
    }
  }

  void _openGalleryForImages(int index) async {
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
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxHeight: 480,
        maxWidth: 640);
    if (pickedFile != null) {
      loadImages(index, pickedFile);
    }
  }

  loadImages(int index, XFile file) {
    setState(() {
      if (index == 1) {
        galleryImgFirst = file;
      } else if (index == 2) {
        galleryImgSecond = file;
      } else if (index == 3) {
        galleryImgThree = file;
      } else if (index == 4) {
        galleryImgFour = file;
      } else if (index == 5) {
        galleryImgFive = file;
      } else if (index == 6) {
        galleryImgSix = file;
      } else if (index == 7) {
        customerLogoImageFile = file;
      }
    });
  }

  removeImageFile(int index) {
    setState(() {
      if (index == 7) {
        customerLogoImageFile = null;
      } else {
        setState(() {
          imageFileList.removeAt(index);
        });
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
