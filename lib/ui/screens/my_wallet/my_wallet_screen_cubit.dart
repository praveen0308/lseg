import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_wallet_screen_state.dart';

class MyWalletScreenCubit extends Cubit<MyWalletScreenState> {
  MyWalletScreenCubit() : super(MyWalletScreenInitial());
}
