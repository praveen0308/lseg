import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'creator_profile_screen_state.dart';

class CreatorProfileScreenCubit extends Cubit<CreatorProfileScreenState> {
  CreatorProfileScreenCubit() : super(CreatorProfileScreenInitial());
}
