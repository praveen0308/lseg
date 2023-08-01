import 'package:flutter/material.dart';

class VisitCountDataView extends StatelessWidget {
  final int count;
  const VisitCountDataView({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.remove_red_eye_outlined),
        const SizedBox(width: 8,),
        Text("$count"),
      ],
    );
  }
}
