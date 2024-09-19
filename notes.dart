import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  /* 
  first name 
  last name
  email
  password 
  */
  DatabaseHelper._privateConstructor(); // named constructor
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  // instance carry the class

  static Database? _database;
  // database carries the sqflite package

  Future<Database> get database async {
    if (_database != null) return _database!;
    // if database instance initialized then return it
    // database will carry the initdb method
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usertable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstname TEXT NOT NULL,
        lastname TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(
      String firstname, String lastname, String email, String password) async {
    Database db = await instance.database;
    return await db.insert(
      'usertable',
      {
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'password': password,
      },
    );
  }

  Future<Map<String, dynamic>?> getUser() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results = await db.query('usertable');
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }
}
