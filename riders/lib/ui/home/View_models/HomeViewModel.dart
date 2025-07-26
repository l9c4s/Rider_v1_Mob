import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riders/data/services/LocationManagerService/LocationManagerService.dart';
import 'package:riders/data/services/locations/LocationService.dart';
import 'package:riders/data/services/signalr/signalr_service.dart';
import 'package:riders/data/services/storage/storage_service.dart';
import 'package:riders/domain/models/locations/LocationUpdate.dart';
import 'package:riders/utils/command.dart';
import 'package:riders/utils/result.dart';

class HomeViewModel extends ChangeNotifier {
  final SignalRService _signalRService;
  final StorageService _storageService;
  final LocationService _locationService;
  final LocationManagerService _locationManagerService;

  late LatLng? _currentUserPosition;
  LatLng? get currentUserPosition => _currentUserPosition;

  List<LocationUpdate> _visibleFriends = [];
  LatLngBounds? _currentBounds;

  late final Command1<void, LocationUpdate> updateLocationCommand;
  late final Command1<void, LatLng> updateCurrentUserPositionCommand;

  List<LocationUpdate> get visibleFriends => _visibleFriends;

  HomeViewModel(
    this._signalRService,
    this._storageService,
    this._locationService,
    this._locationManagerService,
  ) {
    _locationManagerService.addListener(_onLocationUpdated);

    // Command para localização do usuário atual
    updateCurrentUserPositionCommand = Command1<void, LatLng>((pos) async {
      _currentUserPosition = pos;
      await _locationService.sendLocationToApi(pos);
      return Result.ok(true);
    });

    _locationService.onLocationChanged.listen((pos) {
      updateCurrentUserPositionCommand.execute(pos);
    });

    updateLocationCommand = Command1<void, LocationUpdate>((location) async {
      _locationManagerService.updateLocation(location);
      return Result.ok(true);
    });
  }

  // Callback para quando o LocationManagerService notificar mudanças
  void _onLocationUpdated() {
    _updateVisibleFriends();
  }

  Future<void> init() async {
     _currentUserPosition = await _locationService.getCurrentLocation();
  }


  Future<void> connectToHub() async {
    final token = await _storageService.getAccessToken();
    if (token == null) return;
    await _signalRService.connect(token, (location) {
      updateLocationCommand.execute(location);
    });
  }

  void updateMapBounds(LatLngBounds bounds) {
    _currentBounds = bounds;
    _updateVisibleFriends();
  }

  void _updateVisibleFriends() {
    if (_currentBounds == null) return;

    _visibleFriends = _locationManagerService.getVisibleLocations(
      _currentBounds,
    );
    notifyListeners(); // Notifica a UI (HomeScreen) que o estado mudou
  }

  @override
  void dispose() {
    _locationManagerService.removeListener(_onLocationUpdated);
    super.dispose();
  }

  Future<void> disconnect() async {
    await _signalRService.disconnect();
  }
}
