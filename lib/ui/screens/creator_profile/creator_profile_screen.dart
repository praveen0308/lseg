import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/toolbar_main.dart';
import 'package:lseg/ui/widgets/view_base_listing.dart';

import 'creator_profile_screen_cubit.dart';

@RoutePage()
class CreatorProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const CreatorProfileScreen({super.key});

  @override
  State<CreatorProfileScreen> createState() => _CreatorProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => CreatorProfileScreenCubit(), child: this);
  }
}

class _CreatorProfileScreenState extends State<CreatorProfileScreen> with BasePageState{
  final toolbarController = ToolbarController("Username");

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      toolbarController: toolbarController,
      pagePadding: const EdgeInsets.all(0),
      body: Column(
        children: [
          Container(
            height: 125,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8
            ),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.greyLight, AppColors.greyLightest],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Row(
              children: [
                CircleAvatar(radius: 50,),
                hGap(),
                Column(
                  children: [
                    Text("Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("Bio",),
                    Text("Website",)

                  ],
                )
              ],
            ),
          ),
          vGap(),
          BaseListingView(title: "Content By Creator")
        ],
      ),
    );
  }
}
