part of 'profile_page_cubit.dart';

@immutable
abstract class ProfilePageState {}

class ProfilePageInitial extends ProfilePageState {}
class ProfileDataLoaded extends ProfilePageState {
  final String profileUrl;
  final String name;
  final String userName;

  ProfileDataLoaded(this.profileUrl, this.name, this.userName);
}


