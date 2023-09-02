import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'edit_profile_screen_state.dart';

class EditProfileScreenCubit extends Cubit<EditProfileScreenState>
    with BaseCubit {
  final AuthRepositoryImpl _authRepositoryImpl;
  final UserRepositoryImpl _userRepositoryImpl;

  EditProfileScreenCubit(this._authRepositoryImpl, this._userRepositoryImpl)
      : super(LoadingProfile()) {
    initEditProfileData();
  }

  late UserModel user;

  Future<void> initEditProfileData() async {
    try {
      var userData = await _userRepositoryImpl.fetchUserData();
      user = userData!;
      emit(ProfileLoaded(
          data: user, activePage: 0, status: SubmissionStatus.idle));
    } catch (e) {
      logger.e(e);
      emit(NoUserData());
    }
  }

  void fetchProfileCache(int srcPage) {}

  void navigateToPage(int index) {
    var previousState = state as ProfileLoaded;
    var newState = previousState.copyWith(
        activePage: index, status: SubmissionStatus.idle);

    emit(newState);
  }

  void validatePersonalInfo(
      {String? profileImage,
      String? localImage,
      required String userName,
      required String name,
      required DateTime dob,
      required String gender}) {
    var previousState = state as ProfileLoaded;
    var newState = previousState.copyWith(
        data: previousState.data.copyWith(
            profileUrl: profileImage,
            localProfile: localImage,
            userName: userName,
            name: name,
            dob: dob,
            gender: gender),
        activePage: 1);

    emit(newState);
  }

  void validateOtherInfo(
      {required String bio,
      required String occupation,
      String? school,
      String? course,
      String? paymentDetails}) {
    var previousState = state as ProfileLoaded;
    var newState = previousState.copyWith(
        data: previousState.data.copyWith(
          bio: bio,
          occupation: occupation,
          school: school,
          course: course,
          paymentDetails: paymentDetails,
        ),
        activePage: 2);

    emit(newState);
  }

  Future<void> submitContactInfo(
      {String? phoneNumber, String? website, String? country}) async {
    var previousState = state as ProfileLoaded;
    var newState = previousState.copyWith(
        data: previousState.data.copyWith(
          phone: phoneNumber,
          website: website,
          country: country
        ),
      status: SubmissionStatus.inProgress
    );
    emit(newState);
    try {

      await _userRepositoryImpl.updateUserProfile(newState.data);

      emit(previousState.copyWith(status: SubmissionStatus.success));

    } on Exception catch (e) {
      logger.e(e);
      emit(previousState.copyWith(status: SubmissionStatus.error));
    }
  }
}
