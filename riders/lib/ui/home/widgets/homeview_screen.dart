import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:riders/ui/home/View_models/HomeViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
   final vm = context.read<HomeViewModel>();
    vm.init().then(
      (_) {
        vm.connectToHub();
      },
    ); // Inicia a busca pela localização do usuário.
  }

  @override
  Widget build(BuildContext context) {
    // A View observa as mudanças no seu ViewModel
    final vm = context.watch<HomeViewModel>();
    final currentUserPosition = vm.currentUserPosition;

    if (currentUserPosition == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Home - Localização')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }


    return Scaffold(
      appBar: AppBar(title: const Text('Home - Localização')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentUserPosition,
          zoom: 16,
        ),
        markers: vm.visibleFriends.map((loc) {
          return Marker(
            markerId: MarkerId(loc.userId),
            position: LatLng(loc.latitude, loc.longitude),
            infoWindow: InfoWindow(
              title: loc.userId,
              snippet: loc.timestamp.toString(),
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              loc.userId == "99b9ea0b-c3d5-4ed5-a1dd-03abc8083bf0"
                  ? BitmapDescriptor.hueGreen
                  : BitmapDescriptor.hueOrange,
            ),
          );
        }).toSet(),
        // Completa o controller quando o mapa é criado.
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        // Quando o usuário para de mover o mapa, atualiza os limites no ViewModel.
        onCameraIdle: () async {
          final controller = await _controller.future;
          final bounds = await controller.getVisibleRegion();
          vm.updateMapBounds(bounds);
        },
      ),
    );
  }
}