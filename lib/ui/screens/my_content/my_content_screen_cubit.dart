import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'my_content_screen_state.dart';

class MyContentScreenCubit extends Cubit<MyContentScreenState> with BaseCubit{
  final ContentRepositoryImpl _contentRepositoryImpl;
  MyContentScreenCubit(this._contentRepositoryImpl) : super(MyContentScreenInitial());

  Future<void> loadContents() async {
    emit(LoadingContents());
    try{
      var response = await _contentRepositoryImpl.getContentByCreator();
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
