import 'package:flutter/material.dart';
import 'package:mlm/Style/app_colors.dart';
import 'package:mlm/Widget/custom_image_widget.dart';
import 'package:mlm/Widget/widget_appbar.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: const CustomAppBar(title: "Menu",),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 150,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: SizedBox(
                      height: 144,
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                      ),
                    ),
                  ),
                  CustomImageWidget(
                    imgUrl: 'assets/lady.png',
                    width: 120,
                    height: 120,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Card(
                  child: ListView(
                    children: const [
                      ListTile(
                          title: Text("Home",textAlign: TextAlign.start,),
                          isThreeLine: true,
                          //will fix the alignment if the subtitle text is too big
                          subtitle: Text(""),
                          trailing: Icon(Icons.arrow_forward_ios_outlined)),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
