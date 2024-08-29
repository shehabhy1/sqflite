/* import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/default/db.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> result = await db.query('user');
    if (result.isNotEmpty) {
      setState(() {
        _usernameController.text = result[0]['username'];
        _passwordController.text = result[0]['password'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Update the user data in the database
                Database db = await DatabaseHelper.instance.database;
                await db.update(
                  'user',
                  {
                    'username': _usernameController.text,
                    'password': _passwordController.text,
                  },
                  where: '_id = ?',
                  whereArgs: [1], // Assuming the user id is 1
                );

                // Return to the Home screen
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
} */

/* import 'package:flutter/material.dart';
import 'package:todo_app/default/db.dart'; // Import the DatabaseHelper class

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    Map<String, dynamic>? user = await DatabaseHelper.instance.getUser();
    if (user != null) {
      setState(() {
        _usernameController.text = user['username'];
        _passwordController.text = user['password'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Update the user data in the database
                await DatabaseHelper.instance.updateUser(username, password);

                // Navigate back to the previous screen
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
 */