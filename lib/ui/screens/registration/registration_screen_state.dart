part of 'registration_screen_cubit.dart';

@immutable
abstract class RegistrationScreenState {}

class RegistrationScreenInitial extends RegistrationScreenState {}

class SubmittingWelcomeData extends RegistrationScreenState {}

class RegistrationFirstStepDone extends RegistrationScreenState {}

class SubmittingFinalStepData extends RegistrationScreenState {}

class RegistrationFinalStepDone extends RegistrationScreenState {}
