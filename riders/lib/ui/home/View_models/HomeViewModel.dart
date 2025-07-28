import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riders/data/repositories/LocationsRepository/LocationRepository.dart';
import 'package:riders/data/services/LocationService/LocationService.dart';
import 'package:riders/data/services/signalr/signalr_service.dart';
import 'package:riders/data/services/storage/storage_service.dart';
import 'package:riders/domain/models/locations/LocationUpdate.dart';

class HomeViewModel extends ChangeNotifier {
  final LocationService _locationService;
  final LocationRepository _locationRepository;
  final SignalRService _signalRService;
  final StorageService _storageService;

  StreamSubscription<Position>? _positionSubscription;
  StreamSubscription? _signalRSubscription;

  final Map<String, Marker> _markers = {};
  Map<String, Marker> get markers => _markers;

  Timer? _debounce;

  CameraPosition? _initialCameraPosition;
  CameraPosition? get initialCameraPosition => _initialCameraPosition;

  HomeViewModel({
    required LocationService locationService,
    required LocationRepository locationRepository,
    required SignalRService signalRService,
    required StorageService storageService,
  }) : _locationService = locationService,
       _locationRepository = locationRepository,
       _signalRService = signalRService,
       _storageService = storageService {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    await _connectToSignalR();
    await _getCurrentLocationAndStartStreaming();
  }

  Future<void> _getCurrentLocationAndStartStreaming() async {
    try {
      final position = await _locationService.getCurrentPosition();
      _updateUserMarker(position);
      _initialCameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 16,
      );
      notifyListeners();

      _positionSubscription = _locationService.getPositionStream().listen((
        position,
      ) {
        _updateUserMarker(position);
        // Enviar atualização para a API
        final locationUpdate = LocationUpdate(
          userId: "currentUserId", // Obtenha o ID do usuário logado
          latitude: position.latitude,
          longitude: position.longitude,
          timestamp: DateTime.now(),
        );
        _locationRepository.updateUserLocation(locationUpdate);
      });
    } catch (e) {
      // Tratar erro (ex: permissão negada)
      print(e);
    }
  }

  Future<void> _connectToSignalR() async {
    String? Token = await _storageService.getAccessToken();
    if (Token == null) {
      throw Exception("Access token is required to connect to SignalR");
    }
    await _signalRService.connect(Token, (locationUpdate) {
      _updateRiderMarker(locationUpdate);
    });
  }

  void _updateUserMarker(Position position) {
    final marker = Marker(
      markerId: const MarkerId('currentUser'),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: const InfoWindow(title: 'Você'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    );
    _markers['currentUser'] = marker;
    notifyListeners(); // Voltamos a usar notifyListeners
  }

  void _updateRiderMarker(LocationUpdate location) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      final riderId = location.userId;
      final newPosition = LatLng(location.latitude, location.longitude);
      final marker = Marker(
        markerId: MarkerId(riderId),
        position: newPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: 'Rider $riderId'),
        anchor: const Offset(0.5, 0.5),
      );

      _markers[riderId] = marker;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _signalRService.disconnect();
    super.dispose();
  }
}
