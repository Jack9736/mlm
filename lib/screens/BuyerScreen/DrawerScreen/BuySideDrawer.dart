import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/BuyerScreen/BuyHomeScreen/buy_home_controller.dart';

class BuySideDrawer extends StatelessWidget {
  BuySideDrawer({Key? key}) : super(key: key);

  BuyHomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: const CustomAppBar(
        title: "Menu",
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 20.0, bottom: 20, right: 20.0),
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
                            child: Flexible(
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
                  top: 20, bottom: 30.0, left: 25.0, right: 25.0),
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
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 10),
                    _createDrawerItem(
                      title: 'Home'.tr,
                      isSelected: controller.selectedDestination.value == 1,
                      onTap: () => selectDestination(1),
                    ),
                    buildDividerPadding(),
                    _createDrawerItem(
                      title: 'Recently Viewed'.tr,
                      isSelected: controller.selectedDestination.value == 2,
                      onTap: () => selectDestination(2),
                    ),
                    buildDividerPadding(),
                    _createDrawerItem(
                      title: 'My Messages'.tr,
                      isSelected: controller.selectedDestination.value == 3,
                      onTap: () => selectDestination(3),
                    ),
                    buildDividerPadding(),
                    _createDrawerItem(
                      title: 'My Profile'.tr,
                      isSelected: controller.selectedDestination.value == 4,
                      onTap: () => selectDestination(4),
                    ),
                    buildDividerPadding(),
                    _createDrawerItem(
                      title: 'Favourites'.tr,
                      isSelected: controller.selectedDestination.value == 5,
                      onTap: () => selectDestination(5),
                    ),
                    buildDividerPadding(),
                    _createDrawerItem(
                      title: 'Help / Settings'.tr,
                      isSelected: controller.selectedDestination.value == 6,
                      onTap: () => selectDestination(6),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: buildBtnLogout(context),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildBtnLogout(BuildContext context) {
    return SizedBox(
      height: 50,
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
                : Text('Log Out'.toUpperCase(),
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

  Padding buildDividerPadding() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Divider(),
    );
  }

  void selectDestination(int index) {
    controller.selectedDestination.value = index;
    switch (index) {
      case 1:
        controller.title.value = 'menu_about_us'.tr;
        controller.selectedScreen.value = 1;
        break;
      case 2:
        {
          controller.selectedScreen.value = 0;
          controller.title.value = AppConstant.TITLE_RECENTLY_VIEW.tr;
          Get.toNamed(AppConstant.ROUTE_RECENTLY_VIEW);
        }
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
        break;
    }
    controller.closeDrawer();
  }

  Widget _createDrawerItem(
      {required String title,
      required GestureTapCallback onTap,
      required bool isSelected}) {
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
                fontWeight: FontWeight.w300,
                fontFamily: 'Gibson',
                color: isSelected
                    ? AppColors.drawerMenuSelectedColor
                    : AppColors.drawerMenuUnSelectedColor,
              ),
            )
          ],
        ),
        trailing: const SizedBox(
          height: double.infinity,
          child:
              Icon(Icons.arrow_forward_ios, size: 18, color: AppColors.black),
        ),
        onTap: onTap,
      ),
    );
  }
}
