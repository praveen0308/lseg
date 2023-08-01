import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_result_screen_state.dart';

class SearchResultScreenCubit extends Cubit<SearchResultScreenState> {
  SearchResultScreenCubit() : super(SearchResultScreenInitial());
}
