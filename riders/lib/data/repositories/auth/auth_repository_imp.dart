import 'package:riders/data/repositories/auth/auth_repository.dart';

import 'package:riders/data/services/api/model/api_client.dart';
import 'package:riders/data/services/storage/storage_service.dart';
import 'package:riders/domain/models/auth/AuthResponse.dart';

import 'package:riders/utils/result.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService;
  final StorageService _storageService;

  AuthRepositoryImpl({
    required ApiService apiService,
    required StorageService storageService,
  }) : _apiService = apiService,
       _storageService = storageService;

  @override
  Future<Result<bool>> login(String email, String password) async {
    try {
      final response = await _apiService.post(
        '/Users/LoginUser', // A rota que você especificou
        data: {'Email': email, 'Password': password},
      );

      final authResponse = AuthResponse.fromJson(response.data['data']);

      // Salva os tokens usando o storage service
      await _storageService.saveTokens(
        accessToken: authResponse.accessToken,
        refreshToken: authResponse.refreshToken,
      );

      return Result.ok(true);
    } catch (e) {
      return Result.error(Exception('Login failed: $e'));
    }
  }

  @override
  Future<void> logout() async {
    await _storageService.clearTokens();
  }
}
