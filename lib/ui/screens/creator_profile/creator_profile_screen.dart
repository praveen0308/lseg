import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/toolbar_main.dart';
import 'package:lseg/ui/widgets/view_base_listing.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/utils.dart';

import 'creator_profile_screen_cubit.dart';

@RoutePage()
class CreatorProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  final String creatorId;
  final String creatorName;
  final String creatorUsername;

  const CreatorProfileScreen(
      {super.key,
      required this.creatorId,
      required this.creatorName,
      required this.creatorUsername});

  @override
  State<CreatorProfileScreen> createState() => _CreatorProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => CreatorProfileScreenCubit(
            RepositoryProvider.of<UserRepositoryImpl>(context)),
        child: this);
  }
}

class _CreatorProfileScreenState extends State<CreatorProfileScreen>
    with BasePageState {
  final toolbarController = ToolbarController("Username");

  @override
  void initState() {
    toolbarController.setTitle(widget.creatorUsername);
    BlocProvider.of<CreatorProfileScreenCubit>(context).fetchCreatorProfile(widget.creatorId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      toolbarController: toolbarController,
      pagePadding: const EdgeInsets.all(0),
      body: BlocConsumer<CreatorProfileScreenCubit, CreatorProfileScreenState>(
        listener: (context, state) {
          showLoading(state is LoadingCreatorProfile);
        },
        builder: (context, state) {
          if (state is LoadProfileFailed) {
            return Center(
              child: Column(
                children: [
                  const Icon(Icons.error),
                  Text(state.msg),
                ],
              ),
            );
          }
          if (state is ReceivedCreatorProfile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 125,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [AppColors.greyLight, AppColors.greyLightest],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(state.user.profileUrl!),
                      ),
                      hGap(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.user.name ?? "Creator Name",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            state.user.bio ?? "Bio",
                          ),
                          Text(
                            state.user.website ?? "Website",
                          )
                        ],
                      )
                    ],
                  ),
                ),
                vGap(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: label("Content By Creator"),
                ),
                state.contents.isEmpty
                    ? const Center(
                        child: Column(
                          children: [
                            Icon(Icons.hourglass_empty),
                            Text("No courses uploaded by creator")
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.689,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 16),
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
                      )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
