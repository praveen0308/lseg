import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/screens/edit_profile/pages/contact_info_page.dart';
import 'package:lseg/ui/screens/edit_profile/pages/other_info_page.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/utils.dart';

import 'edit_profile_screen_cubit.dart';
import 'pages/personal_info_page.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
        create: (ctx) => EditProfileScreenCubit(
              RepositoryProvider.of<AuthRepositoryImpl>(context),
              RepositoryProvider.of<UserRepositoryImpl>(context),
            ),
        child: this);
  }
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with BasePageState {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        applyScroll: false,
        enableAppBar: false,
        pagePadding: const EdgeInsets.only(left: 16,top: 8,right: 16,bottom: 0),
        body: BlocConsumer<EditProfileScreenCubit, EditProfileScreenState>(
            listener: (context, state) {
              if(state is ProfileLoaded){
                showLoading(state.status == SubmissionStatus.inProgress);

                if(state.status == SubmissionStatus.success){
                  showToast("Profile Updated Successfully!!!", ToastType.success);
                  AutoRouter.of(context).pop();
                }
              }
            },
            builder: (context, state) {
              return state is LoadingProfile
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is ProfileLoaded
                      ? Builder(builder: (context) {
                          if (state.activePage == 0) {
                            return  PersonalInfoPage(data: state.data,);
                          } else if (state.activePage == 1) {
                            return OtherInfoPage(data: state.data,);
                          } else {
                            return ContactInfoPage(data: state.data,);
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
