import 'package:riders/utils/result.dart';

abstract class AuthRepository {
  Future<Result<bool>> login(String email, String password);
  Future<void> logout();
}