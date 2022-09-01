import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/BuyerScreen/BuySellerProfileScreen/buy_seller_profile_controller.dart';
import 'package:mlm/Utils/constant.dart';

class BuySellerProfileView extends StatelessWidget {
  BuySellerProfileView({Key? key}) : super(key: key);

  BuySellerProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: const CustomAppBar(
          title: "Seller Profile",
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 15,  bottom: 20),
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
                                      child: Text('Member since September, 2019',
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
                  child: ListView.builder(
                      itemCount: 10, // the length
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 0.0, bottom: 10.0, left: 0.0, right: 0.0),
                          // padding: const EdgeInsets.only(
                          //     top: 0.0, bottom: 20.0, left: 20.0, right: 10.0),
                          child: SizedBox(
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.centerLeft,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60.0, right: 30),
                                  child: SizedBox(
                                    height: 160,
                                    width: double.infinity,
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            AppConstant.ROUTE_PET_PROFILE_VIEW);
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        elevation: 1,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 90.0),
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
                                                    const Text('logan',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Gibson',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
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
                                                  padding: EdgeInsets.only(
                                                      top: 10.0),
                                                  child: Text("\$1200",
                                                      style: TextStyle(
                                                          fontFamily: 'Gibson',
                                                          fontWeight:
                                                              FontWeight.w300),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10.0),
                                                  child: Text('Labrador',
                                                      style: TextStyle(
                                                          fontFamily: 'Gibson',
                                                          fontWeight:
                                                              FontWeight.w300),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text('3 months old',
                                                      style: TextStyle(
                                                          fontFamily: 'Gibson',
                                                          fontWeight:
                                                              FontWeight.w300),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5.0),
                                                  child: Text('Brisbane',
                                                      style: TextStyle(
                                                          fontFamily: 'Gibson',
                                                          fontWeight:
                                                              FontWeight.w300),
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 18.0),
                                  child: CustomImageWidget(
                                      imgUrl:
                                          'https://sparkonus.com/wp-content/uploads/2022/06/photo-1600804340584-c7db2eacf0bf-1.jpg',
                                      width: 120,
                                      height: 120,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                                Positioned(
                                  bottom: 25,
                                  right: 10,
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      elevation: 5,
                                      child: Image.asset(
                                          'assets/ic_like_heart.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }))
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
}
