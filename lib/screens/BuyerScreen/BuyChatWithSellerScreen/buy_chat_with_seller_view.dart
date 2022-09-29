import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/screens/BuyerScreen/BuyMyProfileScreen/buy_myprofile_controller.dart';

import '../../../Utils/XFile.dart';

class BuyChatWithSellerView extends StatefulWidget {
  const BuyChatWithSellerView({Key? key}) : super(key: key);

  @override
  State<BuyChatWithSellerView> createState() => _BuyChatWithSellerViewState();
}

class _BuyChatWithSellerViewState extends State<BuyChatWithSellerView> {
  BuyMyProfileController controller = Get.find();

  TextEditingController msgEditingController = TextEditingController();

  bool isObscure = false;

  XFile? customerLogoImageFile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
          backgroundColor: AppColors.appBgColor,
          appBar: CustomAppBar(
            title: "Chat with Buyer",
            menuItem: [buildPopupMenuButton()],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 00),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: SizedBox(
                            height: 75,
                            width: double.infinity,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Row(
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text('Logan',
                                              style: TextStyle(
                                                  fontFamily: 'Gibson',
                                                  fontWeight: FontWeight.w600),
                                              overflow: TextOverflow.ellipsis),
                                          Text('Labrador',
                                              style: TextStyle(
                                                  fontFamily: 'Gibson',
                                                  fontWeight: FontWeight.w300),
                                              overflow: TextOverflow.ellipsis),
                                        ]),
                                    const Spacer(),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('\$1200',
                                          style: TextStyle(
                                              fontFamily: 'Gibson',
                                              fontWeight: FontWeight.w100),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const CustomImageWidget(
                            imgUrl:
                                'https://i.pinimg.com/736x/55/f9/55/55f955717e64ddbae8e15a781fcd0043.jpg',
                            width: 55,
                            height: 55,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 20, bottom: 10.0, left: 20.0, right: 20.0),
                  child: Text('START A CHAT WITH [BREEDER NAME]',
                      style: TextStyle(
                          fontFamily: 'Gibson',
                          fontWeight: FontWeight.w100,
                          color: AppColors.gray_text_color),
                      overflow: TextOverflow.ellipsis),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 75,
                  decoration: const BoxDecoration(color: AppColors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset("assets/ic_attachment.png"),
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (builder) => bottomSheet());
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 20),
                            child: TextField(
                              minLines: 1,
                              maxLines: 5,
                              controller: msgEditingController,
                              decoration: const InputDecoration(
                                  hintText: "Write your message…",
                                  hintStyle: TextStyle(
                                      color: AppColors.chat_edt_hint_color),
                                  border: InputBorder.none),
                              style: const TextStyle(
                                  fontFamily: 'Gibson',
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                              color: AppColors.appSecondaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget bottomSheet() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: const EdgeInsets.all(10.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child:
                          iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                      onTap: () {
                        _openCamera(7);
                      },
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    InkWell(
                      child: iconCreation(
                          Icons.insert_photo, Colors.purple, "Gallery"),
                      onTap: () {
                        _openGallery(7);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icons,
            // semanticLabel: "Help",
            size: 29,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            // fontWeight: FontWeight.w100,
          ),
        )
      ],
    );
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

  loadImages(int index, XFile file) {
    setState(() {
      if (index == 7) {
        customerLogoImageFile = file;
      }
    });
  }

  var menuItemTextStyle = const TextStyle(
      color: AppColors.popUpMenuTextColor,
      fontSize: 13,
      fontFamily: 'Gibson',
      fontWeight: FontWeight.w400);

  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton(
        icon: const Icon(Icons.more_vert, color: Colors.white), // add this line
        itemBuilder: (_) {
          return [
            buildPopupMenuItem("View"),
            const PopupMenuDivider(),
            buildPopupMenuItem("Clear"),
          ];
        },
        onSelected: (index) async {
          switch (index) {
            case 'report':
              break;
          }
        });
  }

  PopupMenuItem<String> buildPopupMenuItem(String title) {
    return PopupMenuItem<String>(
        height: 30,
        child: SizedBox(
            width: 100,
            child: Text(
              title,
              style: menuItemTextStyle,
            )),
        value: title);
  }
}
