import 'package:freezed_annotation/freezed_annotation.dart';

part 'LocationUpdate.freezed.dart';
part 'LocationUpdate.g.dart';

@freezed
class LocationUpdate with _$LocationUpdate {
  const factory LocationUpdate({
    @JsonKey(name: 'UserId') required String userId,
    @JsonKey(name: 'Latitude') required double latitude,
    @JsonKey(name: 'Longitude') required double longitude,
    @JsonKey(name: 'Timestamp') required DateTime timestamp,
  }) = _LocationUpdate;

  factory LocationUpdate.fromJson(Map<String, dynamic> json) =>
      _$LocationUpdateFromJson(json);
}