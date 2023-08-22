import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/utils.dart';

import 'search_result_screen_cubit.dart';

@RoutePage()
class SearchResultScreen extends StatefulWidget implements AutoRouteWrapper{
  final String searchQuery;
  const SearchResultScreen({super.key, required this.searchQuery});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => SearchResultScreenCubit(
      RepositoryProvider.of<ContentRepositoryImpl>(context)
    ), child: this);
  }
}

class _SearchResultScreenState extends State<SearchResultScreen> {

  @override
  void initState() {
    BlocProvider.of<SearchResultScreenCubit>(context)
        .loadContents(widget.searchQuery);
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
            "Search results for '${widget.searchQuery}'",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          BlocConsumer<SearchResultScreenCubit, SearchResultScreenState>(
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
                    Icon(Icons.search_off_rounded),
                    Text("No Data Found!!!")
                  ],
                );
              }
              if (state is ReceivedContents) {
                return Padding(
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
