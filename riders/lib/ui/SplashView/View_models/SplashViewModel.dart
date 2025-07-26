import 'package:flutter/foundation.dart';
import 'package:riders/data/services/storage/storage_service.dart';
import 'package:riders/routing/app_routes.dart';

class SplashViewModel extends ChangeNotifier {
  final StorageService _storageService;

  SplashViewModel({required StorageService storageService})
      : _storageService = storageService;

  /// Verifica o token e decide a próxima rota.
  /// Adiciona um delay para a animação poder ser exibida.
  Future<String> decideNextRoute() async {
    // Delay para garantir que a animação seja visível
    await Future.delayed(const Duration(seconds: 10));

    final token = await _storageService.getAccessToken();

    if (token != null && token.isNotEmpty) {
      // Se tem token, vai para a home
      return AppRoutes.homePath;
    } else {
      // Se não tem, vai para o login
      return AppRoutes.loginPath;
    }
  }
}