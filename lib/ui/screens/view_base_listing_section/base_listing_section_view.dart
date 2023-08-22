import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:lseg/domain/domain.dart';
import 'package:lseg/routes/routes.dart';
import 'package:lseg/ui/widgets/btn_action.dart';
import 'package:lseg/ui/widgets/view_category.dart';
import 'package:lseg/ui/widgets/view_content_item.dart';

class BaseListingSectionView extends StatefulWidget {
  final CategoryType type;
  final String title;
  final List<dynamic> items;

  const BaseListingSectionView(
      {super.key,
      required this.type,
      required this.title,
      required this.items});

  @override
  State<BaseListingSectionView> createState() => _BaseListingSectionViewState();
}

class _BaseListingSectionViewState extends State<BaseListingSectionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                ActionButton(
                    title: "See All",
                    onClick: () {
                      if (widget.type == CategoryType.recommendedCategories) {
                        AutoRouter.of(context).push(const CategoriesRoute());
                      } else {
                        try {
                          AutoRouter.of(context).push(BaseListingRoute(
                              title: widget.title,
                              type: widget.type,
                              categoryId: (widget.items[0] as ContentModel)
                                  .categoryId));
                        } catch (e) {
                          print(e);
                        }
                      }
                    })
              ],
            ),
          ),
          widget.type == CategoryType.recommendedCategories
              ? SizedBox(
                  height: 180,
                  child: ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryView(categoryModel: widget.items[index]);
                    },
                    itemCount: widget.items.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                  ),
                )
              : SizedBox(
                  height: 240,
                  child: ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ContentItemView(content: widget.items[index]);
                    },
                    itemCount: widget.items.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
