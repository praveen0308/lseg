import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/edit_profile/edit_profile_screen_cubit.dart';
import 'package:lseg/ui/widgets/view_text_input_field.dart';
import 'package:search_choices/search_choices.dart';

class ContactInfoPage extends StatefulWidget {
  final UserModel data;
  const ContactInfoPage({super.key, required this.data});

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
  late String selectedCountry;
  @override
  void initState() {
    for (var element in AppConstants.countries) {
      _countries.add(DropdownMenuItem(value: element,child: Text(element),));
    }

    _emailController.text = widget.data.email ?? "";
    _phoneController.text = widget.data.phone ?? "";
    _websiteController.text = widget.data.website ?? "";
    selectedCountry = widget.data.country ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _contactInfoFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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

            ElevatedButton(
                onPressed: () {
                  if (_contactInfoFormKey.currentState!.validate()) {
                    context.read<EditProfileScreenCubit>().submitContactInfo(
                      phoneNumber: _phoneController.text,
                      website: _websiteController.text,
                      country: selectedCountry,
                    );
                  }
                },
                child: const Text(AppStrings.submit)),
            vGap(),
            OutlinedButton(
                onPressed: () {
                  BlocProvider.of<EditProfileScreenCubit>(context)
                      .navigateToPage(1);
                },
                child: const Text(AppStrings.back))
          ],
        ),
      ),
    );
  }
}
