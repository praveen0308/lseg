import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'favourites_screen_state.dart';

class FavouritesScreenCubit extends Cubit<FavouritesScreenState> with BaseCubit{
  final ContentRepositoryImpl _contentRepositoryImpl;
  FavouritesScreenCubit(this._contentRepositoryImpl) : super(FavouritesScreenInitial());

  Future<void> loadContents() async {
    emit(LoadingContents());
    try{
      var response = await _contentRepositoryImpl.getFavourites();
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
