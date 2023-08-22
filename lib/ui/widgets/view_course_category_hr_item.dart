import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CourseCategoryHrItemView extends StatelessWidget {

  const CourseCategoryHrItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Trending",style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 25,width: 100,child: ElevatedButton(onPressed: (){}, child: Text("See All",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),))

          ],
        ),
        const SizedBox(height: 16,),
        SizedBox(
          height: 200,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [

            ],
          ),
        )

      ],
    );
  }
}
