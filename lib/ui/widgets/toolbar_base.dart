import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';

class BaseToolbar extends StatelessWidget {
  final String? title;
  final VoidCallback? onPrimaryActionClick;
  final VoidCallback? onSecondaryClick;

  const BaseToolbar(
      {super.key,
      this.title,
      this.onPrimaryActionClick,
      this.onSecondaryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.all(color: AppColors.greyBgColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: (){
                AutoRouter.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_rounded)),
          Text(title ?? ""),
          GestureDetector(
              onTap: onSecondaryClick,
              child: const Icon(Icons.favorite_rounded))
        ],
      ),
    );
  }
}
