import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/edit_profile/edit_profile_screen_cubit.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:search_choices/search_choices.dart';

class OtherInfoPage extends StatefulWidget {
  final UserModel data;
  const OtherInfoPage({super.key, required this.data});

  @override
  State<OtherInfoPage> createState() => _OtherInfoPageState();
}

class _OtherInfoPageState extends State<OtherInfoPage> with BasePageState {
  final _finalStepPageFromKey = GlobalKey<FormState>();


  final occupations = List<DropdownMenuItem<String>>.empty(growable: true);
  var universities = List<DropdownMenuItem<String>>.empty(growable: true);
  final courses = List<DropdownMenuItem<String>>.empty(growable: true);
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _paymentDetailsController =
  TextEditingController();


  String selectedOccupation = "";
  String selectedUniversity = "";
  String selectedCourse = "";

  @override
  void initState() {
    for (var element in AppConstants.occupations) {
      occupations.add(DropdownMenuItem(value: element,child: Text(element),));
    }
    AppConstants.universities().then((rUniversities){
      var items = List<DropdownMenuItem<String>>.empty(growable: true);
      for (var element in rUniversities) {
        items.add(DropdownMenuItem(value: element,child: Text(element),));
      }
      setState(() {
        universities = items;
      });
    });


    for (var element in AppConstants.courses) {
      courses.add(DropdownMenuItem(value: element,child: Text(element),));
    }
    _bioController.text = widget.data.bio ?? "";
    selectedOccupation = widget.data.occupation ?? "";
    selectedUniversity = widget.data.school ?? "";
    selectedCourse = widget.data.course ?? "";
    _paymentDetailsController.text = widget.data.paymentDetails ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _finalStepPageFromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              AppStrings.editProfile,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
            TextInputFieldView(
              label: AppStrings.bio,
              textEditingController: _bioController,
              isRequired: true,
              validator:
                  ValidationBuilder().minLength(10).maxLength(50).build(),
            ),
            label("Occupation"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all()
              ),
              child: SearchChoices.single(
                displayClearIcon: false,
                underline: "",
                padding: const EdgeInsets.all(5),
                items: occupations,
                value: selectedOccupation,
                hint: "Select one",
                searchHint: "Select one",
                onChanged: (value) {
                  setState(() {
                    selectedOccupation = value;
                  });
                },
                isExpanded: true,
              ),
            ),
            label("University"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all()
              ),
              child: SearchChoices.single(
                displayClearIcon: false,
                underline: "",
                padding: const EdgeInsets.all(5),
                items: universities,
                value: selectedUniversity,
                hint: "Select one",
                searchHint: "Select one",
                onChanged: (value) {
                  setState(() {
                    selectedUniversity = value;
                  });
                },
                isExpanded: true,
              ),
            ),
            label("Course"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all()
              ),
              child: SearchChoices.single(
                displayClearIcon: false,
                underline: "",
                padding: const EdgeInsets.all(5),
                items: courses,
                value: selectedCourse,
                hint: "Select one",
                searchHint: "Select one",
                onChanged: (value) {
                  setState(() {
                    selectedCourse = value;
                  });
                },
                isExpanded: true,
              ),
            ),
            TextInputFieldView(
                label: AppStrings.paymentDetails,
                textEditingController: _paymentDetailsController,
                isRequired: false),
            vGap(),
            ElevatedButton(
                onPressed: () {
                  if (_finalStepPageFromKey.currentState!.validate()) {
                    context.read<EditProfileScreenCubit>()
                        .validateOtherInfo(bio: _bioController.text,
                        occupation: selectedOccupation,
                        school: selectedUniversity,
                        course: selectedCourse,
                        paymentDetails: _paymentDetailsController.text);
                  }

                },
                child: const Text(AppStrings.next)),
            vGap(),
            OutlinedButton(
                onPressed: () {
                  BlocProvider.of<EditProfileScreenCubit>(context)
                      .navigateToPage(0);
                },
                child: const Text(AppStrings.back))
          ],
        ),
      ),
    );
  }
}
