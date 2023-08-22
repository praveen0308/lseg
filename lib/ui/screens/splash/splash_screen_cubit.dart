import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> with BaseCubit {
  final AuthRepositoryImpl _authRepositoryImpl;

  SplashScreenCubit(this._authRepositoryImpl) : super(SplashScreenInitial());

  Future<void> checkUserLoggedIn() async {
    emit(CheckingUserLoggedIn());
    try {
      var userUID = await _authRepositoryImpl.userLoggedIn().first;
      if(userUID==null){
        emit(UserNotLoggedIn());
      }else{
        emit(UserAlreadyLoggedIn());

      }
    } on Exception catch (e) {
      logger.e(e);
      emit(ErrorOccurred("Something went wrong!!!"));
    }
  }

  /*Future<void> checkUserExists(String uid) async {
    emit(CheckingUserLoggedIn());
    try {
      var userModel = await _authRepositoryImpl.userExists(uid);
      if(userModel==null){
        emit(UserDoesNotExists());
      }else{
        emit(UserExists());
      }
    } on Exception catch (e) {
      logger.e(e);
      emit(ErrorOccurred("Something went wrong!!!"));
    }
  }*/
}
