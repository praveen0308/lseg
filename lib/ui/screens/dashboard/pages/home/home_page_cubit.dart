import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> with BaseCubit{
  final GetHomeListing _getHomeListing;

  HomePageCubit(this._getHomeListing) : super(HomePageInitial());

  Future<void> fetchHomeListing() async {
    emit(LoadingData());
    try{
      var listing = await _getHomeListing.fetchData();
      if(listing.isNotEmpty){
        emit(ReceivedHomeListing(listing));
      }else{
        emit(NoDataFound());
      }
    }catch(e){
      logger.e(e);
      emit(HomeListingFailed("Something went wrong!!!"));
    }
  }
}
