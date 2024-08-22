/* import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc.dart';
import 'package:todo_app/model.dart';
import 'package:todo_app/new/bloc.dart';
import 'package:todo_app/new/model.dart';
import 'package:todo_app/new/state.dart';
import 'package:todo_app/state.dart';

import 'event.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  final newTodo = UserModel(
                    username: _titleController.text,
                    password: _descriptionController.text,
                  );
                  log(newTodo.id.toString());
                  log(newTodo.username);
                  log(newTodo.password);

                  context.read<UserBloc>().add(AddUser(newTodo));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill in all fields')),
                  );
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            final todos = state.todos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Column(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(todo.username),
                          Text(todo.password),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          } else {
            return Center(child: Text('No todos yet'));
          }
        },
      ),
    );
  }
}
 */