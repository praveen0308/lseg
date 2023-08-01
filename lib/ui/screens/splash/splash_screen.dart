import 'dart:async';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lseg/local/app_login_state.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/routes.dart';
import 'package:lseg/ui/screens/core/base_page.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with BasePageState {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: AppConstants.splashScreenPauseTime), () {
      // AutoRouter.of(context).replace(const OnBoardingRoute());
      navigateToApplication();
    });
  }

  void navigateToApplication() {
    cache.getUserLoginState().then((loginState) {
      if (loginState.isOnBoardingDone) {
        if (loginState.isLoggedIn) {
          if (loginState.isRegistered) {
            AutoRouter.of(context).replace(const DashboardRoute());
          } else {
            AutoRouter.of(context).replace(const RegistrationRoute());
          }
        } else {
          AutoRouter.of(context).push(const LoginRoute());
        }
      } else {
        AutoRouter.of(context).replace(const OnBoardingRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.imgSplash),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
