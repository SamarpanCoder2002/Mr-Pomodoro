import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  // Database Columns
  String colName = "name";
  String colPwd = "password";

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
    await db.execute('CREATE TABLE $tableName($colName TEXT, $colPwd TEXT)');
  }

  // Insert Data to the Table
  Future<int> insertData(String _name, String _pwd) async {
    Database db = await this.database;
    var map = Map<String, dynamic>();
    map[colName] = _name;
    map[colPwd] = _pwd;
    print("In Insert Data");
    var result = await db.insert(tableName, map);
    return result;
  }

  // Data Fetching to validate
  Future<List<Map<String, dynamic>>> inputDataChecking(String _name, String _pwd) async {
    Database db = await this.database;

    var result =
        await db.rawQuery("SELECT * FROM $tableName WHERE $colName = '$_name'");
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


  // Delete All the record for the database
  void deleteData() async {
    Database db = await this.database;

    var result =
    await db.rawQuery("DELETE FROM $tableName");
    print(result);

  }

}
