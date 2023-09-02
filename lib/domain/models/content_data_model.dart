class ContentDataModel {
  ContentDataModel({
      this.contentPath, 
      this.thumbnailPath, 
      this.audioPath, 
      this.contentUrl, 
      this.thumbnailUrl, 
      this.audioUrl,});

  String? contentPath;
  String? thumbnailPath;
  String? audioPath;
  String? contentUrl;
  String? thumbnailUrl;
  String? audioUrl;
ContentDataModel copyWith({  String? contentPath,
  String? thumbnailPath,
  String? audioPath,
  String? contentUrl,
  String? thumbnailUrl,
  String? audioUrl,
}) => ContentDataModel(  contentPath: contentPath ?? this.contentPath,
  thumbnailPath: thumbnailPath ?? this.thumbnailPath,
  audioPath: audioPath ?? this.audioPath,
  contentUrl: contentUrl ?? this.contentUrl,
  thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
  audioUrl: audioUrl ?? this.audioUrl,
);


}