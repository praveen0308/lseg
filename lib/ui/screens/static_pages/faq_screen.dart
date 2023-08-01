import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/text_input.dart';

@RoutePage()
class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final faqItems = AppConstants.faqItems;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        children: [
          const Center(
            child: Text(
              AppStrings.faq,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
            faqItems.length,
            (index) =>
                faqItem(faqItems[index].question, faqItems[index].answer)),
          )
        ],
      ),
    );
  }

  Widget faqItem(String question, String answer) {
    return TextInput(
      label: question,
      textEditingController: TextEditingController(text: answer),
      isEnabled: false,
    );
  }
}
