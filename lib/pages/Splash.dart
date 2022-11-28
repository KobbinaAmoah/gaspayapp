import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gaspayapp/pages/login_page.dart';
import 'package:gaspayapp/pages/sign_up.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => SignUpScreen())));
    var assetsImage = new AssetImage(
        'images/logo.png'); //<- Creates an object that fetches an image.
    var image = new Image(
        image: assetsImage,
        height:300); //<- Creates a widget that displays an image.
    return MaterialApp(
      home: Scaffold(
        /* appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor:
              Colors.blue, //<- background color to combine with the picture :-)
        ),*/
        body: Container(
          decoration: new BoxDecoration(color: Colors.white),
          child: new Center(
            child: image,
          ),
        ), //<- place where the image appears
      ),
    );
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //           color: new Color(0xFF90CAF9),
    //           gradient: LinearGradient(
    //               colors: [(new Color(0xFF90CAF9)), (new Color(0xFF7986CB))],
    //               begin: Alignment.center,
    //               end: Alignment.bottomCenter
    //           ),
    //         ),
    //       ),
    //       Center(
    //         child: Container(
    //           child: Image.asset("images/logo.png"),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
