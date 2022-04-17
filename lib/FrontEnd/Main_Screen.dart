import 'package:flutter/material.dart';
import 'package:hello_promodoro/Backend/Authentication.dart';
import 'package:hello_promodoro/FrontEnd/pomodoro_clock.dart';
import 'package:hello_promodoro/FrontEnd/pointsAndLevelsShow.dart';
import 'package:hello_promodoro/FrontEnd/accountDetailsMake.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'PomoDoroAllCounterShow.dart';

class MainController extends StatefulWidget {
  String userName;
  Authenticate authenticate;

  MainController(this.userName, this.authenticate);

  @override
  State<StatefulWidget> createState() {
    return Functionality(this.userName, this.authenticate);
  }
}

class Functionality extends State<MainController> {
  String _userName;
  int userPoints = 0;
  Authenticate authenticate;

  Functionality(this._userName, this.authenticate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1dba18),
        actions: [
          GestureDetector(
            onTap: () {
              clearCache(context);
            },
            child: Container(
              margin: EdgeInsets.only(
                right: 15.0,
              ),
              child: Icon(
                Icons.cached_rounded,
                size: 25.0,
              ),
            ),
          ),
        ],
        title: Text(
          "Pomodoro List",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      drawer: makeDrawer(),
      body: mainBody(context),
    );
  }

  Widget makeDrawer() {
    return Drawer(
        elevation: 20.0,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              heading(),
              sideMenu("Account", Icons.account_circle_outlined),
              sideMenu("About", Icons.info_outline),
              sideMenu("Exit", Icons.exit_to_app_rounded),
            ],
          ),
        ));
  }

  Widget heading() {
    return Container(
      color: Color(0xff1dba18),
      width: double.infinity,
      height: 130.0,
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Expanded(
              child: Image.asset(
            'assets/images/hi.gif',
            fit: BoxFit.fill,
            width: 100.0,
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                this._userName,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sideMenu(String titleName, IconData takeIcon) {
    String command;
    if (titleName == "Dashboard") {
      command = "DashBoard Pressed";
    } else if (titleName == "Account") {
      command = "Account Pressed";
    } else if (titleName == "Exit") {
      command = "Exit Pressed";
    } else {
      command = "About Pressed";
    }
    return ListTile(
      hoverColor: Colors.deepOrange,
      leading: Icon(
        takeIcon,
        color: Colors.grey,
      ),
      title: Text(
        titleName,
        style: TextStyle(fontSize: 18.0, color: Colors.black.withOpacity(0.8)),
      ),
      onTap: () async {
        if (titleName == "Account") {
          List? takeInformation =
              await authenticate.fetchDataToPreview(this._userName);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AccountInformation(this._userName, takeInformation!)));
        } else if (titleName == "About") {
          const url =
              'https://github.com/SamarpanCoder2002/Mr-Promodoro/blob/main/About/aboutThisApp.md';
          try {
            await launch(
              url,
            );
          } catch (e) {
            print("Error in Launch Link");
          }
        } else {
          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
    );
  }

  Widget mainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          differentPromoDoro(1),
          differentPromoDoro(2),
          differentPromoDoro(3),
          differentPromoDoro(4),
          achievement(),
          const SizedBox(
            height: 20,
          ),
          normalDashboardMake(context),
        ],
      ),
    );
  }

  Widget differentPromoDoro([int num = 1]) {
    String timeManagement = "";
    double wTime, bTime;
    if (num == 1) {
      timeManagement = "15 min: Working, 3 min: Break";
      wTime = 15.0;
      bTime = 3.0;
    } else if (num == 2) {
      timeManagement = "25 min: Working, 5 min: Break";
      wTime = 25.0;
      bTime = 5.0;
    } else if (num == 3) {
      timeManagement = "45 min: Working, 15 min: Break";
      wTime = 45.0;
      bTime = 15.0;
    } else {
      timeManagement = "90 min: Working, 30 min: Break";
      wTime = 90.0;
      bTime = 30.0;
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Color(0xff1dba18),
      elevation: 10.0,
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
            Icons.timer_outlined,
            color: Colors.white,
            size: 30.0,
          ),
          title: Text(
            "Pomodoro $num",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              timeManagement,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          onTap: () async {
            int _userPoints =
                await authenticate.getPointsFromDatabase(this._userName);
            int _userLevels =
                await authenticate.getLevelsFromDatabase(this._userName);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PromoDoroClock(
                        wTime,
                        bTime,
                        _userPoints,
                        this._userName,
                        this.authenticate,
                        _userLevels,
                        num)));
          },
        ),
      ),
    );
  }

  Widget achievement() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        achivementStore("point"),
        achivementStore("level"),
      ],
    );
  }

  Widget achivementStore([String? using]) {
    Icon iconStore;
    String workingStore;
    final double sizeFont = 14;
    var paddingStore;
    if (using == "point") {
      iconStore = Icon(Icons.control_point_duplicate_outlined,
          size: 20, color: Color(0xff279e23));
      workingStore = "Points Earned";

      paddingStore = EdgeInsets.only(
        top: 3.0,
        bottom: 3.0,
      );
    } else {
      iconStore =
          Icon(Icons.trending_up_outlined, size: 20, color: Color(0xff279e23));
      workingStore = "Levels Achieved";
      paddingStore = EdgeInsets.only(
        top: 7.0,
        bottom: 7.0,
      );
    }
    return Container(
      width: 170,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        top: 25.0,
        left: 10.0,
        right: 10.0,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xff279e23)),
                borderRadius: BorderRadius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            iconStore,
            const SizedBox(
              width: 10,
            ),
            Text(
              workingStore,
              style: TextStyle(color: Color(0xff279e23), fontSize: sizeFont),
            ),
          ],
        ),
        onPressed: () async {
          if (using == "point") {
            int pointsTake =
                await this.authenticate.getPointsFromDatabase(this._userName);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PointsOrValuesShowOnScreen(pointsTake)));
          } else {
            int levelsTake =
                await this.authenticate.getLevelsFromDatabase(this._userName);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PointsOrValuesShowOnScreen(levelsTake, "Levels")));
          }
        },
      ),
    );
  }

  Widget normalDashboardMake(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 200.0,
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xff279e23)),
                  borderRadius: BorderRadius.circular(8))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.countertops_outlined,
                  size: 20.0, color: Color(0xff279e23)),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Pomodoro Counter",
                style: TextStyle(fontSize: 14.0, color: Color(0xff279e23)),
              ),
            ],
          ),
          onPressed: () async {
            List pointsTake =
                await this.authenticate.getPomoDoroCounter(this._userName);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PomoDoroSumUp(pointsTake)));
          },
        ),
      ),
    );
  }

  Future<void> clearCache(BuildContext context) async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
    Alert(
        type: AlertType.success,
        context: context,
        title: "Cache Cleared",
        style: AlertStyle(
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        )).show();
  }
}
