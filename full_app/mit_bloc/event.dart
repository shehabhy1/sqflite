import 'package:todo_app/model.dart';

abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final Todo todo;

  AddTodo(this.todo);
}

class FilterTodosByDate extends TodoEvent {
  final DateTime date;

  FilterTodosByDate(this.date);
}

class UpdateTodo extends TodoEvent {
  final Todo todo;

  UpdateTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final int id;

  DeleteTodo(this.id);
}
