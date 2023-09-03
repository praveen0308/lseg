import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/routes.dart';
import 'package:lseg/ui/screens/content_viewer/content_viewer_screen.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/view_base_listing_section/base_listing_section_view.dart';
import 'package:lseg/ui/widgets/view_rating_data.dart';
import 'package:lseg/ui/widgets/view_visit_count_data.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/util_methods.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

import 'content_details_screen_cubit.dart';

@RoutePage()
class ContentDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  final ContentModel contentModel;

  const ContentDetailsScreen({super.key, required this.contentModel});

  @override
  State<ContentDetailsScreen> createState() => _ContentDetailsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => ContentDetailsScreenCubit(
              RepositoryProvider.of<UserRepositoryImpl>(context),
              RepositoryProvider.of<ContentRepositoryImpl>(context),
            ),
        child: this);
  }
}

class _ContentDetailsScreenState extends State<ContentDetailsScreen>
    with BasePageState {
  late ContentModel content;
  final ScrollController _scrollController = ScrollController();
  bool isButtonsVisible = true;
  final TextEditingController _reviewCommentsController =
      TextEditingController();
  double contentRating = 1;
  final List<ContentModel> recommendedContents =
      List<ContentModel>.empty(growable: true);

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    content = widget.contentModel;
    BlocProvider.of<ContentDetailsScreenCubit>(context)
        .updateContentViewCount(content.contentId!);
    /*  _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isButtonsVisible != false) {
          setState(() {
            isButtonsVisible = false;
          });
        }
      } else {
        if (isButtonsVisible != true) {
          setState(() {
            isButtonsVisible = true;
          });
        }
      }
    });*/
    super.initState();
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rate Content'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              label("Rating"),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  contentRating = rating;
                },
              ),
              TextInputFieldView(
                  label: "Comments(optional)",
                  textEditingController: _reviewCommentsController)
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    ).then((value) {
      if (value == true) {
        BlocProvider.of<ContentDetailsScreenCubit>(context).updateContentReview(
            content.contentId!,
            ReviewModel(
                rating: contentRating,
                comment: _reviewCommentsController.text));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      scrollController: _scrollController,
      toolbarActionEnabled: false,
      pagePadding: const EdgeInsets.all(0),
      body: BlocListener<ContentDetailsScreenCubit, ContentDetailsScreenState>(
        listener: (context, state) {
          showLoading(
              state is UpdatingViewCount || state is UpdatingContentReview);
          /* if(state is UpdatingContentReview){
            Navigator.of(context).pop();
          }*/
          if (state is ContentReviewUpdated) {
            showToast(
                "Content review updated successfully!!!", ToastType.success);
          }
          if (state is ReceivedRecommendContent) {
            recommendedContents.clear();
            recommendedContents.addAll(state.items);
          }
          if (state is UpdateContentReviewFailed) {
            showToast(state.msg, ToastType.error);
          }
          if (state is ViewCountUpdated) {
            // showToast("Success!!", ToastType.success);
            BlocProvider.of<ContentDetailsScreenCubit>(context)
                .fetchRecommendedContents(content.categoryId!);
          }
          if (state is AddedIntoFavourites) {
            content.isFavourite = true;
            showToast("Added into favourites !!!", ToastType.success);
          }
          if (state is RemovedFromFavourites) {
            content.isFavourite = false;
            showToast("Removed from favourites !!!", ToastType.success);
          }
        },
        child: Stack(
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
                        ),
                      ),
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
                                  border: Border.all(color: AppColors.primary),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      content.contentData!.thumbnailUrl!,
                                    ),
                                    fit: BoxFit.cover,
                                    onError: (error, stackTrace) {
                                      Container(
                                        color: Colors.grey,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          ':X Not Found!',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      );
                                    },
                                  )),
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
                      const Divider(
                        thickness: 1,
                        color: AppColors.primary,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  content.title ?? "Title",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(content.subtitle ?? "Subtitle"),
                                GestureDetector(
                                    onTap: () {
                                      AutoRouter.of(context).push(
                                          CreatorProfileRoute(
                                              creatorId: content.creatorId!,
                                              creatorName: content.creator!,
                                              creatorUsername:
                                                  content.creatorUsername!));
                                    },
                                    child: Text(
                                      content.creator ?? "Creator",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline,
                                      ),
                                    )),
                                Text(content.format ?? "Format"),
                                // const Text("Pages"),
                                Text(content.getAddedOn().toString()),
                                Text(content.category ?? "Category"),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingDataView(
                                  rating: content.getAverageRating(),
                                  count: content.getRatingCount()),
                              VisitCountDataView(count: content.views!.toInt()),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.icRupeeCircle),
                                  hGap(width: 4),
                                  Text(content.price!.toInt().toString())
                                ],
                              ),
                              BlocBuilder<ContentDetailsScreenCubit,
                                  ContentDetailsScreenState>(
                                builder: (context, state) {
                                  if (state is UpdatingFavourite) {
                                    return const SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator());
                                  }
                                  return GestureDetector(
                                    onTap: () {
                                      content.isFavourite == true
                                          ? BlocProvider.of<
                                                      ContentDetailsScreenCubit>(
                                                  context)
                                              .removeFromFavourite(content)
                                          : BlocProvider.of<
                                                      ContentDetailsScreenCubit>(
                                                  context)
                                              .addIntoFavourite(content);
                                    },
                                    child: content.isFavourite == true
                                        ? const Icon(Icons.favorite_rounded)
                                        : const Icon(
                                            Icons.favorite_border_rounded),
                                  );
                                },
                                buildWhen: (prev, state) {
                                  return state is UpdatingFavourite ||
                                      state is UpdateFavouriteFailed ||
                                      state is RemovedFromFavourites ||
                                      state is AddedIntoFavourites;
                                },
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
                      Text(content.description ?? "Description"),
                      vGap(),
                      // divider(),
                      /* label(AppStrings.yourRating),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) =>
                        const Icon(
                          Icons.star_outline_rounded,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),*/
                      Visibility(
                        visible: isButtonsVisible,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Visibility(
                                visible: !content.isPaid! ||
                                    content.isAlreadyPurchased! ||
                                    content.isMyContent!,
                                child: ElevatedButton(
                                    onPressed: () {
                                      /*AutoRouter.of(context).push(ContentViewerRoute(
                                  args: ContentViewerScreenArgs(
                                      content.contentUrl!, "")));*/
                                      showUnitAds();
                                    },
                                    child: const Text("View"))),
                            vGap(),
                            Visibility(
                              visible: content.isPaid! &&
                                  !content.isAlreadyPurchased! &&
                                  !content.isMyContent!,
                              child: OutlinedButton(
                                  onPressed: () {
                                    /*AutoRouter.of(context).push(ContentViewerRoute(
                                args: ContentViewerScreenArgs(
                                    content.contentUrl!, "")));*/
                                    showUnitAds();
                                  },
                                  child: const Text(
                                    "Preview",
                                    style: TextStyle(
                                        color: AppColors.btnTextColor),
                                  )),
                            ),
                            vGap(),
                            Visibility(
                                visible: content.isPaid! &&
                                    !content.isAlreadyPurchased! &&
                                    !content.isMyContent!,
                                child: ElevatedButton(
                                    onPressed: () {
                                      // todo navigate purchase course screen
                                    },
                                    child: const Text("Buy"))),
                          ],
                        ),
                      ),
                      OutlinedButton(
                          onPressed: () => _dialogBuilder(context),
                          child: const Text("Review Content")),
                      divider(),

                      BlocBuilder<ContentDetailsScreenCubit,
                          ContentDetailsScreenState>(
                        builder: (context, state) {
                          if (state is LoadingRecommendedContent) {
                            return Container(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(8),
                                        height: 150,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(8),
                                        height: 150,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }
                          if (state is ReceivedRecommendContent) {
                            return BaseListingSectionView(
                                type: CategoryType.recommendedContent,
                                title: state.title,
                                items: state.items);
                          }

                          return Container();
                        },
                        buildWhen: (previous, current) {
                          return current is LoadingRecommendedContent ||
                              current is ReceivedRecommendContent;
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            /*Positioned(
              bottom: 150,
              left: 16,
              right: 16,
              child: Visibility(
                visible: isButtonsVisible,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                        visible: !content.isPaid! ||
                            content.isAlreadyPurchased! ||
                            content.isMyContent!,
                        child: ElevatedButton(
                            onPressed: () {
                              */ /*AutoRouter.of(context).push(ContentViewerRoute(
                                  args: ContentViewerScreenArgs(
                                      content.contentUrl!, "")));*/ /*
                              showUnitAds();
                            },
                            child: const Text("View"))),
                    vGap(),
                    Visibility(
                      visible: content.isPaid! &&
                          !content.isAlreadyPurchased! &&
                          !content.isMyContent!,
                      child: OutlinedButton(
                          onPressed: () {
                            */ /*AutoRouter.of(context).push(ContentViewerRoute(
                                args: ContentViewerScreenArgs(
                                    content.contentUrl!, "")));*/ /*
                            showUnitAds();
                          },
                          child: const Text(
                            "Preview",
                            style: TextStyle(color: AppColors.btnTextColor),
                          )),
                    ),
                    vGap(),
                    Visibility(
                        visible: content.isPaid! &&
                            !content.isAlreadyPurchased! &&
                            !content.isMyContent!,
                        child: ElevatedButton(
                            onPressed: () {
                              // todo navigate purchase course screen
                            },
                            child: const Text("Buy"))),
                  ],
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }

  void showUnitAds() {
    UnityAds.load(
      placementId: 'Interstitial_Android',
      onComplete: (placementId) {
        print('Load Complete $placementId');
        UnityAds.showVideoAd(
          placementId: 'Interstitial_Android',
          onStart: (placementId) => print('Video Ad $placementId started'),
          onClick: (placementId) => print('Video Ad $placementId click'),
          onSkipped: (placementId) {
            print('Video Ad $placementId skipped');
            AutoRouter.of(context).push(ContentViewerRoute(
                args: ContentViewerScreenArgs(content.contentData!.contentUrl!,
                    "", content.isPaid == true)));
          },
          onComplete: (placementId) {
            print('Video Ad $placementId completed');
            AutoRouter.of(context).push(ContentViewerRoute(
                args: ContentViewerScreenArgs(content.contentData!.contentUrl!,
                    "", content.isPaid == true)));
          },
          onFailed: (placementId, error, message) =>
              print('Video Ad $placementId failed: $error $message'),
        );
      },
      onFailed: (placementId, error, message) =>
          print('Load Failed $placementId: $error $message'),
    );
  }
}
