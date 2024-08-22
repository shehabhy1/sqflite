/* import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/dbhelper.dart';
import 'package:todo_app/event.dart';
import 'package:todo_app/new/event.dart';
import 'package:todo_app/new/state.dart';
import 'package:todo_app/state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final DatabaseHelper db;

  UserBloc(this.db) : super(UserInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await db.readAllusers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<AddUser>((event, emit) async {
      await db.createUser(event.usermodel);
      add(LoadUsers());
    });

    on<UpdateUser>((event, emit) async {
      await db.updateUser(event.usermodel);
      add(LoadUsers());
    });
  }
}
 */