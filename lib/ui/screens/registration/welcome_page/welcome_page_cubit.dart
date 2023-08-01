import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'welcome_page_state.dart';

class WelcomePageCubit extends Cubit<WelcomePageState> {
  WelcomePageCubit() : super(WelcomePageInitial());
}
