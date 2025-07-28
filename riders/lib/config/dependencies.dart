import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:riders/data/repositories/LocationsRepository/LocationRepository.dart';
import 'package:riders/data/repositories/LocationsRepository/LocationRepositoryImpl.dart';
import 'package:riders/data/repositories/auth/auth_repository.dart';
import 'package:riders/data/repositories/auth/auth_repository_imp.dart';
import 'package:riders/data/services/LocationService/LocationService.dart';
import 'package:riders/data/services/LocationService/LocationServiceImpl.dart';
import 'package:riders/data/services/api/model/api_client.dart';
import 'package:riders/data/services/signalr/signalr_service.dart';
import 'package:riders/data/services/storage/SecureStorageServiceImpl.dart';
import 'package:riders/data/services/storage/storage_service.dart';
import 'package:riders/ui/SplashView/View_models/SplashViewModel.dart';
import 'package:riders/ui/home/View_models/HomeViewModel.dart';

List<SingleChildWidget> get providers {
  return [
    // --- SERVIÇOS ---
    Provider<StorageService>(create: (_) => SecureStorageServiceImpl()),
    Provider<ApiService>(create: (context) =>ApiService(storageService: context.read<StorageService>())),
    Provider<SignalRService>(create: (_) => SignalRService()),
    Provider<LocationService>(create: (_) => LocationServiceImpl()),

    // --- REPOSITÓRIOS ---
    Provider<AuthRepository>(create: (context) => AuthRepositoryImpl( apiService: context.read<ApiService>(),
                                                                      storageService: context.read<StorageService>())),
    Provider<LocationRepository>(create: (context) => LocationRepositoryImpl(apiService: context.read<ApiService>())),                                                                  

    // --- VIEW MODELS ---
    ChangeNotifierProvider<SplashViewModel>(create: (context) =>  SplashViewModel(storageService: context.read<StorageService>())),

    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(
        locationService: context.read<LocationService>(),
        locationRepository: context.read<LocationRepository>(),
        signalRService: context.read<SignalRService>(),
        storageService: context.read<StorageService>(),
      ),
    ),

  ];
}
