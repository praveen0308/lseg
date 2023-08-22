import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';

import 'purchase_content_screen_cubit.dart';

@RoutePage()
class PurchaseContentScreen extends StatefulWidget implements AutoRouteWrapper{
  final ContentModel contentModel;
  const PurchaseContentScreen({super.key, required this.contentModel});

  @override
  State<PurchaseContentScreen> createState() => _PurchaseContentScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => PurchaseContentScreenCubit(), child: this);
  }
}

class _PurchaseContentScreenState extends State<PurchaseContentScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Center(
        child: Text("PurchaseContentScreen"),
      ),
    );
  }
}
