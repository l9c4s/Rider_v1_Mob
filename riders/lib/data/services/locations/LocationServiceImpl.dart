import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riders/data/services/locations/LocationService.dart';

class LocationServiceImpl implements LocationService {
  final _controller = StreamController<LatLng>.broadcast();

  LocationServiceImpl() {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((pos) {
      _controller.add(LatLng(pos.latitude, pos.longitude));
    });
  }

  @override
  Stream<LatLng> get onLocationChanged => _controller.stream;

  @override
  Future<LatLng> getCurrentLocation() async {
    final pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return LatLng(pos.latitude, pos.longitude);
  }

  @override
  Future<void> sendLocationToApi(LatLng position) async {
    // Implemente aqui a chamada para sua API
    // Exemplo:
    // await dio.post('sua_url', data: {...});
  }
   @override
  Future<bool> checkLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return false;
    }
    if (permission == LocationPermission.deniedForever) return false;
    return true;
  }
}