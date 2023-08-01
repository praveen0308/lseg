import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/view_course_item.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';

import 'my_content_screen_cubit.dart';

@RoutePage()
class MyContentScreen extends StatefulWidget implements AutoRouteWrapper {
  const MyContentScreen({super.key});

  @override
  State<MyContentScreen> createState() => _MyContentScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => MyContentScreenCubit(), child: this);
  }
}

class _MyContentScreenState extends State<MyContentScreen> {
  final courses = AppConstants.fakeCourses;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      applyScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            AppStrings.myContent,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ScrollConfiguration(
                behavior: NoGlowBehaviour(),
                child: GridView.builder(

                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.689,crossAxisSpacing: 16),
                  shrinkWrap: true,

                  scrollDirection: Axis.vertical,
                 itemCount: courses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CourseItemView();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
