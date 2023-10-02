import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/favourites/favourites_screen_cubit.dart';
import 'package:lseg/ui/widgets/view_base_listing.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/utils.dart';

@RoutePage()
class FavouritesScreen extends StatefulWidget implements AutoRouteWrapper{
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => FavouritesScreenCubit(
      RepositoryProvider.of<ContentRepositoryImpl>(context)
    ), child: this);
  }
}

class _FavouritesScreenState extends State<FavouritesScreen> {

  @override
  void initState() {
    BlocProvider.of<FavouritesScreenCubit>(context).loadContents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      applyScroll: false,
      toolbarActionEnabled: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            AppStrings.favourites,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          BlocConsumer<FavouritesScreenCubit, FavouritesScreenState>(
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
              if(state is ReceivedContents){
                return Expanded(
                  child: Padding(
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
