import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/local/local.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'registration_screen_state.dart';

class RegistrationScreenCubit extends Cubit<RegistrationScreenState>
    with BaseCubit {
  final AuthRepositoryImpl _authRepositoryImpl;

  RegistrationScreenCubit(this._authRepositoryImpl)
      : super(RegistrationScreenInitial());

  int activeStep = 0;
  bool showNext = true;
  bool showBack = false;
  bool showSubmit = false;
  UserModel? user;

  Future<void> initRegistration() async {
    var userId = await _authRepositoryImpl.appStorage.getUserID();
    var userData = await _authRepositoryImpl.appStorage.getUserData();
    user = UserModel(userId: userId,email: userData.email,phone: userData.phone,name: userData.name,profileUrl:userData.profileUrl);
  }

  Future<void> submitWelcomeData(
      {
        String? profileImage,
        String? localImage,
      required String userName,
      required String name,
      required DateTime dob,
      required String gender}) async {
    emit(SubmittingWelcomeData());
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
      emit(RegistrationFirstStepDone());
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  void validateWelcomePage() => emit(ValidateWelcomePage());

  void validateFinalStepPage() => emit(ValidateFinalStepPage());

  Future<void> backNavigate() async {
    showNext = true;
    showBack = false;
    showSubmit = false;
    activeStep = 0;
    emit(RegistrationScreenInitial());
  }

  Future<void> submitFinalData(
      {required String bio,
      required String occupation,
      String? school,
      String? course,
      String? paymentDetails}) async {
    emit(SubmittingFinalStepData());
    try{
      user?.bio = bio;
      user?.occupation = occupation;
      user?.school = school;
      user?.course = course;
      user?.paymentDetails = paymentDetails;

      var result = await _authRepositoryImpl.registerUser(user!);
      if(result!=null){
        emit(RegistrationFinalStepDone());
      }
    } on Exception catch(e){
      logger.e(e);
      emit(RegistrationFailed("Something went wrong!!!"));
    }

  }
}
