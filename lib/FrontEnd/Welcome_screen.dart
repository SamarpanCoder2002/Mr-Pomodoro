import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hello_promodoro/FrontEnd/Log_in.dart';
import 'package:page_transition/page_transition.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.leaderboard),
            title: Text(
              "Welcome to my App",
              style: TextStyle(fontSize: 28.0),
            )),
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            children: [
              assetInsert("welcome"),
              assetInsert("clock"),
              Container(
                child: GestureDetector(
                  child: Image.asset(
                    'images/right_arrow.gif',
                    height: 180,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Container(
                            child: AnimatedSplashScreen(
                              splash: Image.asset(
                                'images/Intro.png',
                              ),
                              nextScreen: AccountManagerLogIn(),
                              splashTransition: SplashTransition.rotationTransition,
                              duration: 1000,
                              animationDuration: Duration(milliseconds: 500),
                              pageTransitionType: PageTransitionType.leftToRightWithFade,
                            ),
                          );
                        }));
                  },
                ),
              )
            ],
          ),
        ));
  }

  // Welcome GIF
  Widget assetInsert(String indicator) {
    String takePath = "";
    indicator == "welcome"
        ? takePath = 'images/PromoDoro.gif'
        : takePath = 'images/pomotroid.jpg';
    AssetImage assetImage = AssetImage(
      takePath,
    );
    Image image = Image(
      image: assetImage,
    );
    return Container(
      padding: EdgeInsets.only(
        bottom: 5.0,
      ),
      child: image,
    );
  }
}
