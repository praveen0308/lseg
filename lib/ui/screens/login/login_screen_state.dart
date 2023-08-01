part of 'login_screen_cubit.dart';

@immutable
abstract class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}
class LoggingIn extends LoginScreenState {}
class LoginSuccessful extends LoginScreenState {}
