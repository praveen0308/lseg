part of 'splash_screen_cubit.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class ErrorOccurred extends SplashScreenState {
  final String msg;

  ErrorOccurred(this.msg);
}

class CheckingUserLoggedIn extends SplashScreenState {}

class UserAlreadyLoggedIn extends SplashScreenState {}

class UserNotLoggedIn extends SplashScreenState {}

