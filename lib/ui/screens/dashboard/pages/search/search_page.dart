import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/route_imports.gr.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/dashboard/pages/pages.dart';
import 'package:lseg/ui/widgets/btn_action.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with BasePageState {
  final fnSearch = FocusNode();
  final searchText = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<SearchPageCubit>(context).fetchRecommendedCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /*Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all()
            ),
            child: Row(
              children: [
                const Icon(Icons.search_rounded),
                Expanded(
                  child: TextField(
                    controller: searchText,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      hintText: "Search here",
                    ),
                  ),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Icon(
                      Icons.search_rounded
                  ),
                )
              ],
            ),
          ),*/
          TextField(
            controller: searchText,
            focusNode: fnSearch,
            decoration: InputDecoration(
                hintText: "Search here",
                prefixIcon: const Icon(Icons.search_rounded),
                contentPadding: const EdgeInsets.only(bottom: 16,right: 16,top: 0,),
                suffix: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context)
                        .push(SearchResultRoute(searchQuery: searchText.text));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text("Search",style: TextStyle(color: Colors.white),),
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: AppColors.primary)),
                focusColor: AppColors.primary),
          ),
          vGap(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recommended Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ActionButton(
                onClick: () {
                  AutoRouter.of(context).push(const CategoriesRoute());
                },
                title: AppStrings.seeAll,
              ),
            ],
          ),
          BlocBuilder<SearchPageCubit, SearchPageState>(
            builder: (context, state) {

              if(state is LoadingRecommendedCategories){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is ReceivedCategories){
                return SizedBox(
                  height: 60,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){
                          AutoRouter.of(context).push(CategoryContentRoute(categoryModel: state.categories[index]));
                        },
                        child: Chip(
                          label: Text(
                            state.categories[index].name ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.black),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return hGap(width: 4);
                    },
                    itemCount: state.categories.length,
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
