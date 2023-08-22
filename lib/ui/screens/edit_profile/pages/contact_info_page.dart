import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/edit_profile/edit_profile_screen_cubit.dart';
import 'package:lseg/ui/widgets/view_text_input_field.dart';
import 'package:search_choices/search_choices.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> with BasePageState {
  final _contactInfoFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();
  // final _cityController = TextEditingController();
  final _countries = List<DropdownMenuItem<String>>.empty(growable: true);
  String? selectedCountry;
  @override
  void initState() {
    BlocProvider.of<EditProfileScreenCubit>(context).fetchProfileCache();
    _countries.addAll(
        AppConstants.countries.map((e) => DropdownMenuItem(child: Text(e))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileScreenCubit, EditProfileScreenState>(
      listener: (context, state) {
        if (state is ReceivedProfileCache) {
          var user = state.user;
          _emailController.text = user.email ?? "";
          _phoneController.text = user.phone ?? "";
          _websiteController.text = user.website ?? "";
          selectedCountry = user.country;
          // _cityController.text = user.city ?? "";
        }
        if (state is ValidateContactInfo) {
          if (_contactInfoFormKey.currentState!.validate()) {
            BlocProvider.of<EditProfileScreenCubit>(context).submitContactInfo(
                phoneNumber: _phoneController.text,
                website: _websiteController.text,
                country: selectedCountry,

            );
          }
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _contactInfoFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                AppStrings.editProfile,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
              ),
              TextInputFieldView(
                label: AppStrings.email,
                textEditingController: _emailController,
                isRequired: false,
                isEnabled: false,
              ),
              TextInputFieldView(
                label: AppStrings.phoneNumber,
                textEditingController: _phoneController,
                isRequired: false,
                validator: (val) {
                  if (val != null && val.isNotEmpty) {
                    ValidationBuilder().minLength(10).maxLength(10).build();
                  } else {
                    null;
                  }
                },
              ),
              TextInputFieldView(
                label: AppStrings.website,
                textEditingController: _websiteController,
                isRequired: false,
                validator: (val) {
                  if (val != null && val.isNotEmpty) {
                    ValidationBuilder().url().build();
                  } else {
                    null;
                  }
                },
              ),
              /*TextInputFieldView(
                  label: AppStrings.city,
                  textEditingController: _cityController,
                  isRequired: false),*/
              label("Country"),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all()),
                child: SearchChoices.single(
                  displayClearIcon: false,
                  underline: "",
                  padding: const EdgeInsets.all(5),
                  items: _countries,
                  value: selectedCountry,
                  hint: "Select one",
                  searchHint: "Select one",
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  },
                  isExpanded: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
