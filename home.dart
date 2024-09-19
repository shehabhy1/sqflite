import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/notes.dart';

class HomeScreen123 extends StatefulWidget {
  const HomeScreen123({Key? key}) : super(key: key);

  @override
  _HomeScreen123State createState() => _HomeScreen123State();
}

class _HomeScreen123State extends State<HomeScreen123> {
  String firstname = '';
  String lastname = '';
  String password = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // Fetch the user data from the database
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> result = await db.query('usertable');
    if (result.isNotEmpty) {
      setState(() {
        firstname = result[0]['firstname'];
        lastname = result[0]['lastname'];
        password = result[0]['password'];
        email = result[0]['email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('your password: $password'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text('firstname is: $firstname'),
            Text('lastname is: $lastname'),
            Text('password is: $password'),
            Text('email is: $email'),
          ],
        ));
  }
}
