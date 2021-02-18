import 'package:hello_promodoro/DatabaseController/database.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Authenticate {
  String nameIs, pwdIs;

  Authenticate(this.nameIs, this.pwdIs);

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<bool> signUp() async {
    bool takeResponse = true;
    if (takeResponse) {
      int result = await databaseHelper.insertData(this.nameIs, this.pwdIs);
      if (result != 0)
        return true;
      return false;
    }
    return false;
  }

  Future<bool> getData() async {
    List<Map<String, dynamic>> store =
        await databaseHelper.inputDataChecking(this.nameIs, this.pwdIs);
    print("Store: $store");
    if (store.isNotEmpty) {
      return true;
    }
    return false;
  }

  void deleteData() {
      databaseHelper.deleteData();
  }

  void getAllData() async {
    List<Map<String, dynamic>> store =
    await databaseHelper.allDataChecking();
    print("Store: $store");

  }
}
