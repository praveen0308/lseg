import 'package:bloc/bloc.dart';
import 'package:lseg/local/local.dart';
import 'package:meta/meta.dart';

part 'registration_screen_state.dart';

class RegistrationScreenCubit extends Cubit<RegistrationScreenState> {
  final AppStorage _appStorage;
  RegistrationScreenCubit(this._appStorage) : super(RegistrationScreenInitial());

  int activeStep = 0;
  bool showNext=true;
  bool showBack=false;
  bool showSubmit=false;

  Future<void> submitWelcomeData() async{
    emit(SubmittingWelcomeData());
    await Future.delayed(const Duration(seconds: 2));
    showNext = false;
    showBack = true;
    showSubmit = true;
    activeStep=1;
    emit(RegistrationFirstStepDone());
  }
  Future<void> backNavigate() async{

    showNext = true;
    showBack = false;
    showSubmit = false;
    activeStep=0;
    emit(RegistrationScreenInitial());
  }

  Future<void> submitFinalData() async{
    emit(SubmittingFinalStepData());
    await Future.delayed(const Duration(seconds: 2));
    showNext = false;
    showBack = true;
    showSubmit = true;
    _appStorage.updateRegistrationState(true);
    emit(RegistrationFinalStepDone());
  }

}
