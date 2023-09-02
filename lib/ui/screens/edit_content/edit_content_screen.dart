import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/edit_content/pages/basic_details_form.dart';
import 'package:lseg/ui/screens/edit_content/pages/more_details_form.dart';
import 'package:lseg/utils/utils.dart';

import 'edit_content_screen_cubit.dart';
import 'pages/update_progress_form.dart';

@RoutePage()
class EditContentScreen extends StatefulWidget implements AutoRouteWrapper{
  final ContentModel content;
  const EditContentScreen({super.key, required this.content});

  @override
  State<EditContentScreen> createState() => _EditContentScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (ctx) => EditContentScreenCubit(
      RepositoryProvider.of<ContentRepositoryImpl>(context),
      RepositoryProvider.of<CategoryRepositoryImpl>(context)
    ), child: this);
  }
}

class _EditContentScreenState extends State<EditContentScreen> with BasePageState{
  @override
  void initState() {
    context.read<EditContentScreenCubit>().initContentData(widget.content);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        applyScroll: false,
        enableAppBar: true,
        toolbarActionEnabled: false,
        title: "Edit Content",
        pagePadding: const EdgeInsets.only(left: 16,top: 8,right: 16,bottom: 0),
        body: BlocConsumer<EditContentScreenCubit, EditContentScreenState>(
          listener: (context, state) {
            if(state is ContentLoaded){
              if(state.status == SubmissionStatus.inProgress){
                context.read<EditContentScreenCubit>().updateContent();
              }
            }
          },
          builder: (context, state) {
            return state is LoadingContent
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : state is ContentLoaded
                ? Builder(builder: (context) {
              if (state.activePage == 0) {
                return  BasicDetailsForm(data: state.data,categories: state.categories,);
              } else if (state.activePage == 1) {
                return MoreDetailsForm(data: state.data,pdf: state.pdf,thumbnail: state.thumbnail,);
              } else {
                return UpdateProgressForm(status: state.status,results: state.results ?? [],);
              }
            })
                : const Column(
              children: [
                Icon(Icons.error),
                Text("Something went wrong!!!")
              ],
            );
          },
        ));
  }
}
