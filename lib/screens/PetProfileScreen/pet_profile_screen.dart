import 'package:flutter/material.dart';
import 'package:mlm/Style/app_colors.dart';

import '../components/slanding_clipper.dart';

class PetProfileView extends StatelessWidget {
  const PetProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    var appPadding = 20.0;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: ClipPath(
                  clipper: SlandingClipper(),
                  child: Container(
                    height: size.height * 0.4,
                    color: Colors.amber,
                  ),
                ),
              ),
              Image(
                width: size.width,
                height: size.height * 0.6,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/onboard2.png'),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.05,
            child: Container(
              width: size.width,
              padding: EdgeInsets.all(appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PURCHASE',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy \ntext of the printing and typesetting industry.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue, width: 2),
                      shape: BoxShape.circle,
                      color: AppColors.white),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue, width: 2),
                      shape: BoxShape.circle,
                      color: AppColors.appBgColor),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blue, width: 2),
                      shape: BoxShape.circle,
                      color: AppColors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: appPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () => print('Skip'),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: appPadding,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: appPadding),
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.navigate_next_rounded,
                      color: AppColors.blue,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
