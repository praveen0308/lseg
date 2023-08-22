import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/local/local.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> with BaseCubit{
  final AuthRepositoryImpl _authRepositoryImpl;
  LoginScreenCubit(this._authRepositoryImpl) : super(LoginScreenInitial());

  Future<void> login() async{
    emit(LoggingIn());
    try{
      var result = await _authRepositoryImpl.loginUser();

      if(result!=null){
        emit(LoginSuccessful());
        checkUserExists(result);
      }else{
        emit(LoginFailed("Unable to login. Please try again!!!"));
      }

    }on Exception catch(e){
      logger.e(e);
      emit(LoginFailed("Something went wrong!!!"));
    }

  }

  Future<void> checkUserExists(String uid) async {
    emit(CheckingUserExists());
    try {
      var userModel = await _authRepositoryImpl.userExists(uid);
      if(userModel==null){
        emit(UserDoesNotExists());
      }else{
        emit(UserExists());
      }
    } on Exception catch (e) {
      logger.e(e);
      emit(Error("Something went wrong!!!"));
    }
  }
}
