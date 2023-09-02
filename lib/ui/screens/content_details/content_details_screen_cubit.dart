import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'content_details_screen_state.dart';

class ContentDetailsScreenCubit extends Cubit<ContentDetailsScreenState> with BaseCubit{
  final UserRepositoryImpl _userRepositoryImpl;
  final ContentRepositoryImpl _contentRepositoryImpl;
  ContentDetailsScreenCubit(this._userRepositoryImpl,this._contentRepositoryImpl) : super(ContentDetailsScreenInitial());

  Future<void> addIntoFavourite(ContentModel contentModel) async {
    emit(UpdatingFavourite());
    try{
      await _userRepositoryImpl.addIntoFavourites(contentModel.contentId!);
      emit(AddedIntoFavourites());
    }catch(e){
      logger.e(e);
      emit(UpdateFavouriteFailed("Unable to add into favourites!"));
    }
  }

  Future<void> updateContentViewCount(String contentId) async {
    emit(UpdatingViewCount());
    try{
      await _contentRepositoryImpl.updateViewCount(contentId);
      emit(ViewCountUpdated());

    }catch(e){
      logger.e(e);
      emit(UpdateViewCountFailed("Oops! something went wrong!!!"));
    }
  }

  Future<void> removeFromFavourite(ContentModel contentModel) async {
    emit(UpdatingFavourite());
    try{
      await _userRepositoryImpl.removeFromFavourites(contentModel.contentId!);
      emit(RemovedFromFavourites());
    }catch(e){
      logger.e(e);
      emit(UpdateFavouriteFailed("Unable to remove from favourites!"));
    }
  }

  Future<void> updateContentReview(String contentId,ReviewModel review) async {
    emit(UpdatingContentReview());
    try{
      await _contentRepositoryImpl.updateContentReview( contentId,review);
      emit(ContentReviewUpdated());
    }catch(e){
      logger.e(e);
      emit(UpdateContentReviewFailed("Unable to update content review!!!"));
    }
  }
  Future<void> fetchRecommendedContents(String categoryId) async {
    emit(LoadingRecommendedContent());
    try{
      var result = await _contentRepositoryImpl.getRecommendedContentOfCategory(categoryId,limit: 5);
      if(result.isNotEmpty){
        emit(ReceivedRecommendContent("Recommended Contents", result));
      }else{
        emit(NoRecommendedContentFound());
      }

    }catch(e){
      logger.e(e);
      emit(LoadRecommendedContentFailed("Recommended contents not found!!!"));
    }
  }

}
