import 'package:dart_chromecast/casting/cast_media.dart';

class QueueItem {
  QueueItem({
    this.activeTrackIds,
    this.autoplay = true,
    required this.media,
    required this.orderId,
    this.preloadTime,
    this.startTime,
    this.itemId,
  });
  List<int>? activeTrackIds;
  late final bool? autoplay;
  late final CastMedia media;
  late final int orderId;
  int? itemId;
  double? preloadTime;
  double? startTime;

  QueueItem.fromJson(Map<String, dynamic> json) {
    activeTrackIds = List.castFrom<dynamic, int>(json['activeTrackIds']);
    autoplay = json['autoplay'];
    media = CastMedia.fromJson(json['media']);
    orderId = json['orderId'];
    preloadTime = json['preloadTime'];
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['activeTrackIds'] = activeTrackIds != null ? activeTrackIds : [];
    if (autoplay != null) _data['autoplay'] = autoplay;
    if (itemId != null) _data['itemId'] = itemId;
    _data['media'] = media.toQueueMap();
    _data['orderId'] = orderId;
    if (preloadTime != null) _data['preloadTime'] = preloadTime;
    if (startTime != null) _data['startTime'] = startTime;
    return _data;
  }
}
