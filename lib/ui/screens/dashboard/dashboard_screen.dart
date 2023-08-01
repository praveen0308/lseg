import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/route_imports.gr.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/dashboard/dashboard_screen_cubit.dart';
import 'package:lseg/ui/widgets/toolbar_main.dart';
import 'pages/pages.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget implements AutoRouteWrapper {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => DashboardScreenCubit(), child: this);
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  int activeIndex = 0;
  final _dashboardPageController = PageController();
  final _toolbarController = ToolbarController(AppStrings.home);
  final pageLabels = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.upload,
    AppStrings.leaderBoard,
    AppStrings.profile
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      toolbarController: _toolbarController,
      applyScroll: false,
      homeAppBar: true,
      pagePadding: const EdgeInsets.all(0),
      onPrimaryActionClick: (){},
      onSecondaryClick: (){
        AutoRouter.of(context).push(const FavouritesRoute());
      },
      body: Column(
        children: [
          Expanded(
              child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _dashboardPageController,
            children: const [
              HomePage(),
              SearchPage(),
              UploadPage(),
              LeaderboardPage(),
              ProfilePage(),
            ],
          )),
        ],
      ),
      bottomNav: Container(
        padding: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyBgColor),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: BottomNavigationBar(
            currentIndex: activeIndex,
            onTap: (idx) {
              if (idx == 2) {
                AutoRouter.of(context).push(const UploadContentRoute());
              } else {
                setState(() {
                  activeIndex = idx;
                  _dashboardPageController.jumpToPage(idx);
                  _toolbarController.setTitle(pageLabels[idx]);
                });
              }
            },
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.icHome,
                    height: 30,
                    width: 30,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.icHomeFilled,
                    height: 30,
                    width: 30,
                  ),
                  label: pageLabels[0]),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.icSearch,
                    height: 30,
                    width: 30,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.icSearchFilled,
                    height: 30,
                    width: 30,
                  ),
                  label: pageLabels[1]),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.icLightBulb,
                    height: 30,
                    width: 30,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.icLightBulbFilled,
                    height: 30,
                    width: 30,
                  ),
                  label: pageLabels[2]),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.icRupeeCircle,
                    height: 30,
                    width: 30,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.icRupeeCircleFilled,
                    height: 30,
                    width: 30,
                  ),
                  label: pageLabels[3]),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImages.icUserCircle,
                    height: 30,
                    width: 30,
                  ),
                  activeIcon: SvgPicture.asset(
                    AppImages.icUserCircleFilled,
                    height: 30,
                    width: 30,
                  ),
                  label: pageLabels[4]),
            ]),
      ),
    );
  }
}
