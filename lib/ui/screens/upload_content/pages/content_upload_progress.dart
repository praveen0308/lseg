import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/ui/screens/upload_content/upload_content_screen_cubit.dart';
import 'package:lseg/ui/widgets/view_app_loading.dart';

class ContentUploadProgressPage extends StatefulWidget {
  const ContentUploadProgressPage({super.key});

  @override
  State<ContentUploadProgressPage> createState() =>
      _ContentUploadProgressPageState();
}

class _ContentUploadProgressPageState extends State<ContentUploadProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: BlocConsumer<UploadContentScreenCubit, UploadContentScreenState>(
            builder: (context, state) {
              if (state is UploadingContentPdf) {
                return const AppLoadingView(
                  msg: "Uploading PDF...",
                );
              }
              if (state is UploadingContentThumbnail) {
                return const AppLoadingView(msg: "Uploading Thumbnail...");
              }
              if (state is CreatingContent) {
                return const AppLoadingView(msg: "Creating content...");
              }
              return Container();
            },
            listener: (context, state) {}),
      ),
    );
  }
}
