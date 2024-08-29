// States
import 'package:todo_app/full_app/user/model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
}

class UserError extends UserState {}
