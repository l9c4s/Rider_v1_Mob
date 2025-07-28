

import 'package:riders/data/repositories/LocationsRepository/LocationRepository.dart';
import 'package:riders/data/services/api/model/api_client.dart';
import 'package:riders/domain/models/locations/LocationUpdate.dart';
import 'package:riders/utils/result.dart';

class LocationRepositoryImpl implements LocationRepository {
  final ApiService _apiService;

  LocationRepositoryImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Result<void>> updateUserLocation(LocationUpdate locationUpdate) async {
    try {
      // Supondo que você tenha um endpoint "locations/update"
      await _apiService.post('/Locations/SendLocations', data: locationUpdate);
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
