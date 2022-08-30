import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/main_appbar.dart';
import 'package:mlm/enum/ListViewType.dart';
import 'package:mlm/enum/Method.dart';

import 'package:mlm/screens/BuyerScreen/BuyHomeScreen/buy_home_controller.dart';
import 'package:mlm/screens/BuyerScreen/DrawerScreen/BuySideDrawer.dart';

import '../../../Widget/custom_image_widget.dart';

class BuyHomeScreen extends StatefulWidget {
  const BuyHomeScreen({Key? key}) : super(key: key);

  @override
  State<BuyHomeScreen> createState() => _BuyHomeScreenState();
}

class _BuyHomeScreenState extends State<BuyHomeScreen> {
  late String userName, password, sessionName;

  var userType = '';
  TextEditingController userNmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  BuyHomeController controller = Get.find();

  var token;

  final UserType _userType = UserType.buyer;
  ListViewType _viewType = ListViewType.grid;

  int _crossAxisCount = 2;
  double _aspectRatio = 2;

  @override
  void initState() {
    super.initState();

    userNmController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: controller.scaffoldKey,
        resizeToAvoidBottomInset: true,
        appBar: MainAppBar(
          menuItem: [
            IconButton(
              icon: Image.asset(
                'assets/ic_chat.png',
                color: AppColors.appColor,
                height: 18,
                width: 18,
              ),
              onPressed: () {},
            ),
          ],
          onTap: () {
            controller.openDrawer();
          },
        ),
        drawer: SizedBox(
            // width: MediaQuery.of(context).size.width * 0.8,
            child: BuySideDrawer()),
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 50),
                  child: const Text(
                    "Based on users navigation",
                    style: TextStyle(
                        fontFamily: 'Gibson',
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only( top: 50),
                  child: IconButton(
                    icon: Image.asset(_viewType == ListViewType.list
                        ? "assets/ic_gridview.png"
                        : "assets/ic_listview.png"),
                    onPressed: () {
                      if (_viewType == ListViewType.list) {
                        _crossAxisCount = 2;
                        _aspectRatio = 1.5;
                        _viewType = ListViewType.grid;
                      } else {
                        _crossAxisCount = 1;
                        _aspectRatio = 0.75;
                        _viewType = ListViewType.list;
                      }
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),

            Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                    crossAxisCount: _crossAxisCount,
                    childAspectRatio:  (_viewType == ListViewType.list) ? (MediaQuery.of(context).size.width/2)/90 : (MediaQuery.of(context).size.width/2)/180,
                    children: List.generate(50, (index) {
                      return getGridItem();
                    }))),
          ],
        ),
      ),
    );
  }

  GridTile getGridItem() {
    return GridTile(
      child: (_viewType == ListViewType.list)
          ? buildListViewItem()
          : buildGridViewItem(),
    );
  }

  SizedBox buildGridViewItem() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:0.0),
            child: SizedBox(
              height: 180,
              width: 180,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 1,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 30),
                            child: const Text('Jenifer Mark',
                                style: TextStyle(
                                    fontFamily: 'Gibson',
                                    fontWeight:
                                    FontWeight.w600),
                                overflow:
                                TextOverflow.ellipsis),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 20, left: 10),
                            child: Image.asset(
                              "assets/ic_group.png",
                              fit: BoxFit.contain,
                              width: 16,
                              height: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 10),
                            child: Image.asset(
                              "assets/ic_non_verified.png",
                              fit: BoxFit.contain,
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0, left: 10),
                        child: Text("\$1200",
                            style: TextStyle(
                                fontFamily: 'Gibson',
                                fontWeight:
                                FontWeight.w300),
                            overflow:
                            TextOverflow.ellipsis),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0, left: 10),
                        child: Text('Labrador',
                            style: TextStyle(
                                fontFamily: 'Gibson',
                                fontWeight:
                                FontWeight.w300),
                            overflow:
                            TextOverflow.ellipsis),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 3.0, left: 10),
                        child: Text('3 months old',
                            style: TextStyle(
                                fontFamily: 'Gibson',
                                fontWeight:
                                FontWeight.w300),
                            overflow:
                            TextOverflow.ellipsis),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 3.0, left: 10),
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
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: const CustomImageWidget(
                imgUrl:
                'https://sparkonus.com/wp-content/uploads/2022/06/photo-1600804340584-c7db2eacf0bf-1.jpg',
                width: 100,
                height: 100,
                borderRadius:
                BorderRadius.all(Radius.circular(12))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100.0, bottom: 0),
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
    );
  }

  SizedBox buildListViewItem() {
    return  SizedBox(

      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60.0, right: 30),
            child: SizedBox(
              height: 160,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 90.0),
                  child: Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            padding: EdgeInsets.only(top: 10.0),
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
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text('3 months old',
                                style: TextStyle(
                                    fontFamily: 'Gibson',
                                    fontWeight:
                                    FontWeight.w300),
                                overflow:
                                TextOverflow.ellipsis),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0),
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
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: const CustomImageWidget(
                imgUrl:
                'https://sparkonus.com/wp-content/uploads/2022/06/photo-1600804340584-c7db2eacf0bf-1.jpg',
                width: 120,
                height: 120,
                borderRadius:
                BorderRadius.all(Radius.circular(12))),
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
                child: Image.asset('assets/ic_like_heart.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
