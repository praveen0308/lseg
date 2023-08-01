import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lseg/res/res.dart';

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 140.0,viewportFraction: 0.88),

      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const  EdgeInsets.symmetric(horizontal: 5.0,vertical: 8),
                decoration: BoxDecoration(
                    color: AppColors.greyLight,
                  borderRadius: BorderRadius.circular(16),
                  // image: DecorationImage(image:NetworkImage(AppConstants.dummyNetworkImage),fit: BoxFit.cover),
                ),

            );
          },
        );
      }).toList(),
    );
  }
}
