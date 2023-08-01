import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/view_category.dart';
import 'package:lseg/utils/utils.dart';

import 'categories_screen_cubit.dart';

@RoutePage()
class CategoriesScreen extends StatefulWidget implements AutoRouteWrapper{
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => CategoriesScreenCubit(), child: this);
  }
}

class _CategoriesScreenState extends State<CategoriesScreen> with BasePageState{
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      applyScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            AppStrings.categories,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          vGap(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ScrollConfiguration(
                behavior: NoGlowBehaviour(),
                child: GridView.builder(

                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1,crossAxisSpacing: 16,mainAxisSpacing: 8),
                  shrinkWrap: true,

                  scrollDirection: Axis.vertical,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryView();
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
