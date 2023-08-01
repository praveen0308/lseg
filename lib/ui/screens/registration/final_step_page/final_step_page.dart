import 'package:flutter/material.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/widgets/text_input.dart';

class FinalStepPage extends StatefulWidget {
  const FinalStepPage({super.key});

  @override
  State<FinalStepPage> createState() => _FinalStepPageState();
}

class _FinalStepPageState extends State<FinalStepPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Text(AppStrings.finalStep,style:TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36
          ),),

          TextInput(label: AppStrings.bio, textEditingController: TextEditingController(),isRequired:true),
          TextInput(label: AppStrings.occupation, textEditingController: TextEditingController(),isRequired:true),
          TextInput(label: AppStrings.school, textEditingController: TextEditingController(),isRequired:true),
          TextInput(label: AppStrings.course, textEditingController: TextEditingController(),isRequired:true),
          TextInput(label: AppStrings.paymentDetails, textEditingController: TextEditingController(),isRequired:true),


        ],
      ),
    );
  }
}
