import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_content_screen_state.dart';

class MyContentScreenCubit extends Cubit<MyContentScreenState> {
  MyContentScreenCubit() : super(MyContentScreenInitial());
}
