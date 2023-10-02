import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/route_imports.gr.dart';

class ContentItemView extends StatelessWidget {
  final ContentModel content;

  const ContentItemView({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(ContentDetailsRoute(contentModel: content));
      },
      child: Container(
        margin: const EdgeInsets.all(0),
        width: 150,
        height: 215,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyLight),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
              child: Image.network(
                content.contentData!.thumbnailUrl ?? "",
                height: 140.0,
                width: 140.0,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 140,
                    width: 140,
                    color: Colors.black26,
                    alignment: Alignment.center,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error,size: 50,),
                        SizedBox(height: 8),
                        Text(
                          'Image not found!',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(

                    content.title??"",
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(content.creator ?? "",
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,

                        fontWeight: FontWeight.w400,
                      )),
                  Text(content.isPaid! ? "PAID" : "FREE",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ))

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
