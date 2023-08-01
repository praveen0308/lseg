import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'content_details_screen_state.dart';

class ContentDetailsScreenCubit extends Cubit<ContentDetailsScreenState> {
  ContentDetailsScreenCubit() : super(ContentDetailsScreenInitial());
}
