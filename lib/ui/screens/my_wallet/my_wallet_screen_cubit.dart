import 'package:bloc/bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';

part 'my_wallet_screen_state.dart';

class MyWalletScreenCubit extends Cubit<MyWalletScreenState> with BaseCubit {
  final UserRepositoryImpl _userRepositoryImpl;

  MyWalletScreenCubit(this._userRepositoryImpl)
      : super(MyWalletScreenInitial());

  Future<void> fetchWalletBalance() async {
    emit(LoadingWalletBalance());
    try {
      var balance = await _userRepositoryImpl.fetchWalletBalance();
      emit(ReceivedWalletBalance(balance ?? 0));
    } catch (e) {
      logger.e(e);
      emit(LoadWalletBalanceFailed());
    }
  }
}
