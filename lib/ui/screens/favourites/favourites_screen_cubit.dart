import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourites_screen_state.dart';

class FavouritesScreenCubit extends Cubit<FavouritesScreenState> {
  FavouritesScreenCubit() : super(FavouritesScreenInitial());
}
