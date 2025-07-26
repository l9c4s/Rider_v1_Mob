import 'package:flutter/material.dart';
import 'package:riders/routing/app_routes.dart';

class RegisterViewModel extends ChangeNotifier {
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  bool termsAccepted = false;

  // Simulação de cadastro
  Future<String?> register() async {
    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || !termsAccepted) {
      return 'Preencha todos os campos e aceite os termos';
    }
    // Aqui você pode adicionar lógica de cadastro real
    // Se sucesso:
    return AppRoutes.homePath;
    // Se erro, retorne uma mensagem de erro
  }
}