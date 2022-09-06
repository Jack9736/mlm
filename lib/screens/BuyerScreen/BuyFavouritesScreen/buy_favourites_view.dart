import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/BuyerScreen/BuyFavouritesScreen/buy_favourites_controller.dart';
import 'package:mlm/Utils/constant.dart';
class FavouriteView extends StatelessWidget {
  FavouriteView({Key? key}) : super(key: key);

  FavouriteViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: const CustomAppBar(
          title: "Favourites",

        ),

        body: ListView.builder(

            itemCount: 10, // the length
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 20.0, left: 20.0, right: 10.0),
                child: SizedBox(
                  // height: 210,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 30.0, right: 20),
                        child: SizedBox(
                          height: 144,
                          width: double.infinity,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 100.0),
                              child: Flexible(
                                child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          const Text('Jenifer Mark',
                                              style: TextStyle(
                                                  fontFamily: 'Gibson',
                                                  fontWeight:
                                                  FontWeight.w600),
                                              overflow:
                                              TextOverflow.ellipsis),
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Image.asset(
                                              "assets/ic_group.png",
                                              fit: BoxFit.contain,
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                          Image.asset(
                                            "assets/ic_non_verified.png",
                                            fit: BoxFit.contain,
                                            width: 16,
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Text("\$1200",
                                            style: TextStyle(
                                                fontFamily: 'Gibson',
                                                fontWeight:
                                                FontWeight.w300),
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text('Labrador',
                                            style: TextStyle(
                                                fontFamily: 'Gibson',
                                                fontWeight:
                                                FontWeight.w300),
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 3.0),
                                        child: Text('3 months old',
                                            style: TextStyle(
                                                fontFamily: 'Gibson',
                                                fontWeight:
                                                FontWeight.w300),
                                            overflow:
                                            TextOverflow.ellipsis),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 3.0),
                                        child: Text('Brisbane',
                                            style: TextStyle(
                                                fontFamily: 'Gibson',
                                                fontWeight:
                                                FontWeight.w300),
                                            overflow:
                                            TextOverflow.ellipsis),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const CustomImageWidget(
                          imgUrl:
                          'https://sparkonus.com/wp-content/uploads/2022/06/photo-1600804340584-c7db2eacf0bf-1.jpg',
                          width: 120,
                          height: 120,
                          borderRadius:
                          BorderRadius.all(Radius.circular(12))),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            elevation: 5,
                            child: Image.asset('assets/ic_like_heart.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  SizedBox buildBtnLogout(BuildContext context) {
    return SizedBox(
      height: AppConstant.appButtonSize,
      width: double.infinity,
      child: Obx(() => TextButton(
        child: controller.isLoading.value
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
      // controller.title.value = 'menu_dealers'.tr;
        break;
      case 4:
      // Get.toNamed(AppConstant.routeDownload);
        break;
      case 5:
        controller.title.value = 'menu_contact_us'.tr;
        controller.selectedScreen.value = 2;
        break;
      case 6:
        {}
        break;
      case 7:
        {
          // Get.toNamed(AppConstant.routeMyOrder);
        }
        break;
      case 8:
      // Get.toNamed(AppConstant.routeResetPassword);
        break;
      case 9:
      // Get.toNamed(AppConstant.routeMyProfile);
        break;
      case 10:
        {
          // _logoutConfirmation(context);
          break;
        }
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
