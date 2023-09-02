part of 'edit_content_screen_cubit.dart';

@immutable
abstract class EditContentScreenState {}

class NoContentData extends EditContentScreenState {}

class LoadingContent extends EditContentScreenState {}

class ContentLoaded extends EditContentScreenState {
  final ContentModel data;
  final List<CategoryModel> categories;
  final int activePage;
  final SubmissionStatus status;
  final List<SubmissionResult>? results;
  final File? pdf;
  final File? thumbnail;

  ContentLoaded( {
    required this.data,
    required this.categories,
    required this.activePage,
    required this.status,
    this.pdf,
    this.thumbnail,
    this.results
  });

  @override
  String toString() {
    return 'ContentLoaded{ data: $data,categories: $categories, activePage: $activePage, status: $status,}';
  }

  ContentLoaded copyWith({
    ContentModel? data,
    List<CategoryModel>? categories,
    int? activePage,
    SubmissionStatus? status,
    List<SubmissionResult>? results,
    File? pdf,
    File? thumbnail,
  }) {
    return ContentLoaded(
      data: data ?? this.data,
      categories: categories ?? this.categories,
      activePage: activePage ?? this.activePage,
      status: status ?? this.status,
      results: results ?? this.results,
      pdf: pdf ?? this.pdf,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}

class SubmissionResult{
  final bool isSuccess;
  final String message;
  SubmissionResult(this.isSuccess, this.message);
}

enum SubmissionStatus {
  idle,
  inProgress,
  success,
  error,
}
