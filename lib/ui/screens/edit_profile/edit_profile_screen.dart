import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';

import 'edit_profile_screen_cubit.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget implements AutoRouteWrapper{
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => EditProfileScreenCubit(), child: this);
  }
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: const Center(
        child: Text("EditProfileScreen"),
      ),
    );
  }
}
