import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'content_viewer_screen_state.dart';

class ContentViewerScreenCubit extends Cubit<ContentViewerScreenState> {
  ContentViewerScreenCubit() : super(ContentViewerScreenInitial());
}
