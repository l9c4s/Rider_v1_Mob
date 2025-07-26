// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LocationUpdate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationUpdateImpl _$$LocationUpdateImplFromJson(Map<String, dynamic> json) =>
    _$LocationUpdateImpl(
      userId: json['UserId'] as String,
      latitude: (json['Latitude'] as num).toDouble(),
      longitude: (json['Longitude'] as num).toDouble(),
      timestamp: DateTime.parse(json['Timestamp'] as String),
    );

Map<String, dynamic> _$$LocationUpdateImplToJson(
  _$LocationUpdateImpl instance,
) => <String, dynamic>{
  'UserId': instance.userId,
  'Latitude': instance.latitude,
  'Longitude': instance.longitude,
  'Timestamp': instance.timestamp.toIso8601String(),
};
