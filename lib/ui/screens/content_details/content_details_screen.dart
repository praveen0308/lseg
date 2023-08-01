import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/view_nested_list_parent.dart';
import 'package:lseg/ui/widgets/view_rating_data.dart';
import 'package:lseg/ui/widgets/view_visit_count_data.dart';
import 'package:lseg/utils/no_glow_behaviour.dart';

import 'content_details_screen_cubit.dart';

@RoutePage()
class ContentDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  const ContentDetailsScreen({super.key});

  @override
  State<ContentDetailsScreen> createState() => _ContentDetailsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => ContentDetailsScreenCubit(), child: this);
  }
}

class _ContentDetailsScreenState extends State<ContentDetailsScreen>
    with BasePageState {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      pagePadding: const EdgeInsets.all(0),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 140,
                    decoration: const BoxDecoration(
                        color: AppColors.greyBgColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                  ),
                  Positioned(
                      bottom: -30,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                                color: AppColors.greyLight,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: AppColors.primary)),
                          ),
                        ],
                      ))
                ],
              ),
              vGap(height: 64),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      thickness: 1,
                      color: AppColors.primary,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment : CrossAxisAlignment.stretch,
                            children: [
                              Text("Title",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              Text("Subtitle"),
                              Text("Creator"),
                              Text("Format"),
                              Text("Pages"),
                              Text("Published date"),
                              Text("Category"),
                              Text("Subcategory"),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RatingDataView(rating: 4.5, count: 55),
                            VisitCountDataView(count: 555),
                            Row(
                              children: [
                                SvgPicture.asset(AppImages.icRupeeCircle),
                                hGap(width: 4),
                                Text("1000")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    label(AppStrings.description),
                    vGap(),
                    const Text("Hello world"),
                    vGap(),
                    divider(),
                    label(AppStrings.yourRating),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star_outline_rounded,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    divider(),
                    NestedListParentView(title: "Recommended Books", onMoreClick: (){

                    })
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: (){}, child: Text("View")),
                vGap(),
                OutlinedButton(onPressed: (){}, child: Text("Preview",style: TextStyle(color: AppColors.btnTextColor),)),
                vGap(),
                ElevatedButton(onPressed: (){}, child: Text("Buy")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
