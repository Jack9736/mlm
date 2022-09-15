import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Utils/constant.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';
import 'package:mlm/screens/MyMessageScreen/my_messages_controller.dart';

class MyMessagesScreen extends StatelessWidget {
  MyMessagesScreen({Key? key}) : super(key: key);

  MymessagesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appBgColor,
        appBar: const CustomAppBar(
          title: "My Messages",
        ),
        body: ListView.builder(
            itemCount: 50, // the length
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(AppConstant.ROUTE_BUY_CHAT_WITH_SALLER);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, bottom: 0.0, left: 20.0, right: 0.0),
                  child: SizedBox(
                    // height: 210,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.centerLeft,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 20),
                          child: SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50.0),
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
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                              overflow:
                                                  TextOverflow.ellipsis),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text('Logan',
                                            style: TextStyle(
                                                fontFamily: 'Gibson',
                                                fontWeight: FontWeight.w300),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 3.0),
                                        child: Text('Labrador',
                                            style: TextStyle(
                                                fontFamily: 'Gibson',
                                                fontWeight: FontWeight.w300),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 3.0),
                                        child: Text('3 months old',
                                            style: TextStyle(
                                                fontFamily: 'Gibson',
                                                fontWeight: FontWeight.w300),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        const CustomImageWidget(
                            imgUrl:
                                'https://sparkonus.com/wp-content/uploads/2022/06/photo-1600804340584-c7db2eacf0bf-1.jpg',
                            width: 65,
                            height: 65,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Padding buildDividerPadding() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Divider(),
    );
  }
}
