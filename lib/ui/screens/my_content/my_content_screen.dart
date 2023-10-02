import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/routes.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';

import 'my_content_screen_cubit.dart';

@RoutePage()
class MyContentScreen extends StatefulWidget implements AutoRouteWrapper {
  const MyContentScreen({super.key});

  @override
  State<MyContentScreen> createState() => _MyContentScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => MyContentScreenCubit(
            RepositoryProvider.of<ContentRepositoryImpl>(context)),
        child: this);
  }
}

class _MyContentScreenState extends State<MyContentScreen> with BasePageState{
  @override
  void initState() {
    BlocProvider.of<MyContentScreenCubit>(context).loadContents();
    super.initState();
  }

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
          BlocConsumer<MyContentScreenCubit, MyContentScreenState>(
            listener: (context, state) {
              showLoading(state is DeletingContent);

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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                    child: ScrollConfiguration(
                      behavior: NoGlowBehaviour(),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.5,
                                crossAxisSpacing: 8),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.contents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Flexible(
                                child: ContentItemView(
                                  content: state.contents[index],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          context.read<MyContentScreenCubit>().deleteContent(state.contents[index].contentId!);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          // context.read<MyContentScreenCubit>().deleteContent(state.contents[index].contentId!);
                                          AutoRouter.of(context).push(EditContentRoute(content: state.contents[index]));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
