import 'package:bloc/bloc.dart';
import 'package:lseg/data/data.dart';
import 'package:lseg/domain/repository/user_repository_impl.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'profile_page_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> with BaseCubit{
  final UserRepositoryImpl _userRepositoryImpl;

  ProfilePageCubit(this._userRepositoryImpl) : super(ProfilePageInitial());

  Future<void> fetchUserData() async {
    try{
      var userData = await _userRepositoryImpl.fetchUserData();
      if(userData!=null){
        emit(ProfileDataLoaded(userData.localProfile!, userData.name!, userData.userName!));
      }

    }catch(e){
      logger.e(e);
    }
  }
}
