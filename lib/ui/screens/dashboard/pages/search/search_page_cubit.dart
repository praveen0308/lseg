import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'search_page_state.dart';

class SearchPageCubit extends Cubit<SearchPageState> with BaseCubit{
  final CategoryRepositoryImpl _categoryRepositoryImpl;
  SearchPageCubit(this._categoryRepositoryImpl) : super(SearchPageInitial());

  Future<void> fetchRecommendedCategories() async {
    emit(LoadingRecommendedCategories());
    try{
      var result = await _categoryRepositoryImpl.getRecommendedCategories();
      if(result.isNotEmpty){
        emit(ReceivedCategories(result));
      }

    }catch(e){
      logger.e(e);
      emit(LoadRecommendedCategoriesFailed("Recommended categories not found!!!"));
    }
  }
}
