import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lseg/local/local.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/routes.dart';
import 'package:lseg/ui/screens/core/base_page.dart';

import 'package:lseg/ui/screens/onboarding/on_boarding_screen_cubit.dart';
import 'package:lseg/ui/widgets/view_indicator.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget implements AutoRouteWrapper {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) =>
            OnBoardingScreenCubit(RepositoryProvider.of<AppStorage>(context)),
        child: this);
  }
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with BasePageState{
  @override
  void initState() {
    BlocProvider.of<OnBoardingScreenCubit>(context).update(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          body: BlocConsumer<OnBoardingScreenCubit, OnBoardingScreenState>(
            listener: (context, state) {
              if (state is OnBoardingDone) {
                AutoRouter.of(context).replace(const LoginRoute());
              }
            },
            builder: (context, state) {
              if (state is OnBoardingUpdated) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      vGap(height: 24),
                      Row(
                        children: [
                          Image.asset(AppImages.icLogo2,height:60,width: 160,),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SvgPicture.asset(state.image),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        state.title,
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700, fontSize: 36),
                      ),
                      Expanded(
                          child: Center(
                              child: Text(
                        state.subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ))),
                      IndicatorView(length: 4, activeIndex: state.activeIndex),
                      Visibility(
                          visible: state.showNext,
                          child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<OnBoardingScreenCubit>(context)
                                    .update(1);
                              },
                              child: const Text(AppStrings.next))),
                      const SizedBox(
                        height: 14,
                      ),
                      Visibility(
                          visible: state.showBack,
                          child: OutlinedButton(
                              onPressed: () {
                                BlocProvider.of<OnBoardingScreenCubit>(context)
                                    .update(-1);
                              },
                              child: const Text(AppStrings.back))),
                      const SizedBox(
                        height: 14,
                      ),
                      Visibility(
                          visible: state.showGetStarted,
                          child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<OnBoardingScreenCubit>(context)
                                    .getStarted();
                              },
                              child: const Text(AppStrings.getStarted)))
                    ],
                  ),
                );
              }
              return Container();
            },
          )),
    );
  }
}
