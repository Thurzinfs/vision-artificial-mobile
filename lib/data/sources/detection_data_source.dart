import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketChannelDataSource {
  final WebSocketChannel channel;

  WebSocketChannelDataSource(this.channel);

  Stream get stream => channel.stream;
}
