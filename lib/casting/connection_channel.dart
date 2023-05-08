import 'package:dart_chromecast/casting/cast_channel.dart';
import 'package:universal_io/io.dart';

class ConnectionChannel extends CastChannel {
  ConnectionChannel.create(
    Socket? socket, {
    String? sourceId,
    String? destinationId,
    String? namespace,
  }) : super.CreateWithSocket(
          socket,
          sourceId: sourceId ?? 'sender-0',
          destinationId: destinationId ?? 'receiver-0',
          namespace: namespace ?? 'urn:x-cast:com.google.cast.tp.connection',
        );
}
