import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'categories_screen_state.dart';

class CategoriesScreenCubit extends Cubit<CategoriesScreenState> with BaseCubit{
  final CategoryRepositoryImpl _categoryRepositoryImpl;

  CategoriesScreenCubit(this._categoryRepositoryImpl)
      : super(CategoriesScreenInitial());

  final categories = List<CategoryModel>.empty(growable: true);
  Future<void> loadCategories() async {
    emit(LoadingCategories());
    try{
      var response = await _categoryRepositoryImpl.getCategories();
      if(response.isNotEmpty){
        categories.clear();
        categories.addAll(response);
        emit(ReceivedCategories(response));
      }else{
        emit(NoCategoriesFound());
      }
    }catch(e){
      logger.e(e);
    }

  }

  void filterCategories(String query){
    var filteredList = List<CategoryModel>.empty(growable: true);
    if(query.isNotEmpty){
      categories.forEach((element) {
        if(element.name!.containsIgnoreCase(query)){
          filteredList.add(element);
        }
      });
    }else{
      filteredList.addAll(categories);
    }

    emit(ReceivedCategories(filteredList));
  }


}

extension StringExtensions on String {
  bool containsIgnoreCase(String secondString) => toLowerCase().contains(secondString.toLowerCase());

}