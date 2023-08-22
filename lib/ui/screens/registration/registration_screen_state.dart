part of 'registration_screen_cubit.dart';

@immutable
abstract class RegistrationScreenState {}

class ValidateWelcomePage extends RegistrationScreenState {}
class ValidateFinalStepPage extends RegistrationScreenState {}

class RegistrationScreenInitial extends RegistrationScreenState {}

class SubmittingWelcomeData extends RegistrationScreenState {}

class RegistrationFirstStepDone extends RegistrationScreenState {}

class SubmittingFinalStepData extends RegistrationScreenState {}

class RegistrationFinalStepDone extends RegistrationScreenState {}
class RegistrationFailed extends RegistrationScreenState {
  final String msg;

  RegistrationFailed(this.msg);
}
