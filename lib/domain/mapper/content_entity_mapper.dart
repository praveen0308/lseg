import 'package:lseg/data/data.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/domain/mapper/review_entity_mapper.dart';
import 'package:lseg/domain/models/content_model.dart';
import 'package:lseg/local/local.dart';

import 'content_data_entity_mapper.dart';

class ContentEntityMapper {
  final AppStorage _appStorage;
  late String userId;
  late List<String> favourites;
  late List<String> contents;

  ContentEntityMapper(this._appStorage);

  Future<void> initMapper() async {
    userId = await _appStorage.getUserID();
    favourites = await _appStorage.getFavourites();
    contents = await _appStorage.getContents();
  }

  ContentEntity fromDomain(ContentModel domain) {
    return ContentEntity(
      title: domain.title,
      subtitle: domain.subtitle,
      format: domain.format,
      categoryId: domain.categoryId,
      category: domain.category,
      contentId: domain.contentId,
      creatorId: domain.creatorId,
      creator: domain.creator,
      creatorUsername: domain.creatorUsername,
      description: domain.description,
      isPaid: domain.isPaid,
      price: domain.price,
      contentData: ContentDataEntityMapper().fromDomain(domain.contentData),
      reviews: domain.reviews
          ?.map((e) => ReviewEntityMapper().fromDomain(e))
          .toList(),
      addedOn: domain.addedOn,
      updatedOn: domain.updatedOn,
      purchaseCount: domain.purchaseCount,
      views: domain.views,
      watchTime: domain.watchTime,
      isActive: domain.isActive,
    );
  }

  ContentModel toDomain(ContentEntity? entity) {
    var isFavourite = favourites.contains(entity?.contentId);
    var isPurchasedContent = contents.contains(entity?.contentId);
    var isMyContent = userId == entity?.creatorId;


    return ContentModel(
        title: entity?.title,
        subtitle: entity?.subtitle,
        format: entity?.format,
        categoryId: entity?.categoryId,
        category: entity?.category,
        contentId: entity?.contentId,
        creatorId: entity?.creatorId,
        creator: entity?.creator,
        creatorUsername: entity?.creatorUsername,
        description: entity?.description,
        isPaid: entity?.isPaid,
        price: entity?.price,
        contentData: ContentDataEntityMapper().toDomain(entity?.contentData),
        reviews:
        entity?.reviews?.map((e) => ReviewEntityMapper().toDomain(e)).toList(),
        addedOn: entity?.addedOn,
        updatedOn: entity?.updatedOn,
        purchaseCount: entity?.purchaseCount,
        views: entity?.views,
        watchTime: entity?.watchTime,
        isActive: entity?.isActive,
        isFavourite: isFavourite,
        isAlreadyPurchased: isPurchasedContent,
        isMyContent: isMyContent
    );
  }
}
