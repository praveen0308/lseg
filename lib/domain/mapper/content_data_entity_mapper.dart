import 'package:lseg/data/entities/content_data_entity.dart';
import 'package:lseg/domain/domain.dart';

class ContentDataEntityMapper extends Mapper<ContentDataEntity,ContentDataModel>{
  @override
  ContentDataEntity fromDomain(ContentDataModel? domain) {
    return ContentDataEntity(
    contentUrl: domain?.contentUrl,
    thumbnailUrl: domain?.thumbnailUrl,
    audioUrl: domain?.audioUrl,
    contentPath: domain?.contentPath,
    thumbnailPath: domain?.thumbnailPath,
    audioPath: domain?.audioPath,
    );
  }

  @override
  ContentDataModel toDomain(ContentDataEntity? entity) {
    return ContentDataModel(
      contentUrl: entity?.contentUrl,
      thumbnailUrl: entity?.thumbnailUrl,
      audioUrl: entity?.audioUrl,
      contentPath: entity?.contentPath,
      thumbnailPath: entity?.thumbnailPath,
      audioPath: entity?.audioPath,
    );
  }
}