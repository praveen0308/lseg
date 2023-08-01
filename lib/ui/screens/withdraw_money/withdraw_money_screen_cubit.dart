import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'withdraw_money_screen_state.dart';

class WithdrawMoneyScreenCubit extends Cubit<WithdrawMoneyScreenState> {
  WithdrawMoneyScreenCubit() : super(WithdrawMoneyScreenInitial());
}
