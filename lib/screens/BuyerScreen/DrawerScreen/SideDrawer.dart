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
            padding: const EdgeInsets.only(top:0.0, bottom: 20.0, left: 20.0, right: 20.0),
            child: SizedBox(
              height: 210,
              child: Stack(
                alignment: Alignment.centerLeft,
                children:  [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: SizedBox(
                      height: 144,
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child:  Padding(
                          padding: const EdgeInsets.only(left: 100.0, top: 20),
                          child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Jenifer Mark'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text('jennifer.mark@gmail.com'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text('Member since September, 2019'),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                  CustomImageWidget(
                    imgUrl: 'https://i.pinimg.com/736x/55/f9/55/55f955717e64ddbae8e15a781fcd0043.jpg',
                    width: 110,
                    height: 110,
                    borderRadius: BorderRadius.all(Radius.circular(10))
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
