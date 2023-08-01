import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'leaderboard_page_state.dart';

class LeaderboardPageCubit extends Cubit<LeaderboardPageState> {
  LeaderboardPageCubit() : super(LeaderboardPageInitial());
}
