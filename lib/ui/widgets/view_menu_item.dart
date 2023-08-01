import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lseg/res/res.dart';

class MenuItemView extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  const MenuItemView({super.key, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(

        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        margin: const EdgeInsets.all(8),
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.primary),
            borderRadius: BorderRadius.circular(5)

        ),
        child: Text(title,style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w700,
            fontSize: 20
        ),),
      ),
    );
  }
}
