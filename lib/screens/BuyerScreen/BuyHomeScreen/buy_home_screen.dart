import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

  int boxSize = 170;
  int imageSize = 130;

  final UserType _userType = UserType.buyer;
  ListViewType _viewType = ListViewType.grid;

  int _crossAxisCount = 2;
  double _aspectRatio = 2;

  final TextEditingController _textSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    userNmController.addListener(() {
      setState(() {});
    });
  }

  onItemChanged(String value) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        FocusManager.instance.primaryFocus?.unfocus(),
        FocusScope.of(context).requestFocus(FocusNode())
      },
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(children: [
                    Flexible(
                      child: TextField(
                        controller: _textSearchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search query',
                        ),
                        onChanged: onItemChanged,
                      ),
                    ),
                    IconButton(
                      icon: Image.asset("assets/ic_filter.png"),
                      onPressed: () {},
                    ),
                  ]),
                ),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Based on users navigation",
                    style: TextStyle(
                        fontFamily: 'Gibson',
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
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
                child: AlignedGridView.count(
              crossAxisCount: _crossAxisCount,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
                return getGridItem();
              },
              itemCount: 200,
            )),
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
       height: (boxSize + imageSize) - 30.toDouble(),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                height: boxSize.toDouble(),
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30.0, left: 10, right: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Jenifer Mark',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Gibson',
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text("\$1200",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Gibson',
                                            fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text('Labrador',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Gibson',
                                            fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text('3 months old',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Gibson',
                                            fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text('Brisbane',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Gibson',
                                            fontWeight: FontWeight.w300),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/ic_like_heart.png',
                                    color: AppColors.appColor,
                                    height: 18,
                                    width: 18,
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CustomImageWidget(
                height: imageSize.toDouble(),
                width: imageSize.toDouble(),
                imgUrl:
                'https://sparkonus.com/wp-content/uploads/2022/06/photo-1600804340584-c7db2eacf0bf-1.jpg',
                borderRadius: BorderRadius.all(Radius.circular(15))),
          )

        ],
      ),
    );
  }

  SizedBox buildListViewItem() {
    return SizedBox(
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Jenifer Mark',
                                style: TextStyle(
                                    fontFamily: 'Gibson',
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
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
                                  fontWeight: FontWeight.w300),
                              overflow: TextOverflow.ellipsis),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text('Labrador',
                              style: TextStyle(
                                  fontFamily: 'Gibson',
                                  fontWeight: FontWeight.w300),
                              overflow: TextOverflow.ellipsis),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text('3 months old',
                              style: TextStyle(
                                  fontFamily: 'Gibson',
                                  fontWeight: FontWeight.w300),
                              overflow: TextOverflow.ellipsis),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text('Brisbane',
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
