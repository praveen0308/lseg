import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/view_base_listing.dart';

import 'search_result_screen_cubit.dart';

@RoutePage()
class SearchResultScreen extends StatefulWidget implements AutoRouteWrapper{
  final String searchQuery;
  const SearchResultScreen({super.key, required this.searchQuery});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => SearchResultScreenCubit(), child: this);
  }
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      applyScroll: false,
      body:BaseListingView(title: 'Search results for "${widget.searchQuery}"',),
    );
  }
}
