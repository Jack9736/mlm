import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/screens/BuyerScreen/BuyMyProfileScreen/buy_myprofile_controller.dart';

class BuyChatWithSellerView extends StatelessWidget {
  BuyChatWithSellerView({Key? key}) : super(key: key);

  BuyMyProfileController controller = Get.find();

  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    top: 20, bottom: 10.0, left: 20.0, right: 20.0),
                child: Text('START A CHAT WITH [BREEDER NAME]',
                    style: TextStyle(
                        fontFamily: 'Gibson', fontWeight: FontWeight.w100),
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
                decoration: const BoxDecoration(color: AppColors.white),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.attachment_outlined,
                        color: AppColors.appColor,
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Write your message…',
                              style: TextStyle(
                                  fontFamily: 'Gibson',
                                  fontWeight: FontWeight.w100),
                              overflow: TextOverflow.ellipsis),
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
        ));
  }

  Padding buildDividerPadding() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Divider(),
    );
  }

  Widget _createDrawerItem({required String title}) {
    return Ink(
      child: ListTile(
        selected: true,
        hoverColor: Colors.white,
        title: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    (title == "PROFILE") ? FontWeight.w600 : FontWeight.w400,
                fontFamily: 'Gibson',
              ),
            )
          ],
        ),
        trailing: SizedBox(
          height: double.infinity,
          child: (title == "PROFILE")
              ? InkWell(
                  onTap: () {
                    Get.toNamed(AppConstant.ROUTE_BUY_EDIT_PROFILE);
                  },
                  child: const Icon(Icons.edit,
                      size: 18, color: AppColors.appSecondaryColor))
              : null,
        ),
      ),
    );
  }

  ListTile buildListTileForAboutMe(String lbl, String value) {
    return ListTile(
      leading: buildAboutMeLbl(lbl),
      trailing: buildAboutMeValue(value),
    );
  }

  Text buildAboutMeValue(String s) {
    return Text(s,
        textAlign: TextAlign.right,
        style: const TextStyle(
            letterSpacing: 0.5,
            height: 0,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Gibson',
            color: AppColors.petProfileDetailLblColor));
  }

  Text buildAboutMeLbl(String s) {
    return Text(s,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Gibson',
            color: AppColors.black));
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
