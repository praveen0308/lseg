import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:io';
part 'upload_pdf_view_state.dart';

class UploadPdfViewCubit extends Cubit<UploadPdfViewState> {
  UploadPdfViewCubit() : super(UploadPdfViewInitial());
}
