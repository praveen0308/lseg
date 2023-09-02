import 'package:intl/intl.dart';
import 'package:lseg/domain/models/content_data_model.dart';
import 'package:lseg/domain/models/review_model.dart';

class ContentModel {
  ContentModel({
    this.title,
    this.subtitle,
    this.format,
    this.categoryId,
    this.category,
    this.contentId,
    this.creatorId,
    this.creator,
    this.creatorUsername,
    this.description,
    this.isPaid,
    this.price,
    this.contentData,
    this.reviews,
    this.addedOn,
    this.updatedOn,
    this.purchaseCount,
    this.views,
    this.watchTime,
    this.isActive,
    this.isFavourite,
    this.isMyContent,
    this.isAlreadyPurchased,
  });

  String? title;
  String? subtitle;
  String? format;
  String? categoryId;
  String? category;
  String? contentId;
  String? creatorId;
  String? creator;
  String? creatorUsername;
  String? description;
  bool? isPaid;
  num? price;
  ContentDataModel? contentData;
  List<ReviewModel>? reviews;
  num? addedOn;
  num? updatedOn;
  num? purchaseCount;
  num? views;
  num? watchTime;
  bool? isActive;
  bool? isFavourite;
  bool? isMyContent;
  bool? isAlreadyPurchased;

  ContentModel copyWith({
    String? title,
    String? subtitle,
    String? format,
    String? categoryId,
    String? category,
    String? contentId,
    String? creatorId,
    String? creator,
    String? creatorUsername,
    String? description,
    bool? isPaid,
    num? price,
    ContentDataModel? contentData,
    List<ReviewModel>? reviews,
    num? addedOn,
    num? updatedOn,
    num? purchaseCount,
    num? views,
    num? watchTime,
    bool? isActive,
    bool? isFavourite,
    bool? isMyContent,
    bool? isAlreadyPurchased,
  }) =>
      ContentModel(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        format: format ?? this.format,
        categoryId: categoryId ?? this.categoryId,
        category: category ?? this.category,
        contentId: contentId ?? this.contentId,
        creatorId: creatorId ?? this.creatorId,
        creator: creator ?? this.creator,
        creatorUsername: creatorUsername ?? this.creatorUsername,
        description: description ?? this.description,
        isPaid: isPaid ?? this.isPaid,
        price: price ?? this.price,
        contentData: contentData ?? this.contentData,
        reviews: reviews ?? this.reviews,
        addedOn: addedOn ?? this.addedOn,
        updatedOn: updatedOn ?? this.updatedOn,
        purchaseCount: purchaseCount ?? this.purchaseCount,
        views: views ?? this.views,
        watchTime: watchTime ?? this.watchTime,
        isActive: isActive ?? this.isActive,
        isFavourite: isFavourite ?? this.isFavourite,
        isMyContent: isMyContent ?? this.isMyContent,
        isAlreadyPurchased: isAlreadyPurchased ?? this.isAlreadyPurchased,
      );

  double getAverageRating() {
    if (reviews != null && reviews!.isNotEmpty) {
      return reviews!.map((e) => e.rating!).reduce((a, b) => a + b) /
          reviews!.length;
    } else {
      return 0;
    }
  }

  int getRatingCount() => reviews != null ? reviews!.length : 0;

  String getAddedOn()=>DateFormat("MMM dd, yyyy hh:mm:a").format(DateTime.fromMillisecondsSinceEpoch(addedOn!.toInt()));
  String getUpdatedOn()=>DateFormat("MMM dd, yyyy hh:mm:a").format(DateTime.fromMillisecondsSinceEpoch(updatedOn!.toInt()));
}
