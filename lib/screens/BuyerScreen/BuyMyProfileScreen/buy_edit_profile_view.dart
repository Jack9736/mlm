import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/screens/BuyerScreen/BuyMyProfileScreen/buy_myprofile_controller.dart';

import '../../../Utils/XFile.dart';

class BuyEditProfileView extends StatefulWidget {
  BuyEditProfileView({Key? key}) : super(key: key);

  @override
  State<BuyEditProfileView> createState() => _BuyEditProfileViewState();
}

class _BuyEditProfileViewState extends State<BuyEditProfileView> {
  BuyMyProfileController controller = Get.find();
  Rxn<XFile> imageFile = Rxn<XFile>();
  final _obscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    var imageSize = 120.0;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: AppColors.appBgColor,
          appBar: const CustomAppBar(
            title: "Edit Profile",
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: InkWell(
                          onTap: () {
                            _showImagePickerDialog(context, 1, imageFile);
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              imageFile.value != null
                                  ? Container(
                                      width: imageSize,
                                      height: imageSize,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.black,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.8),
                                                BlendMode.dstATop),
                                            image: FileImage(
                                                File(imageFile.value!.path))),
                                      ),
                                    )
                                  : CustomImageWidget(
                                      imgUrl:
                                          'https://i.pinimg.com/736x/55/f9/55/55f955717e64ddbae8e15a781fcd0043.jpg',
                                      width: imageSize,
                                      height: imageSize,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                              Positioned(
                                bottom: -10.5,
                                right: -10.5,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/ic_pencil.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 50, bottom: 00.0, left: 20.0, right: 20.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 00, bottom: 20.0, left: 20.0, right: 20.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.black,
                                  style: buildTextStyle(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter first name';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    // firstName = value!;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'First Name*',
                                    labelStyle: buildTextStyle(),

                                    //labelText: 'First Name'
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.black,
                                  style: buildTextStyle(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter last name';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    // firstName = value!;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Last Name*',
                                    labelStyle: buildTextStyle(),

                                    //labelText: 'First Name'
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.black,
                                  style: buildTextStyle(),
                                  validator: (value) {
                                    bool validEmail = RegExp(
                                            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .hasMatch(value!);
                                    if (value.isEmpty || !validEmail) {
                                      return 'Enter your email address';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    // firstName = value!;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Email*',
                                    labelStyle: buildTextStyle(),

                                    //labelText: 'First Name'
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.black,
                                  style: buildTextStyle(),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter phone number';
                                    }
                                    return null;
                                  },
                                  onSaved: (String? value) {
                                    // firstName = value!;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Phone number*',
                                    labelStyle: buildTextStyle(),

                                    //labelText: 'First Name'
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => TextFormField(
                                      obscureText: _obscureText.value,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: Colors.black,
                                      style: buildTextStyle(),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Password';
                                        }
                                        return null;
                                      },
                                      onSaved: (String? value) {
                                        // firstName = value!;
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            _obscureText.value
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.grey[300],
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            _obscureText.value =
                                                !_obscureText.value;
                                          },
                                        ),
                                        labelText: 'Password*',
                                        labelStyle: buildTextStyle(),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        )),
                    Expanded(child: Container()),
                    nextButton(context)
                  ],
                ),
              ),
            ],
          )),
    );
  }

  TextStyle buildTextStyle() {
    return const TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Gibson',
        color: AppColors.topHeaderBlueClr);
  }

  /* Next Button */
  Container nextButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25, left: 20, right: 20, top: 20),
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
                : const Text('UPDATE PROFILE',
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
            onPressed: () {},
          )),
    );
  }

  Future _showImagePickerDialog(
      BuildContext context, int index, Rxn<XFile> file) {
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
                      _openGallery(index);
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
                  if (file.value != null)
                    const Divider(
                      height: 1,
                      color: Colors.blue,
                    ),
                  if (file.value != null)
                    ListTile(
                      onTap: () {
                        showImage(context, file.value!);
                      },
                      title: const Text("View"),
                      leading: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.blue,
                      ),
                    ),
                  if (file.value != null)
                    const Divider(
                      height: 1,
                      color: Colors.blue,
                    ),
                  if (file.value != null)
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
        pickType: PickType.image, language: Language.System, maxSize: 5);
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
    imageFile.value = file;
  }

  removeImageFile(int index) {
    imageFile.value = null;
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
}
