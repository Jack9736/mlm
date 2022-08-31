import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/screens/PetProfileScreen/pet_profile_controller.dart';

import '../../Utils/constant.dart';
import '../../Widget/custom_image_widget.dart';

class PetProfileView extends StatelessWidget {
  PetProfileView({Key? key}) : super(key: key);
  ProfilePetController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height * 0.3,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0))),
                child: Image(
                  width: size.width,
                  height: size.height * 0.3,
                  fit: BoxFit.none,
                  image: const AssetImage('assets/ic_puppy.jpeg'),
                ),
                // child: Image.network(tutorImage),
              ),
              Positioned(
                bottom: -30,
                right: 0,
                child: Row(
                  children: [
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Image.asset(
                        'assets/ic_like_heart.png',
                        width: 27,
                        height: 27,
                        fit: BoxFit.contain,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Logan",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gibson',
                      color: AppColors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    "assets/ic_group.png",
                    fit: BoxFit.contain,
                    width: 25,
                    height: 25,
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                "\$1200",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Gibson',
                    color: AppColors.gray_text_color),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "1 year old • Labrador",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Gibson',
                          color: AppColors.gray_text_color),
                    ),
                    Icon(
                      Icons.location_pin,
                      color: AppColors.locationMarkerColor,
                    ),
                    Text(
                      "Brisbane, QLD",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Gibson',
                          color: AppColors.gray_text_color),
                    )
                  ],
                ),
              )
            ],
          ),
          const Divider(),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Perfect Pets",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gibson',
                      color: AppColors.petProfileDetailLblColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(
                    "assets/ic_non_verified.png",
                    fit: BoxFit.contain,
                    width: 16,
                    height: 16,
                  ),
                )
              ],
            ),
            subtitle: const Text("Perfect Pets",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Gibson',
                    color: AppColors.black)),
            leading: Container(
              width: 50,
              height: 50,
              child: const ClipOval(
                child: CustomImageWidget(
                  width: 50,
                  height: 50,
                  imgUrl:
                      'https://sparkonus.com/wp-content/uploads/2022/06/photo-1600804340584-c7db2eacf0bf-1.jpg',
                ),
              ),
            ),
            trailing: const SizedBox(
              height: double.infinity,
              child: Icon(Icons.arrow_forward_ios,
                  size: 18, color: AppColors.black),
            ),
            onTap: () {
              Get.toNamed(AppConstant.ROUTE_BUY_SELLER_PROFILE_VIEW);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("ABOUT ME:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gibson',
                        color: AppColors.petProfileDetailLblColor)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Divider(
                      color: AppColors.petProfileDetailLblColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.0),
            child: Text(
                "Logan is a really loyal Lab who loves to play catch! He also likes to cuddle and has quite an appetite. Do note that he is allergic to any kind of fish, other sources of protein is perfectly fine. He’ll be perfect for families cause he absolutely adores kids!",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Gibson',
                    color: AppColors.black)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("PET DETAILS:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gibson',
                        color: AppColors.petProfileDetailLblColor)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Divider(
                      color: AppColors.petProfileDetailLblColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          buildListTileForAboutMe("Breed", "Labrador"),
          buildAboutMeDividerLine(),
          buildListTileForAboutMe("Location", "Brisbane"),
          buildAboutMeDividerLine(),
          buildListTileForAboutMe("State", "Queensland"),
          buildAboutMeDividerLine(),
          buildListTileForAboutMe("Size", "Medium"),
          buildAboutMeDividerLine(),
          buildListTileForAboutMe("Age", "1 year old"),
          buildAboutMeDividerLine(),
          buildListTileForAboutMe("Gender", "Male"),
          buildAboutMeDividerLine(),
          buildListTileForAboutMe("Personality", "Good with kids"),
          buildListTileForAboutMe("", "Good with seniors"),
          buildListTileForAboutMe("", "Sleepy / Quiet"),
          buildListTileForAboutMe("", "Clever"),
          buildListTileForAboutMe("", "Very excitable \n Protective"),
          buildListTileForAboutMe("", "Protective"),
          buildAboutMeDividerLine(),
          loginButton(context)
        ],
      ),
    );
  }

  ListTile buildListTileForAboutMe(String lbl, String value) {
    return ListTile(
      leading: buildAboutMeLbl(lbl),
      trailing: buildAboutMeValue(value),
    );
  }

  Padding buildAboutMeDividerLine() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Divider(),
    );
  }

  Text buildAboutMeValue(String s) {
    return Text(s,
        textAlign: TextAlign.right,
        style: const TextStyle(
            letterSpacing: 1,
            height: 1,
            fontSize: 12,
            fontWeight: FontWeight.w100,
            fontFamily: 'Gibson',
            color: AppColors.petProfileDetailLblColor));
  }

  Text buildAboutMeLbl(String s) {
    return Text(s,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w100,
            fontFamily: 'Gibson',
            color: AppColors.black));
  }

  Expanded buildExpanded(String strValue, String strLabel, Color color) {
    return Expanded(
      child: SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            color: color,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  strValue,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  strLabel,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  /* Login Button */
  Container loginButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, left: 12, right: 12, top: 25),
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
                : const Text('NEXT',
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
}
