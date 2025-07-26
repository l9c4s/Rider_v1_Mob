import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:riders/ui/SplashView/View_models/SplashViewModel.dart';
import 'package:riders/ui/core/animations/slidelogotransition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<SlideLogoTransitionState> _logoKey = GlobalKey();
  String? _nextRoute;

  @override
  void initState() {
    super.initState();
    _startSplashProcess();
  }

  Future<void> _startSplashProcess() async {
    // Inicia rotação
    await Future.delayed(const Duration(milliseconds: 100));
    _logoKey.currentState?.startRotation();

    final viewModel = context.read<SplashViewModel>();
    final route = await viewModel.decideNextRoute();

    // Para rotação e inicia slide
    _logoKey.currentState?.stopRotationAndSlide();
    _nextRoute = route;
  }

  void _onLogoAnimationCompleted() {
    if (_nextRoute != null && mounted) {
      context.go(_nextRoute!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideLogoTransition(
          key: _logoKey,
          child: const FlutterLogo(size: 100),
          slideDuration: const Duration(milliseconds: 800),
          offsetX: -250,
          onCompleted: _onLogoAnimationCompleted,
        ),
      ),
    );
  }
}