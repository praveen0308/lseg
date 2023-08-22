import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'category_content_screen_state.dart';

class CategoryContentScreenCubit extends Cubit<CategoryContentScreenState> with BaseCubit{

  final ContentRepositoryImpl _contentRepositoryImpl;
  CategoryContentScreenCubit(this._contentRepositoryImpl) : super(CategoryContentScreenInitial());

  Future<void> loadContents(String categoryId) async {
    emit(LoadingContents());
    try{
      var response = await _contentRepositoryImpl.getContentByCategory(categoryId);
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
