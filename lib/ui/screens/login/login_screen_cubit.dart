import 'package:bloc/bloc.dart';
import 'package:lseg/data/repository/login_repository.dart';
import 'package:lseg/domain/repository/firebase_auth_repository_impl.dart';
import 'package:lseg/local/local.dart';
import 'package:meta/meta.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  final FirebaseLoginRepositoryImpl loginRepository;
  final AppStorage _appStorage;
  LoginScreenCubit(this.loginRepository, this._appStorage) : super(LoginScreenInitial());

  Future<void> login() async{
    emit(LoggingIn());
    await Future.delayed(const Duration(seconds: 2));
    _appStorage.updateLoginState(true);
    emit(LoginSuccessful());
  }
}
