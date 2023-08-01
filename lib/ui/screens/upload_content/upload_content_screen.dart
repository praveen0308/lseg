import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/upload_content/pages/content_basic_details.dart';
import 'package:lseg/ui/screens/upload_content/pages/content_more_details.dart';
import 'package:lseg/ui/screens/upload_content/upload_content_screen_cubit.dart';
import 'package:lseg/ui/widgets/view_indicator.dart';
import 'package:lseg/utils/util_methods.dart';

@RoutePage()
class UploadContentScreen extends StatefulWidget implements AutoRouteWrapper {
  const UploadContentScreen({super.key});

  @override
  State<UploadContentScreen> createState() => _UploadContentScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => UploadContentScreenCubit(), child: this);
  }
}

class _UploadContentScreenState extends State<UploadContentScreen> with BasePageState{
  final _pageController = PageController();
  var activePage = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      applyScroll: false,
      body: BlocConsumer<UploadContentScreenCubit, UploadContentScreenState>(
        listener: (context, state) {
          showLoading(state is UploadingContent);
          if(state is UploadContentFailure){
            showToast("Something went wrong!!!", ToastType.error);
          }
          if(state is ContentUploadedSuccessfully){
            showToast("Content uploaded successfully !!!", ToastType.success);
            AutoRouter.of(context).pop();
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: const [ContentBasicDetails(), ContentMoreDetails()],
                ),
              ),
              IndicatorView(length: 2, activeIndex: activePage),
              if (activePage == 0)
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        activePage = 1;
                        _pageController.jumpToPage(1);
                      });
                    }, child: const Text(AppStrings.next)),
              if (activePage == 1)
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        activePage = 0;
                        _pageController.jumpToPage(0);
                      });
                    }, child: const Text(AppStrings.back)),
              vGap(),
              if (activePage == 1)
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<UploadContentScreenCubit>(context).uploadContent();
                    }, child: const Text(AppStrings.submit)),
            ],
          );
        },
      ),
    );
  }
}
