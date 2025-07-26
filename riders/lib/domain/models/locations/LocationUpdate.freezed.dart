// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LocationUpdate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LocationUpdate _$LocationUpdateFromJson(Map<String, dynamic> json) {
  return _LocationUpdate.fromJson(json);
}

/// @nodoc
mixin _$LocationUpdate {
  @JsonKey(name: 'UserId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Latitude')
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Longitude')
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Timestamp')
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this LocationUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationUpdateCopyWith<LocationUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationUpdateCopyWith<$Res> {
  factory $LocationUpdateCopyWith(
    LocationUpdate value,
    $Res Function(LocationUpdate) then,
  ) = _$LocationUpdateCopyWithImpl<$Res, LocationUpdate>;
  @useResult
  $Res call({
    @JsonKey(name: 'UserId') String userId,
    @JsonKey(name: 'Latitude') double latitude,
    @JsonKey(name: 'Longitude') double longitude,
    @JsonKey(name: 'Timestamp') DateTime timestamp,
  });
}

/// @nodoc
class _$LocationUpdateCopyWithImpl<$Res, $Val extends LocationUpdate>
    implements $LocationUpdateCopyWith<$Res> {
  _$LocationUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationUpdateImplCopyWith<$Res>
    implements $LocationUpdateCopyWith<$Res> {
  factory _$$LocationUpdateImplCopyWith(
    _$LocationUpdateImpl value,
    $Res Function(_$LocationUpdateImpl) then,
  ) = __$$LocationUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'UserId') String userId,
    @JsonKey(name: 'Latitude') double latitude,
    @JsonKey(name: 'Longitude') double longitude,
    @JsonKey(name: 'Timestamp') DateTime timestamp,
  });
}

/// @nodoc
class __$$LocationUpdateImplCopyWithImpl<$Res>
    extends _$LocationUpdateCopyWithImpl<$Res, _$LocationUpdateImpl>
    implements _$$LocationUpdateImplCopyWith<$Res> {
  __$$LocationUpdateImplCopyWithImpl(
    _$LocationUpdateImpl _value,
    $Res Function(_$LocationUpdateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$LocationUpdateImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationUpdateImpl implements _LocationUpdate {
  const _$LocationUpdateImpl({
    @JsonKey(name: 'UserId') required this.userId,
    @JsonKey(name: 'Latitude') required this.latitude,
    @JsonKey(name: 'Longitude') required this.longitude,
    @JsonKey(name: 'Timestamp') required this.timestamp,
  });

  factory _$LocationUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationUpdateImplFromJson(json);

  @override
  @JsonKey(name: 'UserId')
  final String userId;
  @override
  @JsonKey(name: 'Latitude')
  final double latitude;
  @override
  @JsonKey(name: 'Longitude')
  final double longitude;
  @override
  @JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  @override
  String toString() {
    return 'LocationUpdate(userId: $userId, latitude: $latitude, longitude: $longitude, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationUpdateImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, latitude, longitude, timestamp);

  /// Create a copy of LocationUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationUpdateImplCopyWith<_$LocationUpdateImpl> get copyWith =>
      __$$LocationUpdateImplCopyWithImpl<_$LocationUpdateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationUpdateImplToJson(this);
  }
}

abstract class _LocationUpdate implements LocationUpdate {
  const factory _LocationUpdate({
    @JsonKey(name: 'UserId') required final String userId,
    @JsonKey(name: 'Latitude') required final double latitude,
    @JsonKey(name: 'Longitude') required final double longitude,
    @JsonKey(name: 'Timestamp') required final DateTime timestamp,
  }) = _$LocationUpdateImpl;

  factory _LocationUpdate.fromJson(Map<String, dynamic> json) =
      _$LocationUpdateImpl.fromJson;

  @override
  @JsonKey(name: 'UserId')
  String get userId;
  @override
  @JsonKey(name: 'Latitude')
  double get latitude;
  @override
  @JsonKey(name: 'Longitude')
  double get longitude;
  @override
  @JsonKey(name: 'Timestamp')
  DateTime get timestamp;

  /// Create a copy of LocationUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationUpdateImplCopyWith<_$LocationUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
