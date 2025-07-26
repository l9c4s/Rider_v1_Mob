import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riders/data/services/LocationManagerService/LocationManagerService.dart';
import 'package:riders/domain/models/locations/LocationUpdate.dart';

class LocationManagerServiceImpl extends ChangeNotifier
    implements LocationManagerService {
  final Map<String, LocationUpdate> _locations = {};

  @override
  void updateLocation(LocationUpdate update) {
    _locations[update.userId] = update;
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }

  @override
  List<LocationUpdate> getVisibleLocations(LatLngBounds? bounds) {
    if (bounds == null) {
      return _locations.values.toList();
    }
    return _locations.values.where((loc) {
      return bounds.contains(LatLng(loc.latitude, loc.longitude));
    }).toList();
  }

  @override
  LocationUpdate? getLocationByUserId(String userId) => _locations[userId];

  @override
  void clear() {
    _locations.clear();
    notifyListeners(); // Notifica os ouvintes que os dados foram limpos
  }
}
