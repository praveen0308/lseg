import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'final_step_page_state.dart';

class FinalStepPageCubit extends Cubit<FinalStepPageState> {
  FinalStepPageCubit() : super(FinalStepPageInitial());
}
