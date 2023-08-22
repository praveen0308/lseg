import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_page.dart';
import 'package:lseg/ui/screens/registration/registration_screen_cubit.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:search_choices/search_choices.dart';

class FinalStepPage extends StatefulWidget {
  const FinalStepPage({super.key});

  @override
  State<FinalStepPage> createState() => _FinalStepPageState();
}

class _FinalStepPageState extends State<FinalStepPage> with BasePageState{
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
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationScreenCubit, RegistrationScreenState>(
      listener: (context, state) {
        if(state is ValidateFinalStepPage){
          if(_finalStepPageFromKey.currentState!.validate()){
            BlocProvider.of<RegistrationScreenCubit>(context).submitFinalData(
              bio: _bioController.text,
              occupation: selectedOccupation,
              school: selectedUniversity,
              course: selectedCourse,
              paymentDetails: _paymentDetailsController.text
            );
          }
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _finalStepPageFromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                AppStrings.finalStep,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
              ),
              TextInputFieldView(
                label: AppStrings.bio,
                textEditingController: _bioController,
                isRequired: true,
                validator:
                    ValidationBuilder().minLength(10).maxLength(50).build(),
              ),
              /*TextInputFieldView(
                  label: AppStrings.occupation,
                  textEditingController: _occupationController,
                  isRequired: true,
                validator:
                ValidationBuilder().minLength(1,"Occupation can't be empty!!").build(),),*/
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
            ],
          ),
        ),
      ),
    );
  }
}
