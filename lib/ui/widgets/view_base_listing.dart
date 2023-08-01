import 'package:flutter/material.dart';
import 'package:lseg/ui/widgets/widgets.dart';
import 'package:lseg/utils/utils.dart';

class BaseListingView extends StatelessWidget {
  final String title;
  const BaseListingView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ScrollConfiguration(
              behavior: NoGlowBehaviour(),
              child: GridView.builder(

                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.689,crossAxisSpacing: 16),
                shrinkWrap: true,

                scrollDirection: Axis.vertical,
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return CourseItemView();
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
