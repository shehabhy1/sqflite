// Events
import 'package:todo_app/full_app/user/model.dart';

abstract class UserEvent {}

class SaveUser extends UserEvent {
  final User user;
  SaveUser(this.user);
}

class LoadUser extends UserEvent {}
