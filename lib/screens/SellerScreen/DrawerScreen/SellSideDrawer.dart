import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/BuyerScreen/BuyHomeScreen/buy_home_controller.dart';

import '../../../Utils/constant.dart';
import '../SellHomeScreen/sell_home_controller.dart';

class SellSideDrawer extends StatelessWidget {
  SellSideDrawer({Key? key}) : super(key: key);

  SellHomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                            padding:
                                const EdgeInsets.only(left: 100.0, top: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/ic_non_verified.png",
                                    fit: BoxFit.contain,
                                    width: 16,
                                    height: 16,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text('Jenifer Mark',
                                        style: TextStyle(
                                            fontFamily: 'Gibson',
                                            fontWeight: FontWeight.w600),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text('jennifer.mark@gmail.com',
                                        style: TextStyle(
                                            fontFamily: 'Gibson',
                                            fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const Padding(
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
                  top: 20, bottom: 30.0, left: 25.0, right: 25.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/ic_text_puppy_scam.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 10),
                    _createDrawerItem(
                      title: 'My Breeder Profile'.tr,
                      isSelected: controller.selectedDestination.value == 1,
                      onTap: () => selectDestination(1),
                    ),
                    buildDividerPadding(),
                    _createDrawerItem(
                      title: 'Pet Manager'.tr,
                      isSelected: controller.selectedDestination.value == 2,
                      onTap: () => selectDestination(2),
                    ),
                    buildDividerPadding(),
                    _createDrawerItem(
                      title: 'Add Pet'.tr,
                      isSelected: controller.selectedDestination.value == 3,
                      onTap: () => selectDestination(3),
                    ),
                    buildDividerPadding(),
                    _createDrawerItem(
                      title: 'My Messages'.tr,
                      isSelected: controller.selectedDestination.value == 4,
                      onTap: () => selectDestination(4),
                    ),
                    buildDividerPadding(),
                    _createDrawerItem(
                      title: 'Help / Settings'.tr,
                      isSelected: controller.selectedDestination.value == 5,
                      onTap: () => selectDestination(5),
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
          controller.title.value = 'menu_products'.tr;
        }
        break;
      case 3:
        {
         // controller.title.value = AppConstant.ROUTE_MY_PROFILE.tr;
          Get.toNamed(AppConstant.ROUTE_PET_ADD_VIEW);
        }
        break;
      case 4:
        {
          controller.title.value = AppConstant.TITLE_MY_MESSAGES.tr;
          Get.toNamed(AppConstant.ROUTE_MY_MESSAGES);
        }
        break;
      case 5:
        controller.title.value = 'menu_contact_us'.tr;
        controller.selectedScreen.value = 2;
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
