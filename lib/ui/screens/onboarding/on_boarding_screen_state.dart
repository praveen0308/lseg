part of 'on_boarding_screen_cubit.dart';

@immutable
abstract class OnBoardingScreenState {}

class OnBoardingScreenInitial extends OnBoardingScreenState {}
class OnBoardingDone extends OnBoardingScreenState {}

class OnBoardingUpdated extends OnBoardingScreenState {
  final String image;
  final String title;
  final String subtitle;
  final bool showNext;
  final bool showBack;
  final bool showGetStarted;
  final int activeIndex;

  OnBoardingUpdated(this.image, this.title, this.subtitle, this.showNext,
      this.showBack, this.showGetStarted, this.activeIndex);
}
