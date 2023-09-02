import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lseg/res/res.dart';

class ToolbarController {
  String? title;

  ToolbarController(this.title);

  void setTitle(String title) {
    this.title = title;
  }
}

class MainToolbar extends StatelessWidget {
  final String title;
  final ToolbarController? controller;
  final VoidCallback? onPrimaryActionClick;
  final VoidCallback? onSecondaryClick;

  const MainToolbar(
      {super.key,
      required this.title,
      this.controller,
      this.onPrimaryActionClick,
      this.onSecondaryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.all(color: AppColors.greyBgColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: onPrimaryActionClick,
              child: Image.asset(AppImages.icLogo2,width: 80,height: 40,)),
          Text(
            controller != null ? (controller?.title ?? "") : title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          GestureDetector(
              onTap: onSecondaryClick,
              child: const Icon(Icons.favorite_rounded))
        ],
      ),
    );
  }
}
