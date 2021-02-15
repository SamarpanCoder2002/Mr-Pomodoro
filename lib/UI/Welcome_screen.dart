import 'package:flutter/material.dart';
import 'package:hello_promodoro/UI/Log_in.dart';

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
                    height: 150,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountManagerLogIn()));
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
