import 'dart:convert';

import 'package:riders/domain/models/locations/LocationUpdate.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SignalRService {
  late HubConnection _connection;

  Future<void> connect(String token, void Function(LocationUpdate) onLocation) async {
    _connection = HubConnectionBuilder()
        .withUrl(
          'http://192.168.1.80:5092/locationHub?access_token=$token',
          options: HttpConnectionOptions(
            transport: HttpTransportType.WebSockets,
          ),
        )
        .build();

    _connection.on('ReceiveLocationUpdate', (args) {
      if (args != null && args.isNotEmpty && args[0] is Map<String, dynamic>) {
        final location = LocationUpdate.fromJson(args[0] as Map<String, dynamic>);
        onLocation(location);
      } else if (args != null && args.isNotEmpty && args[0] is String) {
        // Caso venha como String JSON
        final location = LocationUpdate.fromJson(
          Map<String, dynamic>.from(
            jsonDecode(args[0] as String),
          ),
        );
        onLocation(location);
      }
    });

    await _connection.start();
  }

  Future<void> disconnect() async {
    await _connection.stop();
  }
}