import 'package:bloc/bloc.dart';
import 'package:lseg/domain/models/on_boarding_model.dart';
import 'package:lseg/generated/assets.dart';
import 'package:lseg/local/local.dart';
import 'package:lseg/res/res.dart';
import 'package:meta/meta.dart';

part 'on_boarding_screen_state.dart';

class OnBoardingScreenCubit extends Cubit<OnBoardingScreenState> {
  final AppStorage _appStorage;
  OnBoardingScreenCubit(this._appStorage) : super(OnBoardingScreenInitial());
  final onBoardingItems = [
    OnBoardingModel(Assets.lsegAssetsImgLearn, AppStrings.onBoardingTitle1,
        AppStrings.onBoardingDescription1),
    OnBoardingModel(Assets.lsegAssetsImgShare, AppStrings.onBoardingTitle2,
        AppStrings.onBoardingDescription2),
    OnBoardingModel(Assets.lsegAssetsImgEarn, AppStrings.onBoardingTitle3,
        AppStrings.onBoardingDescription3),
    OnBoardingModel(Assets.lsegAssetsImgGrowth, AppStrings.onBoardingTitle4,
        AppStrings.onBoardingDescription4),
  ];

  var activeIndex = 0;

  void update(int factor) {
    activeIndex=activeIndex+factor;
    var activeBoard = onBoardingItems[activeIndex];
    var showNext = activeIndex < onBoardingItems.length - 1;
    var showBack = 0 < activeIndex && activeIndex < onBoardingItems.length - 1;
    var showGetStarted = activeIndex == onBoardingItems.length - 1;

    emit(OnBoardingUpdated(activeBoard.image, activeBoard.title,
        activeBoard.subtitle, showNext, showBack, showGetStarted, activeIndex));
  }
  void getStarted(){
    _appStorage.updateOnBoardingDoneState(true);
    emit(OnBoardingDone());
  }
}
