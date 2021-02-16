import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Functionality();
  }
}

class Functionality extends State<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.exit_to_app_rounded,
              color: Colors.amberAccent,
              size: 30.0,
            ),
          )
        ],
        title: Text(
          "Makes Yourself Dedicated",
          style: TextStyle(fontFamily: 'Lora', fontSize: 22.0),
        ),
      ),
      drawer: makeDrawer(),
      body: mainBody(),
    );
  }

  Widget makeDrawer() {
    return Drawer(
        elevation: 20.0,
        child: ListView(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              width: 100.0,
              height: 100.0,
              child: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      radius: 40.0,
                      child: Image.asset('images/right_arrow.gif',
                          fit: BoxFit.fill),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Samarpan Dasgupta",
                    style: TextStyle(fontSize: 27.0, fontFamily: 'Lora'),
                  )),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10.0),
              elevation: 14.0,
              shadowColor: Colors.lightGreenAccent,
              child: ListTile(
                hoverColor: Colors.green,
                leading: Icon(
                  Icons.dashboard,
                  color: Colors.green,
                ),
                title: Text(
                  "Dashboard",
                  style: TextStyle(
                      fontSize: 25.0, fontFamily: 'Lora', color: Colors.red),
                ),
                onTap: () {},
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10.0),
              elevation: 14.0,
              shadowColor: Colors.lightGreenAccent,
              child: ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.green,
                ),
                title: Text(
                  "Account",
                  style: TextStyle(
                      fontSize: 25.0, fontFamily: 'Lora', color: Colors.red),
                ),
                onTap: () {},
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10.0),
              elevation: 14.0,
              shadowColor: Colors.lightGreenAccent,
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.green,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 25.0, fontFamily: 'Lora', color: Colors.red),
                ),
                onTap: () {},
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10.0),
              elevation: 14.0,
              shadowColor: Colors.lightGreenAccent,
              child: ListTile(
                leading: Icon(
                  Icons.account_box_outlined,
                  color: Colors.green,
                ),
                title: Text(
                  "About",
                  style: TextStyle(
                      fontSize: 25.0, fontFamily: 'Lora', color: Colors.red),
                ),
                onTap: () {},
              ),
            ),
          ],
        ));
  }

  Widget mainBody() {
    return ListView(
      children: [
        differentPromoDoro(1),
        differentPromoDoro(2),
        differentPromoDoro(3),
        differentPromoDoro(4),
        achievement(),
        normalDashboardMake(),
      ],
    );
  }

  Widget differentPromoDoro([int num = 1]) {
    String timeManagement = "";
    if (num == 1)
      timeManagement = "15min: Working, 3min: Break";
    else if (num == 2)
      timeManagement = "25min: Working, 5min: Break";
    else if (num == 3)
      timeManagement = "45min: Working, 15min: Break";
    else
      timeManagement = "90min: Working, 30min: Break";
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.indigoAccent,
      elevation: 18.0,
      margin: EdgeInsets.only(
        bottom: 10.0,
        left: 7.0,
        right: 7.0,
        top: 7.0,
      ),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 8.0,
          right: 8.0,
        ),
        child: ListTile(
          leading: Icon(
            Icons.work_outline_rounded,
            color: Colors.amber,
            size: 40.0,
          ),
          trailing: GestureDetector(
            onTap: () {
              debugPrint("PromoDoro $num About Section");
            },
            child: Icon(
              Icons.info_outline_rounded,
              color: Colors.pink,
              size: 25.0,
            ),
          ),
          title: Text(
            "PromoDoro $num",
            style: TextStyle(
              fontSize: 23.0,
              fontFamily: 'Lora',
              fontWeight: FontWeight.w700,
              color: Colors.brown[800],
            ),
          ),
          subtitle: Text(
            timeManagement,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Lora',
              color: Colors.yellow,
            ),
          ),
          onTap: () {
            debugPrint("PromoDoro $num clicked");
          },
        ),
      ),
    );
  }

  Widget achievement() {
    return Row(
      children: <Widget>[
        achivementStore("point"),
        achivementStore("level"),
      ],
    );
  }

  Widget achivementStore([String using]) {
    Icon iconStore;
    String workingStore;
    double sizeFont;
    var paddingStore;
    if (using == "point") {
      iconStore = Icon(Icons.control_point_duplicate_outlined);
      workingStore = "Points Earned";
      sizeFont = 20.0;
      paddingStore = EdgeInsets.only(
        top: 3.0,
        bottom: 3.0,
      );
    } else {
      iconStore = Icon(Icons.trending_up_outlined);
      workingStore = "Level Achieved";
      sizeFont = 16.0;
      paddingStore = EdgeInsets.only(
        top: 7.0,
        bottom: 7.0,
      );
    }
    return Expanded(
        child: Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        top: 25.0,
        left: 10.0,
        right: 10.0,
      ),
      child: RaisedButton(
        padding: paddingStore,
        color: Colors.lightBlueAccent,
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.blueAccent, width: 2.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: iconStore,
            ),
            Expanded(
                child: Text(
              workingStore,
              style: TextStyle(
                  fontSize: sizeFont,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500),
            )),
          ],
        ),
        onPressed: () {
          debugPrint("Points Checking");
        },
      ),
    ));
  }

  Widget normalDashboardMake() {
    return Center(
      child: Container(
        width: 180.0,
        margin: EdgeInsets.only(
          top: 35.0,
        ),
        child: RaisedButton(
          padding: EdgeInsets.all(2.0),
          color: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              width: 2.0,
              color: Colors.blue,
            ),
          ),
          child: ListTile(
            leading: Icon(Icons.dashboard),
            title: Text(
              "Dashboard",
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500),
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
