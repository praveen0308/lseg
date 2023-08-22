import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lseg/local/local.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/edit_profile/edit_profile_screen_cubit.dart';
import 'package:lseg/ui/widgets/widgets.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> with BasePageState{
  final _userNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _profileImageController = ProfileImageUploaderViewController();
  final _dropdownFieldViewController = DropdownFieldViewController();
  final _dateFieldViewController = DateTextFieldViewController();
  var selectedImageUrl = "";
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  late String selectedValue;
  String? profileImageUrl;
  String? localProfileImage;
  late DateTime dob;

  final _welcomePageFromKey = GlobalKey<FormState>();

  @override
  void initState() {
    BlocProvider.of<EditProfileScreenCubit>(context).fetchProfileCache();
    _dropdownFieldViewController.setDropdownItems(genderItems);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileScreenCubit, EditProfileScreenState>(
      listener: (context, state) {
        if (state is ReceivedProfileCache) {
          var user = state.user;
          _profileImageController.profile = user.localProfile;
          _nameController.text = user.name ?? "";
          _userNameController.text = user.userName ?? "";
          _dateFieldViewController.setDate(user.dob);
          _dropdownFieldViewController.setDropdownValue(user.gender);
          _nameController.text = user.name ?? "";
        }
        if (state is ValidatePersonalInfo) {
          if (_welcomePageFromKey.currentState!.validate()) {
            BlocProvider.of<EditProfileScreenCubit>(context).submitPersonalInfo(
                profileImage: profileImageUrl,
                localImage: localProfileImage,
                userName: _userNameController.text,
                name: _nameController.text,
                dob: dob,
                gender: selectedValue);
          }
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _welcomePageFromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                AppStrings.welcome,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
                textAlign: TextAlign.center,
              ),
              const Text(
                AppStrings.profileInstruction,
                textAlign: TextAlign.center,
              ),
              vGap(),
              BlocProvider(
                create: (context) => ProfileImageUploaderCubit(
                    RepositoryProvider.of<AppStorage>(context)),
                child: ProfileImageUploaderView(
                  onProfileImageUploaded: (String url,String localUrl) {
                    profileImageUrl = url;
                    localProfileImage = localUrl;

                  },
                ),
              ),
              TextInputFieldView(
                label: AppStrings.userName,
                textEditingController: _userNameController,
                isRequired: true,
                isEnabled: false,
                validator: ValidationBuilder().minLength(3).build(),
              ),
              TextInputFieldView(
                label: AppStrings.name,
                textEditingController: _nameController,
                isRequired: true,
                validator: ValidationBuilder().minLength(3).build(),
              ),
              DateTextFieldView(
                  label: "Date of birth",
                  isRequired: true,
                  onDateSelected: (date) {
                    dob = date;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter date of birth';
                    }
                    return null;
                  }),
              DropdownFieldView(
                controller: _dropdownFieldViewController,
                label: "Gender",

                validator: (value) {
                  if (value == null) {
                    return 'Please select gender.';
                  }
                  return null;
                },
                onChanged: (value) {
                  selectedValue = value.toString();
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
