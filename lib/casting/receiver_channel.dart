import 'package:dart_chromecast_plus/casting/cast_channel.dart';
import 'package:universal_io/io.dart';

class ReceiverChannel extends CastChannel {
  ReceiverChannel.create(Socket? socket,
      {String? sourceId, String? destinationId})
      : super.CreateWithSocket(socket,
            sourceId: sourceId ?? 'sender-0',
            destinationId: destinationId ?? 'receiver-0',
            namespace: 'urn:x-cast:com.google.cast.receiver');
}
