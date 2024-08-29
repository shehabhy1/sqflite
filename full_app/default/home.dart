/* import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/default/db.dart';

class HomeScreen123 extends StatefulWidget {
  const HomeScreen123({Key? key}) : super(key: key);

  @override
  _HomeScreen123State createState() => _HomeScreen123State();
}

class _HomeScreen123State extends State<HomeScreen123> {
  String _username = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // Fetch the user data from the database
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> result = await db.query('user');
    if (result.isNotEmpty) {
      setState(() {
        _username = result[0]['username'];
        _password = result[0]['password'];
      });
    }
  }

/*  Future<void> _loadUser() async {
    // Fetch the user data from the database
    final user = await DatabaseHelper.instance.getUser();
    if (user != null) {
      setState(() {
        username = user['username'];
      });
    }
  } */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your password: $_password'),
        centerTitle: true,
      ),
      body: Center(child: Text('Welcome, $_username')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to the Profile screen and wait for the result
          await Navigator.pushNamed(context, '/profile');
          // Refresh the Home screen when returning from the Profile screen
          _loadUserData();
        },
        child: Icon(Icons.edit),
      ),
    );
  }
} */

 /* 
// False
 import 'package:flutter/material.dart';
import 'package:todo_app/default/db.dart';

class HomeScreen123 extends StatefulWidget {
  const HomeScreen123({Key? key}) : super(key: key);

  @override
  _HomeScreen123State createState() => _HomeScreen123State();
}

class _HomeScreen123State extends State<HomeScreen123> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    // Fetch the user data from the database
    final user = await DatabaseHelper.instance.getUser();
    if (user != null) {
      setState(() {
        username = user['username'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Welcome, $username')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to the Profile screen and wait for the result
          await Navigator.pushNamed(context, '/profile');
          // Refresh the Home screen when returning from the Profile screen
          _loadUser();
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
 */