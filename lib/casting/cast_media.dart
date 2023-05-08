import 'package:dart_chromecast_plus/casting/track.dart';

import 'text_track_style.dart';

class CastMedia {
  late final String? contentId;
  String? title;
  String? subtitle;
  bool autoPlay = true;
  late double position;
  late double playbackRate;
  late String contentType;
  List<String>? images;
  late String streamType;
  TextTrackStyle? textTrackStyle;
  List<Track>? tracks;
  Map<String, dynamic>? customData;

  CastMedia({
    this.contentId,
    this.title,
    this.subtitle,
    this.autoPlay = true,
    this.position = 0.0,
    this.playbackRate = 1.0,
    this.contentType = 'video/mp4',
    this.images,
    this.tracks,
    this.textTrackStyle,
    this.streamType = 'BUFFERED',
    this.customData,
  }) {
    if (null == images) {
      images = [];
    }
  }

  CastMedia.fromJson(Map<String, dynamic> json) {
    contentId = json['contentId'];
    title = json['title'];
    subtitle = json['subtitle'];
    autoPlay = json['autoPlay'];
    position = json['position'];
    playbackRate = json['playbackRate'];
    contentType = json['contentType'];
    customData = json['customData'];
    images = json['images'];
    textTrackStyle = TextTrackStyle.fromJson(json['textTrackStyle']);
    tracks = json['tracks'].map((e) => Track.fromJson(e)).toList();
    streamType = json['streamType'];
  }

  Map toChromeCastMap() {
    return {
      'type': 'LOAD',
      'autoPlay': autoPlay,
      'currentTime': position,
      'playbackRate': playbackRate,
      'activeTracks': [],
      'media': {
        'contentId': contentId,
        'contentType': contentType,
        'streamType': streamType,
        'textTrackStyle': textTrackStyle?.toJson(),
        'tracks': tracks?.map((e) => e.toChromeCastMap()).toList(),
        'metadata': {
          'metadataType': 0,
          'images': images?.map((image) => {'url': image}).toList(),
          'title': title,
          'subtitle': subtitle,
        },
      }
    };
  }

  Map toQueueMap() {
    return {
      'contentId': contentId,
      'contentType': contentType,
      'streamType': streamType,
      'customData': customData,
      'textTrackStyle': textTrackStyle?.toJson(),
      'tracks': tracks?.map((e) => e.toChromeCastMap()).toList(),
      'metadata': {
        'metadataType': 0,
        'images': images?.map((image) => {'url': image}).toList(),
        'title': title,
        'subtitle': subtitle,
      },
    };
  }
}
