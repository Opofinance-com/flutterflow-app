// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web_socket_channel/io.dart';

Future webSocketReceiver(String url) async {
  // Add your function code here!
  final channel = IOWebSocketChannel.connect(url);

  channel.stream.listen((message) {
    FFAppState().addToWebSocketData(message);
    print('Received: $message');
  }, onDone: () {
    print('WebSocket connection closed');
  }, onError: (error) {
    print('Error: $error');
  });
}
