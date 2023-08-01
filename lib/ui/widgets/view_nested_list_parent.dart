import 'package:flutter/material.dart';
import 'package:lseg/ui/widgets/btn_action.dart';
import 'package:lseg/ui/widgets/view_course_item.dart';

class NestedListParentView extends StatelessWidget {
  final String title;
  final Function() onMoreClick;

  const NestedListParentView({super.key, required this.title, required this.onMoreClick});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                ActionButton(title: "See All", onClick:onMoreClick)
              ],
            ),
          ),
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CourseItemView();
              },
              itemCount: 6,
            ),
          )
        ],
      ),
    );
  }
}
