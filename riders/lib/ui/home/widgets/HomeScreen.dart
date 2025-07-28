import 'package:animated_marker/animated_marker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:riders/ui/home/View_models/HomeViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Map<String, Marker> _markers = {};

   @override
  void initState() {
    super.initState();
    // 4. Simplifique o initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().loadInitialData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Corridas'),
      ),
      // 5. Use o Consumer para reagir às atualizações do ViewModel
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.initialCameraPosition == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Obtendo localização...'),
                ],
              ),
            );
          }

          // 6. Envolva o GoogleMap com o widget AnimatedMarker
          return AnimatedMarker(
            // 1. Forneça o conjunto de marcadores com as posições FINAIS desejadas.
            //    O pacote cuidará da interpolação a partir da posição anterior.
            animatedMarkers: viewModel.markers.values.toSet(),
            
            // 2. Use o builder para construir o GoogleMap.
            //    O `markers` aqui é o conjunto de marcadores já animado pelo pacote.
            builder: (context, markers) {
              return GoogleMap(
                initialCameraPosition: viewModel.initialCameraPosition!,
                // 3. Use o conjunto de marcadores fornecido pelo builder.
                markers: markers,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
              );
            },
          );
        },
      ),
    );
  }
}
