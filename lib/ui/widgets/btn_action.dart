import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lseg/res/res.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  const ActionButton({super.key, required this.title,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(

        padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(25)),
        child: Center(
          child:  Text(
            title,
            style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.btnTextColor),
          ),
        ),
      ),
    );
  }
}
