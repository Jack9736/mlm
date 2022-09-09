import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/screens/SellerScreen/SellMyProfileScreen/sell_myprofile_controller.dart';

class SellMyProfileView extends StatelessWidget {
  SellMyProfileView({Key? key}) : super(key: key);

  SellMyProfileController controller = Get.find();

  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: const CustomAppBar(
          title: "My Profile Seller",
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 20),
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
                          height: 144,
                          width: double.infinity,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text('Jenifer Mark',
                                          style: TextStyle(
                                              fontFamily: 'Gibson',
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text('jennifer.mark@gmail.com',
                                          style: TextStyle(
                                              fontFamily: 'Gibson',
                                              fontWeight: FontWeight.w300),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text(
                                          'Member since September, 2019',
                                          style: TextStyle(
                                              fontFamily: 'Gibson',
                                              fontWeight: FontWeight.w300),
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      const CustomImageWidget(
                          imgUrl:
                              'https://i.pinimg.com/736x/55/f9/55/55f955717e64ddbae8e15a781fcd0043.jpg',
                          width: 110,
                          height: 110,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 10.0, left: 20.0, right: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 32,
                  child: Image.asset(
                    "assets/ic_text_puppy_scam.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                    children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: 10),
                          _createDrawerItem(
                            title: 'PROFILE'.tr,
                          ),
                          buildDividerPadding(),
                          buildListTileForAboutMe("Name", "Jennifer Mark"),
                          buildDividerPadding(),
                          buildListTileForAboutMe(
                              "Email", "jennifer.mark@gmail.com"),
                          buildDividerPadding(),
                          buildListTileForAboutMe("Password", "123456"),
                          buildDividerPadding(),
                          buildListTileForAboutMe("Phone Number", "1234567890"),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              const SizedBox(height: 10),
                              _createDrawerItem(
                                title: 'BREEDER PROFILE'.tr,
                              ),
                              buildDividerPadding(),
                              buildListTileForAboutMe("Business Name", "Perfect Pets"),
                              buildDividerPadding(),
                              buildListTileForAboutMe(
                                  "Breeder Number", "1234567"),
                              buildDividerPadding(),
                              buildListTileForAboutMe("Display Name", "Jennifer"),
                              buildDividerPadding(),
                              buildListTileForAboutMe("Association No.:", "1234567890"),
                              buildListTileForAboutMe("", "1234567890"),
                              buildListTileForAboutMe("", "1234567890"),
                              buildDividerPadding(),
                              buildListTileForAboutMe("Post Code", "4163"),
                              buildDividerPadding(),
                              buildListTileForAboutMe("Email", "jennifer.mark@gmail.com"),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                ]),
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
                    (title == "PROFILE") || (title == "BREEDER PROFILE") ? FontWeight.w600 : FontWeight.w400,
                fontFamily: 'Gibson',
              ),
            )
          ],
        ),
        trailing: SizedBox(
          height: double.infinity,
          child: (title == "PROFILE") || (title == "BREEDER PROFILE")
              ? Icon(Icons.edit, size: 18, color: AppColors.appSecondaryColor)
              : null,
        ),
      ),
    );
  }

  ListTile buildListTileForAboutMe(String lbl, String value) {
    return ListTile(
        dense: true,
        visualDensity: VisualDensity(vertical: -1),
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
}
