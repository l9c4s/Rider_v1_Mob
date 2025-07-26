import 'package:flutter/material.dart';
import 'package:riders/data/repositories/auth/auth_repository.dart';
import 'package:riders/routing/app_routes.dart';
import 'package:riders/ui/core/Shared_widgets/AppAlertDialog.dart';
import 'package:riders/utils/result.dart';


class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  LoginViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository;

  String email = '';
  String password = '';
  bool rememberMe = false;

  // Simulação de login
  Future<String?> login(BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      await AppAlertDialog.showAlert(
        context,
        title: 'Erro',
        message: 'Preencha todos os campos',
        type: AppAlertType.error,
      );
      return null;
    }

    final result = await _authRepository.login(email, password);

    if (result is Error) {
      await AppAlertDialog.showAlert(
        context,
        title: 'Erro',
        message: result.toString(),
        type: AppAlertType.error,
      );
      return null;
    }
    return AppRoutes.homePath;
  }

  Future<String> register() async{
    return AppRoutes.registerPath;
  }
}
