import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  // Database Columns
  String _colName = "name";
  String _colPwd = "password";
  String _colPoints = "points";
  String _colLevels = "levels";

  // Application variables
  static String tableName = 'storeInformation';

  // Create Singleton Objects(Only Created once in the whole application)
  static DatabaseHelper _databaseHelper;
  static Database _database;

  // Instantiate the obj
  DatabaseHelper._createInstance();

  // For access Singleton object
  factory DatabaseHelper() {
    if (_databaseHelper == null)
      _databaseHelper = DatabaseHelper._createInstance();
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) _database = await initializeDatabase();
    return _database;
  }

  // For make a database
  Future<Database> initializeDatabase() async {
    // Get the directory path to store the database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'storeData.db';
    print("PAth is: $path");

    // create the database
    var getDatabase =
        await openDatabase(path, version: 1, onCreate: _createTable);
    return getDatabase;
  }

  // For make a table
  void _createTable(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $tableName($_colName TEXT, $_colPwd TEXT, $_colPoints INTEGER, $_colLevels INTEGER)');
  }

  // Insert Data to the Table
  Future<int> insertData(String _name, String _pwd) async {
    Database db = await this.database;
    var map = Map<String, dynamic>();
    map[_colName] = _name;
    map[_colPwd] = _pwd;
    map[_colPoints] = 0;
    map[_colLevels] = 0;
    print("In Insert Data");
    var result = await db.insert(tableName, map);
    return result;
  }

  // Data Fetching to validate
  Future<List<Map<String, dynamic>>> inputDataCheckingWithNameAndPassword(String _name, String _pwd) async {
    Database db = await this.database;

    var result =
        await db.rawQuery("SELECT $_colName, $_colPwd FROM $tableName WHERE $_colName = '$_name' AND $_colPwd = '$_pwd'");
    print(result);
    return result;
  }

  // User Name fetch to validate
  Future<List<Map<String, dynamic>>> userNameChecking(String _name) async {
    Database db = await this.database;

    var result =
    await db.rawQuery("SELECT $_colName FROM $tableName WHERE $_colName = '$_name'");
    print(result);
    return result;
  }


  // Data Fetching to validate
  Future<List<Map<String, dynamic>>> allDataChecking() async {
    Database db = await this.database;

    var result =
    await db.rawQuery("SELECT * FROM $tableName");
    print(result);
    return result;
  }

  // Update Points of a Particular User
  void updatePoints(String _userName, int _newPoints) async{
    Database db = await this.database;
    var result = await db.rawQuery("UPDATE $tableName SET $_colPoints = $_newPoints WHERE $_colName = '$_userName'");
  }


  // Delete All the record for the database
  void deleteData() async {
    Database db = await this.database;

    var result =
    await db.rawQuery("DELETE FROM $tableName");
    print(result);
  }

  // Get Points of a particular user
  Future<List<Map<String, dynamic>>> getPoints(String _userName) async{
    Database db = await this.database;
    var result = await db.rawQuery("SELECT $_colPoints FROM $tableName WHERE $_colName = '$_userName'");
    print("Get points database result: $result");
    return result;
  }

}
