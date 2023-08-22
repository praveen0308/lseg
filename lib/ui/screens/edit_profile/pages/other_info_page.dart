import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/edit_profile/edit_profile_screen_cubit.dart';
import 'package:lseg/ui/widgets/widgets.dart';

class OtherInfoPage extends StatefulWidget {
  const OtherInfoPage({super.key});

  @override
  State<OtherInfoPage> createState() => _OtherInfoPageState();
}

class _OtherInfoPageState extends State<OtherInfoPage> {
  final _finalStepPageFromKey = GlobalKey<FormState>();

  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _paymentDetailsController =
  TextEditingController();

  @override
  void initState() {
    BlocProvider.of<EditProfileScreenCubit>(context).fetchProfileCache();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileScreenCubit, EditProfileScreenState>(
      listener: (context, state) {
        if (state is ReceivedProfileCache) {
          var user = state.user;
          _bioController.text = user.bio ?? "";
          _occupationController.text = user.occupation ?? "";
          _schoolController.text = user.school ?? "";
          _courseController.text = user.course ?? "";
          _paymentDetailsController.text = user.paymentDetails ?? "";
        }
        if(state is ValidateOtherInfo){
          if(_finalStepPageFromKey.currentState!.validate()){
            BlocProvider.of<EditProfileScreenCubit>(context).submitOtherInfo(
                bio: _bioController.text,
                occupation: _occupationController.text,
                school: _schoolController.text,
                course: _courseController.text,
                paymentDetails: _paymentDetailsController.text
            );
          }
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: _finalStepPageFromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              TextInputFieldView(
                label: AppStrings.occupation,
                textEditingController: _occupationController,
                isRequired: true,
                validator:
                ValidationBuilder().minLength(1,"Occupation can't be empty!!").build(),),
              TextInputFieldView(
                  label: AppStrings.school,
                  textEditingController: _schoolController,
                  isRequired: false),
              TextInputFieldView(
                  label: AppStrings.course,
                  textEditingController: _courseController,
                  isRequired: false),
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
