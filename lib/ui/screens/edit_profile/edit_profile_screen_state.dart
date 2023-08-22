part of 'edit_profile_screen_cubit.dart';

@immutable
abstract class EditProfileScreenState {}

class EditProfileScreenInitial extends EditProfileScreenState {}
class ReceivedProfileCache extends EditProfileScreenState {
  final UserModel user;

  ReceivedProfileCache(this.user);
}

class ValidatePersonalInfo extends EditProfileScreenState {}
class SubmittingPersonalInfo extends EditProfileScreenState {}
class PersonalInfoSubmitted extends EditProfileScreenState {}

class ValidateOtherInfo extends EditProfileScreenState {}
class SubmittingOtherInfo extends EditProfileScreenState {}
class OtherInfoSubmitted extends EditProfileScreenState {}

class ValidateContactInfo extends EditProfileScreenState {}
class SubmittingContactInfo extends EditProfileScreenState {}
class ContactInfoSubmitted extends EditProfileScreenState {}

class EditProfileDone extends EditProfileScreenState {}
class EditProfileFailed extends EditProfileScreenState {
  final String msg;

  EditProfileFailed(this.msg);

}

