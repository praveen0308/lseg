import 'package:flutter/material.dart';

class RatingDataView extends StatelessWidget {
  final double rating;
  final int count;
  const RatingDataView({super.key, required this.rating, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_outline_rounded),
        Text("$rating"),
        Text("($count)"),
      ],
    );
  }
}
