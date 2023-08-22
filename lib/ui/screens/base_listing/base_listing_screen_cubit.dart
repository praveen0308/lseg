import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'base_listing_screen_state.dart';

class BaseListingScreenCubit extends Cubit<BaseListingScreenState> with BaseCubit{
  final GetCategoryListing _getCategoryListing;
  BaseListingScreenCubit(this._getCategoryListing) : super(BaseListingScreenInitial());

  Future<void> fetchListing(CategoryType type,{String? categoryId})async{
    try{
      var data = await _getCategoryListing.fetchListing(type,categoryId: categoryId);
      if(type == CategoryType.recommendedCategories){
        emit(ReceivedCategoryListing((data as RecommendedCategoriesListing).data));
      }else{
        if(type == CategoryType.trendingContent){
          emit(ReceivedContentListing((data as TrendingContentListing).data));
        }else if(type == CategoryType.recommendedContent){
          emit(ReceivedContentListing((data as RecommendedContentListing).data));
        }else if(type == CategoryType.popularContent){
          emit(ReceivedContentListing((data as PopularContentListing).data));
        }else if(type == CategoryType.contentOfCategory){
          emit(ReceivedContentListing((data as CategoryContentListing).data));
        }

      }

    }catch(e){
      logger.e(e);
      emit(LoadListingFailed("Something went wrong!!!"));
    }

  }
}
