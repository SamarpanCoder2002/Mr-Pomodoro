import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hello_promodoro/FrontEnd/Log_in.dart';
import 'package:hello_promodoro/services/device-specific-operations.dart';
import 'package:page_transition/page_transition.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    makeCleanView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                assetInsert(context, "welcome", Alignment.topCenter),
                assetInsert(context, "clock", Alignment.center),
                insertButton(context, Alignment.bottomCenter),
              ],
            ),
          ),
        ));
  }

  Widget insertButton(BuildContext context, Alignment _position) {
    return Container(
      alignment: _position,
      child: GestureDetector(
        child: Image.asset(
          'assets/images/right_arrow.gif',
          width: MediaQuery.of(context).size.width * (1 / 1.5),
          height: MediaQuery.of(context).size.height * (1 / 3),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Container(
              child: AnimatedSplashScreen(
                splash: Image.asset(
                  'assets/images/Intro.png',
                ),
                nextScreen: AccountManagerLogIn(),
                splashTransition: SplashTransition.rotationTransition,
                duration: 200,
                animationDuration: Duration(milliseconds: 300),
                pageTransitionType: PageTransitionType.leftToRightWithFade,
              ),
            );
          }));
        },
      ),
    );
  }

  Widget assetInsert(
      BuildContext context, String indicator, Alignment _position) {
    String takePath = "";
    indicator == "welcome"
        ? takePath = 'assets/images/PromoDoro.gif'
        : takePath = 'assets/images/pomotroid.jpg';
    AssetImage assetImage = AssetImage(
      takePath,
    );
    Image image = Image(
      image: assetImage,
      width: MediaQuery.of(context).size.width,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: _position,
      padding: EdgeInsets.only(
        bottom: 5.0,
      ),
      child: image,
    );
  }
}
