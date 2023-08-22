import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lseg/res/res.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final bool isEnabled;

  const ActionButton(
      {super.key,
      required this.title,
      required this.onClick,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onClick : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        decoration: BoxDecoration(
            color: isEnabled ?  AppColors.primary :  AppColors.greyBefore, borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.btnTextColor),
          ),
        ),
      ),
    );
  }
}
