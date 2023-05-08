import 'package:dart_chromecast/casting/queue_item.dart';

class QueueData {
  QueueData({
    required this.items,
    this.startIndex,
    this.currentTime,
  });

  List<QueueItem>? items;
  int? startIndex;
  double? currentTime;

  QueueData.fromJson(Map<String, dynamic> json) {
    items = json['items'].map((e) => QueueItem.fromJson(e));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = 'QUEUE_LOAD';
    if (startIndex != null) _data['startIndex'] = startIndex;
    if (currentTime != null) _data['currentTime'] = currentTime;
    _data['items'] = items?.map((e) => e.toJson()).toList();
    return _data;
  }

  Map<String, dynamic> toJsonWithoutType() {
    final _data = <String, dynamic>{};

    if (startIndex != null) _data['startIndex'] = startIndex;
    _data['items'] = items?.map((e) => e.toJson()).toList();
    return _data;
  }
}
