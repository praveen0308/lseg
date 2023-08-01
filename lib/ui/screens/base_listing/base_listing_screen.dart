import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/view_base_listing.dart';

import 'base_listing_screen_cubit.dart';

@RoutePage()
class BaseListingScreen extends StatefulWidget implements AutoRouteWrapper{
  final String title;

  const BaseListingScreen({super.key, required this.title});


  @override
  State<BaseListingScreen> createState() => _BaseListingScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => BaseListingScreenCubit(), child: this);
  }
}

class _BaseListingScreenState extends State<BaseListingScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: BaseListingView(title: widget.title,),
    );
  }
}
