class ViewCountEntity {
  ViewCountEntity({
      this.contentViewCount,});

  ViewCountEntity.fromJson(dynamic json) {
    if (json['content_view_count'] != null) {
      contentViewCount = [];
      json['content_view_count'].forEach((v) {
        contentViewCount?.add(ContentViewCount.fromJson(v));
      });
    }
  }
  List<ContentViewCount>? contentViewCount;
ViewCountEntity copyWith({  List<ContentViewCount>? contentViewCount,
}) => ViewCountEntity(  contentViewCount: contentViewCount ?? this.contentViewCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (contentViewCount != null) {
      map['content_view_count'] = contentViewCount?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ContentViewCount {

  ContentViewCount({
      this.contentId, 
      this.count,});

  ContentViewCount.fromJson(dynamic json) {
    contentId = json['content_id'];
    count = json['count'];
  }
  String? contentId;
  num? count;
ContentViewCount copyWith({  String? contentId,
  num? count,
}) => ContentViewCount(  contentId: contentId ?? this.contentId,
  count: count ?? this.count,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content_id'] = contentId;
    map['count'] = count;
    return map;
  }

}