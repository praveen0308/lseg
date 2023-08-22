part of 'creator_profile_screen_cubit.dart';

@immutable
abstract class CreatorProfileScreenState {}

class CreatorProfileScreenInitial extends CreatorProfileScreenState {}

class LoadingCreatorProfile extends CreatorProfileScreenState {}

class ReceivedCreatorProfile extends CreatorProfileScreenState {
  final UserModel user;
  final List<ContentModel> contents;

  ReceivedCreatorProfile(this.user, this.contents);
}

class LoadProfileFailed extends CreatorProfileScreenState {
  final String msg;

  LoadProfileFailed(this.msg);
}
