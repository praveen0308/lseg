import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/favourites/favourites_screen_cubit.dart';
import 'package:lseg/ui/widgets/view_base_listing.dart';

@RoutePage()
class FavouritesScreen extends StatefulWidget implements AutoRouteWrapper{
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => FavouritesScreenCubit(), child: this);
  }
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      applyScroll: false,
      body:BaseListingView(title: AppStrings.favourites,),
    );
  }
}
