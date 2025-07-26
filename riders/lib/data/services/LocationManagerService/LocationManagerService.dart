
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riders/domain/models/locations/LocationUpdate.dart';

abstract class LocationManagerService extends ChangeNotifier {
  void updateLocation(LocationUpdate update);
  List<LocationUpdate> getVisibleLocations(LatLngBounds? bounds);
  LocationUpdate? getLocationByUserId(String userId);
  void clear();
}