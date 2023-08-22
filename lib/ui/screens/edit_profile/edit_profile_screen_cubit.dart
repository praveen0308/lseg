import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'edit_profile_screen_state.dart';

class EditProfileScreenCubit extends Cubit<EditProfileScreenState> with BaseCubit{
  final AuthRepositoryImpl _authRepositoryImpl;
  final UserRepositoryImpl _userRepositoryImpl;

  EditProfileScreenCubit(this._authRepositoryImpl, this._userRepositoryImpl)
      : super(EditProfileScreenInitial());
  int activeStep = 0;
  bool showNext = true;
  bool showBack = false;
  bool showSubmit = false;
  UserModel? user;

  Future<void> initEditProfileData() async {
    var userData = await _userRepositoryImpl.fetchUserData();
    user = userData ?? UserModel();
    emit(ReceivedProfileCache(user!));
  }
  void fetchProfileCache(){
    if(user!=null){
      emit(ReceivedProfileCache(user!));
    }
  }

  Future<void> submitPersonalInfo(
      {
        String? profileImage,
        String? localImage,
        required String userName,
        required String name,
        required DateTime dob,
        required String gender}) async {
    emit(SubmittingPersonalInfo());
    try {
      user?.profileUrl = profileImage;
      user?.localProfile = localImage;
      user?.userName = userName;
      user?.name = name;
      user?.dob = dob;
      user?.gender = gender;
      showNext = false;
      showBack = true;
      showSubmit = true;
      activeStep = 1;
      emit(PersonalInfoSubmitted());
    } on Exception catch (e) {
      logger.e(e);
    }
  }
  Future<void> submitOtherInfo(
      {required String bio,
        required String occupation,
        String? school,
        String? course,
        String? paymentDetails}) async {
    emit(SubmittingOtherInfo());
    try {
      user?.bio = bio;
      user?.occupation = occupation;
      user?.school = school;
      user?.course = course;
      user?.paymentDetails = paymentDetails;

      activeStep = 2;
      emit(OtherInfoSubmitted());
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  void validatePersonalInfo() => emit(ValidatePersonalInfo());

  void validateOtherInfo() => emit(ValidateOtherInfo());
  void validateContactInfo() => emit(ValidateContactInfo());

  Future<void> backNavigate() async {
    activeStep = activeStep -1;
    showNext = activeStep<2;
    showBack = activeStep>0;
    showSubmit = activeStep ==2;
  }

  Future<void> submitContactInfo(
      {        String? phoneNumber,
        String? website,
        String? country}) async {
    emit(SubmittingContactInfo());
    try{
      user?.phone = phoneNumber;
      user?.website = website;
      user?.country = country;
      var result = await _userRepositoryImpl.updateUserProfile(user!);

        emit(ContactInfoSubmitted());
        emit(EditProfileDone());

    } on Exception catch(e){
      logger.e(e);
      emit(EditProfileFailed("Something went wrong!!!"));
    }
  }
}
