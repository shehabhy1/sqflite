import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/dbhelper.dart';
import 'package:todo_app/event.dart';
import 'package:todo_app/state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final DatabaseHelper db;

  TodoBloc(this.db) : super(TodoInitial()) {
    on<LoadTodos>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await db.readAllTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });

    on<AddTodo>((event, emit) async {
      await db.create(event.todo);
      add(LoadTodos());
    });

    on<UpdateTodo>((event, emit) async {
      await db.update(event.todo);
      add(LoadTodos());
    });
    on<FilterTodosByDate>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await db.readAllTodos();
        final filteredTodos = todos.where((todo) {
          return todo.date.year == event.date.year &&
              todo.date.month == event.date.month &&
              todo.date.day == event.date.day;
        }).toList();
        if (filteredTodos.isEmpty) {
          emit(TodoError("No tasks available"));
        } else {
          emit(TodoFilteredByDate(filteredTodos));
        }
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
    on<DeleteTodo>((event, emit) async {
      await db.delete(event.id);
      add(LoadTodos());
    });
  }
}
