import 'package:freezed_annotation/freezed_annotation.dart';

part 'AuthResponse.freezed.dart';
part 'AuthResponse.g.dart';


@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({ 
    @JsonKey(name: 'token') required String accessToken,
    @JsonKey(name: 'expiration') required DateTime expiration,
    @JsonKey(name: 'refreshToken') required String refreshToken,
  }) = _AuthResponse; 

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}