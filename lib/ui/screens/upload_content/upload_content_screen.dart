import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/upload_content/pages/content_basic_details.dart';
import 'package:lseg/ui/screens/upload_content/pages/content_more_details.dart';
import 'package:lseg/ui/screens/upload_content/pages/content_upload_progress.dart';
import 'package:lseg/ui/screens/upload_content/upload_content_screen_cubit.dart';
import 'package:lseg/utils/util_methods.dart';

@RoutePage()
class UploadContentScreen extends StatefulWidget implements AutoRouteWrapper {
  const UploadContentScreen({super.key});

  @override
  State<UploadContentScreen> createState() => _UploadContentScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => UploadContentScreenCubit(
            RepositoryProvider.of<ContentRepositoryImpl>(context),
            RepositoryProvider.of<CategoryRepositoryImpl>(context),
        ),
        child: this);
  }
}

class _UploadContentScreenState extends State<UploadContentScreen>
    with BasePageState {
  final _pageController = PageController();
  var activePage = 0;

  @override
  void initState() {
    BlocProvider.of<UploadContentScreenCubit>(context).initContentData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      applyScroll: false,
      toolbarActionEnabled: false,
      title: "Upload Content",
      pagePadding: const EdgeInsets.symmetric(horizontal: 16),
      body: BlocConsumer<UploadContentScreenCubit, UploadContentScreenState>(
        listener: (context, state) {
          showLoading(state is LoadingCategories);
          if (state is UploadContentScreenInitial) {
            _pageController.jumpToPage(0);
          }
          if (state is BasicDetailsSubmitted) {
            _pageController.jumpToPage(1);
          }
          if (state is StartContentUpload) {
            _pageController.jumpToPage(2);
            BlocProvider.of<UploadContentScreenCubit>(context)
                .uploadContent();
          }

          if (state is ContentUploadedSuccessfully) {
            showToast("Content uploaded successfully !!!", ToastType.success);
            BlocProvider.of<UploadContentScreenCubit>(context)
                .uploadContentPdf();
          }
          if (state is ContentPdfUploadedSuccessfully) {
            showToast("PDF uploaded successfully !!!", ToastType.success);
            BlocProvider.of<UploadContentScreenCubit>(context)
                .uploadContentThumbnail();
          }
          if (state is ContentThumbnailUploadedSuccessfully) {
            showToast("Thumbnail uploaded successfully !!!", ToastType.success);
            AutoRouter.of(context).pop();
          }
          if (state is UploadContentFailure) {
            showToast("Something went wrong!!!", ToastType.error);
          }
          if (state is ContentPdfUploadFailed) {
            showToast("Pdf upload failed!!!", ToastType.error);
          }

          if (state is ContentThumbnailUploadFailed) {
            showToast("Thumbnail upload failed!!!", ToastType.error);
          }

        },
        builder: (context, state) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              BlocProvider.value(
                value: context.read<UploadContentScreenCubit>(),
                child: const ContentBasicDetails(),
              ),
              BlocProvider.value(
                value: context.read<UploadContentScreenCubit>(),
                child: const ContentMoreDetails(),
              ),
              BlocProvider.value(
                value: context.read<UploadContentScreenCubit>(),
                child: const ContentUploadProgressPage(),
              )
            ],
          );
        },
      ),
    );
  }
}
