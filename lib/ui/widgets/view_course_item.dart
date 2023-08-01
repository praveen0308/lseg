import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lseg/routes/route_imports.gr.dart';

class CourseItemView extends StatelessWidget {
  const CourseItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AutoRouter.of(context).push(const ContentDetailsRoute());
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 150,
        height: 192,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(
                "https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80",
                height: 140.0,
                width: 140.0,
              ),
            ),
            Text("Title",style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w700,

            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Praveen Yadav",style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,

                )),
                Text("FREE",style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,

                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
