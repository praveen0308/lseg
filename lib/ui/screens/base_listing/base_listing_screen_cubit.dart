import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'base_listing_screen_state.dart';

class BaseListingScreenCubit extends Cubit<BaseListingScreenState> {
  BaseListingScreenCubit() : super(BaseListingScreenInitial());
}
