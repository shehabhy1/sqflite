import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/full_app/todo/dbhelper.dart';
import 'package:todo_app/full_app/user/event.dart';
import 'package:todo_app/full_app/user/state.dart';

// BLoC
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<SaveUser>((event, emit) async {
      try {
        // Assuming we always update the first row
        final user = await DatabaseHelper.instance.queryUser();
        if (user == null) {
          // If no user exists, insert the new user
          print('Inserting new user');
          await DatabaseHelper.instance.insert(event.user);
        } else {
          // If user exists, update the user
          print('Updating existing user');
          await DatabaseHelper.instance.updateUser(event.user);
        }

        // Load the updated user
        final updatedUser = await DatabaseHelper.instance.queryUser();
        if (updatedUser != null) {
          print(
              'User saved successfully: ${updatedUser.username}, ${updatedUser.password}');
          emit(UserLoaded(updatedUser));
        } else {
          print('Failed to retrieve updated user.');
          emit(UserError());
        }
      } catch (e) {
        print('Error during SaveUser event: $e');
        emit(UserError());
      }
    });

    on<LoadUser>((event, emit) async {
      try {
        final user = await DatabaseHelper.instance.queryUser();
        if (user != null) {
          emit(UserLoaded(user));
        } else {
          emit(UserError());
        }
      } catch (_) {
        emit(UserError());
      }
    });
  }
}
