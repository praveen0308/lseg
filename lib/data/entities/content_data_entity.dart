class ContentDataEntity {
  ContentDataEntity({
      this.contentPath, 
      this.thumbnailPath, 
      this.audioPath, 
      this.contentUrl, 
      this.thumbnailUrl, 
      this.audioUrl,});

  ContentDataEntity.fromJson(dynamic json) {
    contentPath = json['content_path'];
    thumbnailPath = json['thumbnail_path'];
    audioPath = json['audio_path'];
    contentUrl = json['content_url'];
    thumbnailUrl = json['thumbnail_url'];
    audioUrl = json['audio_url'];
  }
  String? contentPath;
  String? thumbnailPath;
  String? audioPath;
  String? contentUrl;
  String? thumbnailUrl;
  String? audioUrl;
ContentDataEntity copyWith({  String? contentPath,
  String? thumbnailPath,
  String? audioPath,
  String? contentUrl,
  String? thumbnailUrl,
  String? audioUrl,
}) => ContentDataEntity(  contentPath: contentPath ?? this.contentPath,
  thumbnailPath: thumbnailPath ?? this.thumbnailPath,
  audioPath: audioPath ?? this.audioPath,
  contentUrl: contentUrl ?? this.contentUrl,
  thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
  audioUrl: audioUrl ?? this.audioUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content_path'] = contentPath;
    map['thumbnail_path'] = thumbnailPath;
    map['audio_path'] = audioPath;
    map['content_url'] = contentUrl;
    map['thumbnail_url'] = thumbnailUrl;
    map['audio_url'] = audioUrl;
    return map;
  }

}