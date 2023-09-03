import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lseg/domain/models/rank.dart';
import 'package:lseg/res/assets.dart';
import 'package:lseg/res/colors.dart';

class LeaderBoardItemView extends StatelessWidget {
  final int rank;
  final String name;
  final num amount;

  LeaderBoardItemView({super.key, required this.rank, required this.name, required this.amount});

  Widget getLeading() {
    switch (rank) {
      case 1:
        {
          return Image.asset(AppImages.icFirstWinner);
        }
      case 2:
        {
          return Image.asset(AppImages.icSecondWinner);
        }
      case 3:
        {
          return Image.asset(AppImages.icThirdWinner);
        }

      default:
        {
          return SizedBox(
              width: 30,
              child: Center(
                  child: Text(
                rank.toString(),
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                ),
              )));
        }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.primary),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          getLeading(),
          const Divider(
            indent: 8,
            endIndent: 8,
            thickness: 2,
            color: Colors.black,
            height: double.maxFinite,
          ),
          Expanded(
              child: Text(
            name.toString(),
            style:
                GoogleFonts.dmSans(fontWeight: FontWeight.w700, fontSize: 20),
          )),
          const Divider(
            indent: 8,
            endIndent: 8,
            thickness: 2,
            color: Colors.black,
            height: double.maxFinite,
          ),
          Text("₹${amount.toStringAsFixed(2)}",
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.bold, fontSize: 16))
        ],
      ),
    );
  }
}
