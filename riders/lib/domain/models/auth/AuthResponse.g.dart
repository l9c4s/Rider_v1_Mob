// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      accessToken: json['token'] as String,
      expiration: DateTime.parse(json['expiration'] as String),
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.accessToken,
      'expiration': instance.expiration.toIso8601String(),
      'refreshToken': instance.refreshToken,
    };
