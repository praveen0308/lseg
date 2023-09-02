import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/view_base_listing.dart';
import 'package:lseg/ui/widgets/view_category.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/utils.dart';

import 'base_listing_screen_cubit.dart';

@RoutePage()
class BaseListingScreen extends StatefulWidget
    implements AutoRouteWrapper {
  final CategoryType type;
  final String title;
  final String? categoryId;

  const BaseListingScreen({super.key, required this.title, required this.type, this.categoryId});

  @override
  State<BaseListingScreen> createState() => _BaseListingScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => BaseListingScreenCubit(
            RepositoryProvider.of<GetCategoryListing>(context)),
        child: this);
  }
}

class _BaseListingScreenState extends State<BaseListingScreen> with BasePageState{

  @override
  void initState() {
    BlocProvider.of<BaseListingScreenCubit>(context).fetchListing(widget.type,categoryId: widget.categoryId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          vGap(),
          BlocConsumer<BaseListingScreenCubit,BaseListingScreenState>(
              builder: (context, state) {
                if (state is LoadingListing) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ReceivedContentListing) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: ScrollConfiguration(
                      behavior: NoGlowBehaviour(),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.68,
                                crossAxisSpacing: 8,mainAxisSpacing: 8),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ContentItemView(
                            content: state.items[index],
                          );
                        },
                      ),
                    ),
                  );
                }
                if (state is ReceivedCategoryListing) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ScrollConfiguration(
                      behavior: NoGlowBehaviour(),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 8),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryView(
                            categoryModel: state.items[index],
                          );
                        },
                      ),
                    ),
                  );
                }
                if (state is LoadListingFailed) {
                  return Center(
                    child: Text(state.msg),
                  );
                }
                return Container();
              },
              listener: (context, state) {}),
        ],
      ),
    );
  }
}
