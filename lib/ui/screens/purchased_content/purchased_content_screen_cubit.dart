import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'purchased_content_screen_state.dart';

class PurchasedContentScreenCubit extends Cubit<PurchasedContentScreenState> with BaseCubit{
  final ContentRepositoryImpl _contentRepositoryImpl;
  PurchasedContentScreenCubit(this._contentRepositoryImpl) : super(PurchasedContentScreenInitial());

  Future<void> loadContents() async {
    emit(LoadingContents());
    try{
      var response = await _contentRepositoryImpl.getPurchasedContents();
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
