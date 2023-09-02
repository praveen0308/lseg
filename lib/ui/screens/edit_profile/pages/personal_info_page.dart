
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/local/local.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/edit_profile/edit_profile_screen_cubit.dart';
import 'package:lseg/ui/widgets/widgets.dart';

class PersonalInfoPage extends StatefulWidget {
  final UserModel data;

   const PersonalInfoPage({super.key, required this.data});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> with BasePageState{
  final _userNameController = TextEditingController();

  final _nameController = TextEditingController();

  final _profileImageController = ProfileImageUploaderViewController();

  final _dropdownFieldViewController = DropdownFieldViewController(items: [
    'Male',
    'Female',
  ]);

  final _dateFieldViewController = DateTextFieldViewController();

  var selectedImageUrl = "";

  late String selectedValue;

  String? profileImageUrl;

  String? localProfileImage;

  late DateTime dob;

  final _welcomePageFromKey = GlobalKey<FormState>();

  @override
  void initState() {
    _profileImageController.profile = widget.data.profileUrl;
    _nameController.text = widget.data.name ?? "";
    _userNameController.text = widget.data.userName ?? "";
    _dateFieldViewController.setDate(widget.data.dob);
    _dropdownFieldViewController.setDropdownValue(widget.data.gender);
    _nameController.text = widget.data.name ?? "";
    selectedValue = widget.data.gender ?? "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _welcomePageFromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              AppStrings.editProfile,
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
              controller: _dateFieldViewController,
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
            vGap(height: 64),
            ElevatedButton(
                onPressed: () {
                  if (_welcomePageFromKey.currentState!.validate()) {
                    context.read<EditProfileScreenCubit>()
                        .validatePersonalInfo(
                        profileImage: profileImageUrl,
                        localImage: localProfileImage,
                        userName: _userNameController.text,
                        name: _nameController.text,
                        dob: dob,
                        gender: selectedValue
                    );
                  }

                },
                child: const Text(AppStrings.next)),
          ],
        ),
      ),
    );
  }
}
