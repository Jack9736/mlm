import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_app_button_widget.dart';
import 'package:mlm/screens/SellerScreen/SellHomeScreen/MockData.dart';
import 'package:mlm/screens/SellerScreen/SellHomeScreen/section_widget.dart';
import 'package:mlm/screens/SellerScreen/SellHomeScreen/sell_home_controller.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';
import '../../../Utils/constant.dart';
import '../../../Widget/custom_image_widget.dart';
import '../../../Widget/main_appbar.dart';
import '../../BuyerScreen/DrawerScreen/BuySideDrawer.dart';
import '../DrawerScreen/SellSideDrawer.dart';

class SellHomeScreen extends StatefulWidget {
  const SellHomeScreen({Key? key}) : super(key: key);

  @override
  _SellHomeScreenState createState() => _SellHomeScreenState();
}

class _SellHomeScreenState extends State<SellHomeScreen> {
  var sectionList = MockData.getExampleSections();
  SellHomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        appBar: MainAppBar(
          menuItem: [
            IconButton(
              icon: Image.asset(
                'assets/ic_chat.png',
                color: AppColors.appColor,
                height: 18,
                width: 18,
              ),
              onPressed: () {
                Get.toNamed(AppConstant.ROUTE_MY_MESSAGES);
              },
            ),
          ],
          onTap: () {
            controller.openDrawer();
          },
        ),
        drawer: SizedBox(
            // width: MediaQuery.of(context).size.width * 0.8,
            child: SellSideDrawer()),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppButtonWidget(
                onTap: () {
                  Get.toNamed(AppConstant.ROUTE_PET_ADD_VIEW);
                },
                text: "ADD NEW PET".toUpperCase(),
                icon: const Icon(
                  Icons.add,
                  color: AppColors.white,
                )), //widget here
            Expanded(
              child: ExpandableListView(
                builder: SliverExpandableChildDelegate<String, ExampleSection>(
                  sectionList: sectionList,
                  itemBuilder: (context, sectionIndex, itemIndex, index) {
                    String item = sectionList[sectionIndex].items[itemIndex];
                    return SizedBox(
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.centerLeft,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 20),
                            child: SizedBox(
                              height: 160,
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {},
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 90.0),
                                    child: Row(
                                      children: [
                                        Expanded(
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
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5.0),
                                                      child: Text('Brisbane',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Gibson',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 5.0, right: 8),
                                                      child: Text('120 views',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Gibson',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                  ],
                                                )
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 5, right: 20, child: buildPopupMenuButton()),
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: CustomImageWidget(
                                imgUrl:
                                    'https://sparkonus.com/wp-content/uploads/2022/06/photo-1600804340584-c7db2eacf0bf-1.jpg',
                                width: 120,
                                height: 120,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                        ],
                      ),
                    );
                  },
                  sectionBuilder: (context, containerInfo) => SectionWidget(
                    section: sectionList[containerInfo.sectionIndex],
                    containerInfo: containerInfo,
                    onStateChanged: () {
                      //notify ExpandableListView that expand state has changed.
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) {
                          setState(() {});
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

const menuItemTextStyle = TextStyle(
    color: AppColors.popUpMenuTextColor,
    fontSize: 13,
    fontFamily: 'Gibson',
    fontWeight: FontWeight.w400);

PopupMenuButton<String> buildPopupMenuButton() {
  return PopupMenuButton(
      icon: const Icon(Icons.more_vert, color: Colors.black), // add this line

      itemBuilder: (_) {
        return [
          buildPopupMenuItem("Edit Pet Profile"),
          const PopupMenuDivider(),
          buildPopupMenuItem("Unlist"),
          const PopupMenuDivider(),
          buildPopupMenuItem("Delete"),
        ];
      },
      onSelected: (index) async {
        switch (index) {
          case 'report':
            // showDialog(
            //     barrierDismissible: true,
            //     context: context,
            //     builder: (context) => ReportUser(
            //       currentUser: widget.sender,
            //       seconduser: widget.second,
            //     )).then((value) => Navigator.pop(ct))
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
