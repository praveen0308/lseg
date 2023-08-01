import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_content_screen_state.dart';

class UploadContentScreenCubit extends Cubit<UploadContentScreenState> {
  UploadContentScreenCubit() : super(UploadContentScreenInitial());

  Future<void> uploadContent() async{
    emit(UploadingContent());
    await Future.delayed(const Duration(seconds: 2));
    emit(ContentUploadedSuccessfully());
  }
}
