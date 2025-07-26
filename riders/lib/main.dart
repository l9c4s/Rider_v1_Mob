import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riders/config/dependencies.dart';
import 'package:riders/data/services/locations/LocationService.dart';
import 'package:riders/routing/go_router.dart';
import 'package:riders/ui/core/themes/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  bool? _hasLocationPermission;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final locationService = Provider.of<LocationService>(context, listen: false);
    final hasPermission = await locationService.checkLocationPermission();
    setState(() {
      _hasLocationPermission = hasPermission;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Enquanto não checa, mostra splash/loading
    if (_hasLocationPermission == null) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    // Se não tem permissão, mostra aviso
    if (_hasLocationPermission == false) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Permissão de localização necessária para usar o app.')),
        ),
      );
    }

    // Se tem permissão, inicia o app normalmente
    return MaterialApp.router(
      title: 'Riders App',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}