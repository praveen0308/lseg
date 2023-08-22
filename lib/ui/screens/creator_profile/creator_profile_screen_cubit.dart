import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'creator_profile_screen_state.dart';

class CreatorProfileScreenCubit extends Cubit<CreatorProfileScreenState> with BaseCubit{
  final UserRepositoryImpl _userRepositoryImpl;
  CreatorProfileScreenCubit(this._userRepositoryImpl) : super(CreatorProfileScreenInitial());

  Future<void> fetchCreatorProfile(String userId)async{
    emit(LoadingCreatorProfile());
    try{
      var response = await _userRepositoryImpl.fetchCreatorProfile(userId);
      if(response!=null){
        emit(ReceivedCreatorProfile(response.first,response.second));
      }

    }catch(e){
      logger.e(e);
      emit(LoadProfileFailed("Something went wrong!!!"));
    }
  }
}
