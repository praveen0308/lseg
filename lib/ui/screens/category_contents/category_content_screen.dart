import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/utils.dart';

import 'category_content_screen_cubit.dart';

@RoutePage()
class CategoryContentScreen extends StatefulWidget implements AutoRouteWrapper {
  final CategoryModel categoryModel;

  const CategoryContentScreen({super.key, required this.categoryModel});

  @override
  State<CategoryContentScreen> createState() => _CategoryContentScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => CategoryContentScreenCubit(
            RepositoryProvider.of<ContentRepositoryImpl>(context)),
        child: this);
  }
}

class _CategoryContentScreenState extends State<CategoryContentScreen> with BasePageState{
  @override
  void initState() {
    BlocProvider.of<CategoryContentScreenCubit>(context)
        .loadContents(widget.categoryModel.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      applyScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.categoryModel.name ?? "",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          vGap(),
          BlocConsumer<CategoryContentScreenCubit, CategoryContentScreenState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is LoadingContents) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is NoContents) {
                return const Expanded(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.folder_copy_outlined,size: 50,),
                      Text("No Data Found!!!")
                    ],
                  ),
                );
              }
              if (state is ReceivedContents) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: ScrollConfiguration(
                      behavior: NoGlowBehaviour(),
                      child: GridView.builder(

                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 16,
                              mainAxisSpacing: 8
                            ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.contents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ContentItemView(
                            content: state.contents[index],
                          );
                        },
                      ),
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
