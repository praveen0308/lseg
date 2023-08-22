import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/res/res.dart';
import 'package:lseg/routes/route_imports.gr.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AutoRouter.of(context).push(CategoryContentRoute(categoryModel: categoryModel));
      },
      child: Container(
        width: 150,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.greyLightest,
          border: Border.all(color: AppColors.greyLight),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // categoryModel.icon!=null ? Image.network(categoryModel.icon!,height: 80,width: 80,) : const Icon(Icons.delete_outline,size: 80,),
            const SizedBox(height: 16,),
            Text(categoryModel.name ?? "",textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
