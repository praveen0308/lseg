import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'search_result_screen_state.dart';

class SearchResultScreenCubit extends Cubit<SearchResultScreenState> with BaseCubit{
  final ContentRepositoryImpl _contentRepositoryImpl;
  SearchResultScreenCubit(this._contentRepositoryImpl) : super(SearchResultScreenInitial());

  Future<void> loadContents(String query) async {
    emit(LoadingContents());
    try{
      var response = await _contentRepositoryImpl.getContentByQuery(query);
      if(response.isNotEmpty){
        emit(ReceivedContents(response));
      }else{
        emit(NoContents());
      }
    }catch(e){
      logger.e(e);
    }
  }
}
