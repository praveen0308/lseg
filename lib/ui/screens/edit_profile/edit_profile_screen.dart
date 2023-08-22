import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/edit_profile/pages/contact_info_page.dart';
import 'package:lseg/ui/screens/edit_profile/pages/other_info_page.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/utils.dart';

import 'edit_profile_screen_cubit.dart';
import 'pages/personal_info_page.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => EditProfileScreenCubit(
              RepositoryProvider.of<AuthRepositoryImpl>(context),
              RepositoryProvider.of<UserRepositoryImpl>(context),
            ),
        child: this);
  }
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with BasePageState {
  final _pageController = PageController();
@override
  void initState() {
    BlocProvider.of<EditProfileScreenCubit>(context).initEditProfileData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        applyScroll: false,
        enableAppBar: false,
        body: BlocListener<EditProfileScreenCubit, EditProfileScreenState>(
          listener: (context, state) {
            showLoading(state is SubmittingPersonalInfo ||
                state is SubmittingOtherInfo ||
                state is SubmittingContactInfo);
            if (state is PersonalInfoSubmitted) {
              _pageController.jumpToPage(1);
            }
            if (state is OtherInfoSubmitted) {
              _pageController.jumpToPage(2);
            }
            if (state is EditProfileDone) {
              showToast("Profile updated successfully!!", ToastType.success);
              AutoRouter.of(context).pop();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    BlocProvider.value(
                      value: context.read<EditProfileScreenCubit>(),
                      child: const PersonalInfoPage(),
                    ),
                    BlocProvider.value(
                      value: context.read<EditProfileScreenCubit>(),
                      child: const OtherInfoPage(),
                    ),
                    BlocProvider.value(
                      value: context.read<EditProfileScreenCubit>(),
                      child: const ContactInfoPage(),
                    ),
                  ],
                ),
              ),
              BlocBuilder<EditProfileScreenCubit, EditProfileScreenState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      IndicatorView(
                          length: 3,
                          activeIndex:
                              BlocProvider.of<EditProfileScreenCubit>(context)
                                  .activeStep),
                      if (BlocProvider.of<EditProfileScreenCubit>(context)
                          .showNext)
                        ElevatedButton(
                            onPressed: () {
                              if(_pageController.page?.toInt() == 0){
                                BlocProvider.of<EditProfileScreenCubit>(context)
                                    .validatePersonalInfo();
                              }else{
                                BlocProvider.of<EditProfileScreenCubit>(context)
                                    .validateOtherInfo();
                              }

                            },
                            child: const Text(AppStrings.next)),
                      if (BlocProvider.of<EditProfileScreenCubit>(context)
                          .showSubmit)
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<EditProfileScreenCubit>(context)
                                  .validateContactInfo();
                            },
                            child: const Text(AppStrings.submit)),
                      vGap(),
                      if (BlocProvider.of<EditProfileScreenCubit>(context)
                          .showBack)
                        OutlinedButton(
                            onPressed: () {
                              BlocProvider.of<EditProfileScreenCubit>(context)
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
