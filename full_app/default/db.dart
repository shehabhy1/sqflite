/* import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/dbhelper.dart';

class DatabaseHelper {
  static final _databaseName = "user_database.db";
  static final _databaseVersion = 1;

  static final table = 'user';

  static final columnId = '_id';
  static final columnUsername = 'username';
  static final columnPassword = 'password';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnUsername TEXT NOT NULL,
        $columnPassword TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(String username, String password) async {
    Database db = await instance.database;
    return await db.insert(table, {'username': username, 'password': password});
  }

  Future<Map<String, dynamic>?> getUser() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results = await db.query(table);
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<int> updateUser(String username, String password) async {
    Database db = await instance.database;
    return await db.update(table, {'username': username, 'password': password},
        where: '$columnId = ?', whereArgs: [1]);
  }
}
 */