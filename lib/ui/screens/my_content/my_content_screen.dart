import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
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
    return BlocProvider(create: (ctx) => MyContentScreenCubit(
      RepositoryProvider.of<ContentRepositoryImpl>(context)
    ), child: this);
  }
}

class _MyContentScreenState extends State<MyContentScreen> {

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
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is LoadingContents) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is NoContents) {
                return const Column(
                  children: [
                    Icon(Icons.folder_copy_outlined),
                    Text("No Data Found!!!")
                  ],
                );
              }
              if(state is ReceivedContents){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ScrollConfiguration(
                    behavior: NoGlowBehaviour(),
                    child: GridView.builder(

                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.689,
                          crossAxisSpacing: 16),
                      shrinkWrap: true,

                      scrollDirection: Axis.vertical,
                      itemCount: state.contents.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ContentItemView(content: state.contents[index],);
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
