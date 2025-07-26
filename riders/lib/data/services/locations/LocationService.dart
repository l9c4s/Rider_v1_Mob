import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationService {
  Stream<LatLng> get onLocationChanged;
  Future<LatLng> getCurrentLocation();
  Future<void> sendLocationToApi(LatLng position);

  Future<bool> checkLocationPermission();
}