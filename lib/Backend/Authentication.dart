import 'package:hello_promodoro/DatabaseController/database.dart';
import 'dart:async';

class Authenticate {
  String nameIs, pwdIs;

  Authenticate(this.nameIs, this.pwdIs);

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<bool> signUp() async {
    bool takeResponse = await getData();
    if (takeResponse) {
      int result = await databaseHelper.insertData(this.nameIs, this.pwdIs);
      if (result != 0)
        return true;
      return false;
    }
    return false;
  }

  Future<bool> getData([String indicator = "SignUp"]) async {
    if(indicator == "login") {
      List<Map<String, dynamic>> store =
      await databaseHelper.inputDataCheckingWithNameAndPassword(this.nameIs, this.pwdIs);
      print("Store is: $store");
      if (store.isNotEmpty)
        return true;
      return false;
    }
    else{
      List<Map<String, dynamic>> store =
      await databaseHelper.userNameChecking(this.nameIs);
      if (store.isEmpty)
        return true;
      return false;
    }
  }

  void deleteData() {
      databaseHelper.deleteData();
  }

  void getAllData() async {
    List<Map<String, dynamic>> store =
    await databaseHelper.allDataChecking();
    print(store);
  }

  Future<int> getPointsFromDatabase(String _userName) async{
    int resultStore;
    List<Map<String, dynamic>> result = await databaseHelper.getPoints(_userName);
    result[0].forEach((key, value) {
      resultStore = value;
    });
    return resultStore;
  }

  void updatePoints(String _userName, int _newPoints) async{
    databaseHelper.updatePoints(_userName, _newPoints);
  }

  Future<int> getLevelsFromDatabase(String _userName) async{
    int resultStore;
    List<Map<String, dynamic>> result = await databaseHelper.getLevels(_userName);
    result[0].forEach((key, value) {
      resultStore = value;
    });
    return resultStore;
  }

  void updateLevels(String _userName, int _newLevels) async{
    databaseHelper.updateLevels(_userName, _newLevels);
  }

}















