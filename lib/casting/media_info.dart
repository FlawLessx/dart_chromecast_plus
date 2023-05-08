class Media {
  Media({
    required this.contentId,
    required this.contentType,
    required this.streamType,
    required this.metadata,
    required this.mediaCategory,
  });
  late final String contentId;
  late final String contentType;
  late final String streamType;
  late final Metadata metadata;
  late final String mediaCategory;

  Media.fromJson(Map<String, dynamic> json) {
    contentId = json['contentId'];
    contentType = json['contentType'];
    streamType = json['streamType'];
    metadata = Metadata.fromJson(json['metadata']);
    mediaCategory = json['mediaCategory'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['contentId'] = contentId;
    _data['contentType'] = contentType;
    _data['streamType'] = streamType;
    _data['metadata'] = metadata.toJson();
    _data['mediaCategory'] = mediaCategory;
    return _data;
  }
}

class Metadata {
  Metadata({
    required this.metadataType,
    required this.images,
    required this.title,
  });
  late final int metadataType;
  late final List<String> images;
  late final String title;

  Metadata.fromJson(Map<String, dynamic> json) {
    metadataType = json['metadataType'];
    images = List.castFrom<dynamic, String>(json['images']);
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['metadataType'] = metadataType;
    _data['images'] = images;
    _data['title'] = title;
    return _data;
  }
}
