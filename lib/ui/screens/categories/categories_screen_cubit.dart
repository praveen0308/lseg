import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_screen_state.dart';

class CategoriesScreenCubit extends Cubit<CategoriesScreenState> {
  CategoriesScreenCubit() : super(CategoriesScreenInitial());
}
