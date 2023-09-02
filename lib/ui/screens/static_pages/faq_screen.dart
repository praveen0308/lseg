import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lseg/data/remote/firebase_data_source/config_manager.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/ui/screens/core/base_screen.dart';
import 'package:lseg/ui/widgets/widgets.dart';

@RoutePage()
class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final faqItems = ConfigManager.instance.fetchFaqs();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      toolbarActionEnabled: false,
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
                faqItem(faqItems[index].question!, faqItems[index].answer!)),
          )
        ],
      ),
    );
  }

  Widget faqItem(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(question,style:const TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.black),),
        const SizedBox(height: 8,),
        Container(
          padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Text(answer,textAlign: TextAlign.justify,)),
        /*TextInputFieldView(
          label: question,
          textEditingController: TextEditingController(text: answer),
          lines: 10,
          isEnabled: false,
        ),*/
        const SizedBox(height: 16,),
      ],
    );
  }
}
