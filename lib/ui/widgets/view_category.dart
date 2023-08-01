import 'package:flutter/material.dart';
import 'package:lseg/res/res.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(8)
      ),
      child: const Center(
        child: Text("Title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
      ),
    );
  }
}
