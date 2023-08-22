import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/widgets/btn_action.dart';
import 'package:lseg/ui/widgets/data_widget/profile_image_uploader/profile_image_uploader_cubit.dart';
import 'package:lseg/ui/widgets/image_form_field.dart';
import 'package:lseg/utils/utils.dart';

class ProfileImageUploaderViewController{
  String? profile;

  void setProfile(String file){
    profile = file;
  }
}

class ProfileImageUploaderView extends StatefulWidget {
  final Function(String url,String localUrl) onProfileImageUploaded;
  final ProfileImageUploaderViewController? controller;
  const ProfileImageUploaderView({super.key, required this.onProfileImageUploaded, this.controller});

  @override
  State<ProfileImageUploaderView> createState() =>
      _ProfileImageUploaderViewState();
}

class _ProfileImageUploaderViewState extends State<ProfileImageUploaderView> {
  File? imageFile;
  bool uploadBtnVisibility = false;
  bool isUploadBtnEnabled = false;

  @override
  void initState() {
    if(widget.controller?.profile != null){

      imageFile = File(widget.controller!.profile!);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileImageUploaderCubit, ProfileImageUploaderState>(
      listener: (context, state) {
        if (state is ProfileImageAvailable) {
          imageFile = state.image;
          uploadBtnVisibility = true;
          isUploadBtnEnabled = true;
        }
        if (state is ImageUploadedSuccessfully) {
          uploadBtnVisibility = false;
          isUploadBtnEnabled = false;
          showToast("Image uploaded successfully!!!",ToastType.success);
          widget.onProfileImageUploaded(state.url,state.localUrl);
        }
      },
      child: BlocBuilder<ProfileImageUploaderCubit, ProfileImageUploaderState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomImageFormField(
                validator: (val) {
                  if (val == null) "Select profile image!!!";
                  return null;
                },
                onChanged: (file) {
                  BlocProvider.of<ProfileImageUploaderCubit>(context)
                      .selectImage(file);
                },
                customView: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.greyLight,
                      backgroundImage:
                          imageFile != null ? FileImage(imageFile!) : null,
                      child: imageFile == null
                          ? SvgPicture.asset(AppImages.icCamera)
                          : null,
                    ),
                    BlocBuilder<ProfileImageUploaderCubit,
                        ProfileImageUploaderState>(
                      builder: (context, state) {
                        if (state is UploadStarted) {
                          return const SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator());
                        }
                        if (state is ProfileImageUploading) {
                          return SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator(
                                value: state.progress,
                              ));
                        }
                        return const SizedBox(height: 54, width: 54);
                      },
                      buildWhen: (previous, current) {
                        return current is ProfileImageUploading ||
                            current is UploadStarted;
                      },
                    )
                  ],
                ),
              ),
              Visibility(
                  visible: uploadBtnVisibility,
                  child: ActionButton(
                    title: "Upload",
                    onClick: () {
                      BlocProvider.of<ProfileImageUploaderCubit>(context)
                          .uploadProfileImage(imageFile!);
                    },
                    isEnabled: isUploadBtnEnabled,
                  ))
            ],
          );
        },
      ),
    );
  }
}
