import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/routes.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/widgets/view_nested_list_parent.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BasePageState{
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(

      behavior: NoGlowBehaviour(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSliderView(),
            vGap(),
            NestedListParentView(title: "Most Popular", onMoreClick: () {
              AutoRouter.of(context).push(BaseListingRoute(title: 'Most Popular'));
            },),
            vGap(height: 32),
            NestedListParentView(title: "Trending", onMoreClick: () {
              AutoRouter.of(context).push(BaseListingRoute(title: 'Trending'));
            },),
            vGap(height: 32),
            NestedListParentView(title: AppStrings.recommendedCategories, onMoreClick: () {
              AutoRouter.of(context).push(BaseListingRoute(title: AppStrings.recommendedCategories));
            },),

          ],
        ),
      ),
    );
  }
}
