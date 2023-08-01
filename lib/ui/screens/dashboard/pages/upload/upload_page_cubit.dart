import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_page_state.dart';

class UploadPageCubit extends Cubit<UploadPageState> {
  UploadPageCubit() : super(UploadPageInitial());
}
