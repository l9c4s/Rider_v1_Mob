
import 'package:riders/domain/models/locations/LocationUpdate.dart';
import 'package:riders/utils/result.dart';

abstract class LocationRepository {
  Future<Result<void>> updateUserLocation(LocationUpdate locationUpdate);
}