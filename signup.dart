import 'package:flutter/material.dart';
import 'package:todo_app/UI/home/home.dart';
import 'package:todo_app/notes.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstnameController,
              decoration: InputDecoration(labelText: 'firstname'),
            ),
            TextField(
              controller: lastnameController,
              decoration: InputDecoration(labelText: 'lastname'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Insert the user data into the database
                await DatabaseHelper.instance.insertUser(
                  firstnameController.text,
                  lastnameController.text,
                  _emailController.text,
                  _passwordController.text,
                );

                // Navigate to HomeScreen
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => HomeScreen123()));
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
