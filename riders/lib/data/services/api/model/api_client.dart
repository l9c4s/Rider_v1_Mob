import 'package:dio/dio.dart';
import 'package:riders/data/services/storage/storage_service.dart';

class ApiService {
  final Dio _dio;
  final StorageService _storageService;

  ApiService({required StorageService storageService})
      : _storageService = storageService,
        _dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.1.80:5092', // A URL 
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storageService.getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options); // Continua com a requisição
        },
      ),
    );
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response<T>> get<T>(String path) async {
    return await _dio.get<T>(path);
  }

  Future<Response<T>> post<T>(String path, {dynamic data}) async {
    return await _dio.post<T>(path, data: data);
  }
}