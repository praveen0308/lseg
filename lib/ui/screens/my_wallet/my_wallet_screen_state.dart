part of 'my_wallet_screen_cubit.dart';

@immutable
abstract class MyWalletScreenState {}

class MyWalletScreenInitial extends MyWalletScreenState {}
class LoadingWalletBalance extends MyWalletScreenState {}
class LoadWalletBalanceFailed extends MyWalletScreenState {}
class ReceivedWalletBalance extends MyWalletScreenState {
  final num balance;

  ReceivedWalletBalance(this.balance);
}

