import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/routes.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/dashboard/pages/home/home_page_cubit.dart';
import 'package:lseg/ui/screens/view_base_listing_section/base_listing_section_view.dart';
import 'package:lseg/ui/widgets/view_nested_list_parent.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';
import 'package:lseg/utils/util_methods.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BasePageState {

  @override
  void initState() {
    BlocProvider.of<HomePageCubit>(context).fetchHomeListing();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {
        showLoading(state is LoadingData);
        if (state is HomeListingFailed) {
          showToast(state.msg, ToastType.error);
        }
      },
      builder: (context, state) {
        if (state is LoadingData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NoDataFound) {
          return const Center(
            child: Text("No data found!"),
          );
        }
        if (state is ReceivedHomeListing) {
          return ListView.separated(
              itemBuilder: (context, index) {
                if (state.data[index] is TrendingContents) {
                  var data = state.data[index] as TrendingContents;
                  return BaseListingSectionView(
                      type: CategoryType.trendingContent,
                      title: data.title,
                      items: data.data);
                }
                if (state.data[index] is PopularContents) {
                  var data = state.data[index] as PopularContents;
                  return BaseListingSectionView(
                      type: CategoryType.popularContent,
                      title: data.title,
                      items: data.data);
                }

                if (state.data[index] is RecommendCategories) {
                  var data = state.data[index] as RecommendCategories;
                  return BaseListingSectionView(
                      type: CategoryType.recommendedCategories,
                      title: data.title,
                      items: data.data);
                }
                if (state.data[index] is Carousal) {
                  var data = state.data[index] as Carousal;
                  return CarouselSliderView(
                    items: data.urls,
                  );
                }
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 8,
                );
              },
              itemCount: state.data.length);
        }

        return Container();
      },
    );
  }
}
