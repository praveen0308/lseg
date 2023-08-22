import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lseg/local/local.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/widgets/widgets.dart';

import '../registration_screen_cubit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with BasePageState {
  final _userNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _dropdownFieldViewController = DropdownFieldViewController();
  var selectedImageUrl = "";
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  @override
  void initState() {
    _dropdownFieldViewController.setDropdownItems(genderItems);
    super.initState();
  }
  late String selectedValue;
  String? profileImageUrl;
  String? localProfileUrl;
  late DateTime dob;

  final _welcomePageFromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationScreenCubit, RegistrationScreenState>(
      listener: (context, state) {
        if (state is ValidateWelcomePage) {
          if (_welcomePageFromKey.currentState!.validate()) {
            BlocProvider.of<RegistrationScreenCubit>(context).submitWelcomeData(
                profileImage: profileImageUrl,
                localImage: localProfileUrl,
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
                    localProfileUrl= localUrl;
                  },
                ),
              ),
              TextInputFieldView(
                label: AppStrings.userName,
                textEditingController: _userNameController,
                isRequired: true,
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
