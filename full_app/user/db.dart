/* import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/gpt/model.dart';

/* 
define [dbname - dbversion - columnid- username and password] as sta con
then define a private constructor of the class 
then define an instance of the class static fin which is carrying the constructor
define the db 
make a method of return type future and the type of database and use
get keyword to access private cons
use if and check if the db is not null then return it if null make the db 
carry the initial function of db and await it 
then return the db 
in the initial db func the return type will be future of database
assign a string to carry the path will use join and then await the 
getdbpath method from sqflite and insert the dbname
return the await opendb and pass the [path - version - oncreate]
oncreate future of type void has two params db and version 
await the db var and then use execute method to create the table 
insert the table name first and then open () to insert in them the columns   
 */
class DatabaseHelper123 {
  // they were final
  static const _databaseName = "user_databasease.db";
  static const _databaseVersion = 1;

  static const table = 'useras';

  static const columnId = 'id';
  static const columnUsername = 'username';
  static const columnPassword = 'password';

  DatabaseHelper123._privateConstructor();
  static final DatabaseHelper123 instance =
      DatabaseHelper123._privateConstructor();
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

/* 
make insert fun future of type int and put the model as a param
define new db  will await the object from the dbhelper db function
then returrn and await the db instance and use insert method and then 
give it it's params 
*/
  Future<int> insert(User user) async {
    Database db = await instance.database;
    return await db.insert(table, user.toMap());
  }

/* 
update also future of int + model as a parameter 
make an instance of db and carry the object from dbhelper then db
return and await the db instance and use update method and 
give it the params 
where: '$columnId = ?',
      whereArgs: [user.id],
 */
  Future<int> update(User user) async {
    Database db = await instance.database;
    return await db.update(
      table,
      user.toMap(),
      where: '$columnId = ?',
      whereArgs: [user.id],
    );
  }

/* 
future of user + make db instance and carry the object of the dbhelper then db 
assign a var but it's type list of map of string , dynamic and await the 
db instance then query method and pass the param
then make if condition if the var is not empty return the frommap func
and pass the var then first method else return null 
*/
 
  /* Future<User?> queryUser() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results = await db.query(table);
    if (results.isNotEmpty) {
      return User.fromMap(results.first);
    }
    return null;
  }

  Future<int> update(User user) async {
    Database db = await instance.database;
    return await db.update(
      table,
      user.toMap(),
      where: '$columnId = ?',
      whereArgs: [
        columnId
      ], // Assuming you have an 'id' property in your User model.
    );
  } */
}
 */