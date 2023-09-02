import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/view_category.dart';
import 'package:lseg/ui/widgets/view_text_input_field.dart';
import 'package:lseg/utils/utils.dart';

import 'categories_screen_cubit.dart';

@RoutePage()
class CategoriesScreen extends StatefulWidget implements AutoRouteWrapper {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => CategoriesScreenCubit(
            RepositoryProvider.of<CategoryRepositoryImpl>(context)),
        child: this);
  }
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with BasePageState {

  final _searchController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<CategoriesScreenCubit>(context).loadCategories();
    _searchController.addListener(() {
      BlocProvider.of<CategoriesScreenCubit>(context).filterCategories(_searchController.text);
    });
    super.initState();
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          TextInputFieldView(label: "Search", textEditingController: _searchController,placeHolder: "Search here...",),
          vGap(),
          BlocConsumer<CategoriesScreenCubit, CategoriesScreenState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingCategories) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is NoCategoriesFound) {
                return const Column(
                  children: [
                    Icon(Icons.category_outlined),
                    Text("No Data Found!!!")
                  ],
                );
              }
              if (state is ReceivedCategories) {
                return Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowBehaviour(),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 8),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: state.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryView(
                          categoryModel: state.categories[index],
                        );
                      },
                    ),
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
