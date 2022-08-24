import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {


  late AnimationController _animationController;
  late Animation<Offset> _animation;




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splash Screen"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text("This Splash Screen",
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            ElevatedButton(onPressed: () {
              Get.toNamed("/LoginPage");
            }, child: Text("Go to Login Page",
              style:  TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),

            ),
          ],
        ),
      ),


    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}