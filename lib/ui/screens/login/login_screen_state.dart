part of 'login_screen_cubit.dart';

@immutable
abstract class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}
class LoggingIn extends LoginScreenState {}
class LoginSuccessful extends LoginScreenState {}
class LoginFailed extends LoginScreenState {
  final String msg;

  LoginFailed(this.msg);
}

class CheckingUserExists extends LoginScreenState {}

class UserExists extends LoginScreenState {}

class UserDoesNotExists extends LoginScreenState {}
class Error extends LoginScreenState {
  final String msg;

  Error(this.msg);
}
