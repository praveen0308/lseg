part of 'edit_profile_screen_cubit.dart';

@immutable
abstract class EditProfileScreenState {}

class LoadingProfile extends EditProfileScreenState {}
class NoUserData extends EditProfileScreenState {}

class ProfileLoaded extends EditProfileScreenState {
  final UserModel data;
  final int activePage;
  final SubmissionStatus status;

  ProfileLoaded({
    required this.data,
    required this.activePage,
    required this.status,
  });

  @override
  String toString() {
    return 'ProfileLoaded{ data: $data, activePage: $activePage, status: $status,}';
  }

  ProfileLoaded copyWith({
    UserModel? data,
    int? activePage,
    SubmissionStatus? status,
  }) {
    return ProfileLoaded(
      data: data ?? this.data,
      activePage: activePage ?? this.activePage,
      status: status ?? this.status,
    );
  }
}

enum SubmissionStatus {
  idle,
  inProgress,
  success,
  error,
}
