import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/local/app_storage.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/route_imports.gr.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/registration/final_step_page/final_step_page.dart';
import 'package:lseg/ui/screens/registration/registration_screen_cubit.dart';
import 'package:lseg/ui/screens/registration/welcome_page/welcome_page.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/util_methods.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => RegistrationScreenCubit(
          RepositoryProvider.of<AppStorage>(context)
        ), child: this);
  }
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with BasePageState {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        applyScroll: false,
        enableAppBar: false,
        body: BlocListener<RegistrationScreenCubit, RegistrationScreenState>(
          listener: (context, state) {
            showLoading(state is SubmittingWelcomeData ||
                state is SubmittingFinalStepData);
            if (state is RegistrationFirstStepDone) {
              showToast("Welcome Data Saved Successfully!!", ToastType.success);
              _pageController.jumpToPage(1);
            }

            if (state is RegistrationFinalStepDone) {
              showToast("Registration done successfully!!", ToastType.success);
              AutoRouter.of(context).navigate(const DashboardRoute());
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: const [WelcomePage(), FinalStepPage()],
                ),
              ),
              BlocBuilder<RegistrationScreenCubit, RegistrationScreenState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      IndicatorView(
                          length: 2,
                          activeIndex:
                              BlocProvider.of<RegistrationScreenCubit>(context)
                                  .activeStep),
                      if (BlocProvider.of<RegistrationScreenCubit>(context)
                          .showNext)
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<RegistrationScreenCubit>(context)
                                  .submitWelcomeData();
                            },
                            child: const Text(AppStrings.next)),
                      if (BlocProvider.of<RegistrationScreenCubit>(context)
                          .showSubmit)
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<RegistrationScreenCubit>(context)
                                  .submitFinalData();
                            },
                            child: const Text(AppStrings.submit)),
                      vGap(),
                      if (BlocProvider.of<RegistrationScreenCubit>(context)
                          .showBack)
                        OutlinedButton(
                            onPressed: () {
                              BlocProvider.of<RegistrationScreenCubit>(context)
                                  .backNavigate();
                            },
                            child: const Text(AppStrings.back))
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}