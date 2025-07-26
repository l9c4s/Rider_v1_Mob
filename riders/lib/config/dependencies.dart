import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:riders/data/repositories/auth/auth_repository.dart';
import 'package:riders/data/repositories/auth/auth_repository_imp.dart';
import 'package:riders/data/services/LocationManagerService/LocationManagerService.dart';
import 'package:riders/data/services/LocationManagerService/LocationManagerServiceImpl.dart';
import 'package:riders/data/services/api/model/api_client.dart';
import 'package:riders/data/services/locations/LocationService.dart';
import 'package:riders/data/services/locations/LocationServiceImpl.dart';
import 'package:riders/data/services/signalr/signalr_service.dart';
import 'package:riders/data/services/storage/SecureStorageServiceImpl.dart';
import 'package:riders/data/services/storage/storage_service.dart';
import 'package:riders/ui/SplashView/View_models/SplashViewModel.dart';
import 'package:riders/ui/home/View_models/HomeViewModel.dart';

List<SingleChildWidget> get providers {
  return [
    // --- SERVIÇOS ---
    Provider<StorageService>(create: (_) => SecureStorageServiceImpl()),
    Provider<LocationService>(create: (_) => LocationServiceImpl()),
    ChangeNotifierProvider<LocationManagerService>(create: (_) => LocationManagerServiceImpl()),
    Provider<ApiService>(create: (context) =>ApiService(storageService: context.read<StorageService>())),
    Provider<SignalRService>(create: (_) => SignalRService()),

    // --- REPOSITÓRIOS ---
    Provider<AuthRepository>(create: (context) => AuthRepositoryImpl( apiService: context.read<ApiService>(),
                                                                      storageService: context.read<StorageService>())),

    // --- VIEW MODELS ---
    ChangeNotifierProvider<SplashViewModel>(create: (context) =>  SplashViewModel(storageService: context.read<StorageService>())),
    ChangeNotifierProvider<HomeViewModel>(create: (context) => HomeViewModel(context.read<SignalRService>(), context.read<StorageService>(), 
                                                                             context.read<LocationService>(), context.read<LocationManagerService>())
  ),
  ];
}
