import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_profile_screen_state.dart';

class EditProfileScreenCubit extends Cubit<EditProfileScreenState> {
  EditProfileScreenCubit() : super(EditProfileScreenInitial());
}
