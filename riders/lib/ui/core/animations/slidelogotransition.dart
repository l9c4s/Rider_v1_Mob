import 'package:flutter/material.dart';

class SlideLogoTransition extends StatefulWidget {
  final Widget child;
  final Duration rotationDuration;
  final Duration slideDuration;
  final double offsetX;
  final VoidCallback? onCompleted;

  const SlideLogoTransition({
    super.key,
    required this.child,
    this.rotationDuration = const Duration(seconds: 2),
    this.slideDuration = const Duration(milliseconds: 800),
    this.offsetX = -250,
    this.onCompleted,
  });

  @override
  SlideLogoTransitionState createState() => SlideLogoTransitionState();
}

class SlideLogoTransitionState extends State<SlideLogoTransition> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _slideController;
  late Animation<double> _slideAnimation;
  bool _startSlide = false;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: widget.rotationDuration,
      vsync: this,
    );
    _slideController = AnimationController(
      duration: widget.slideDuration,
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0, end: widget.offsetX).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
    );
    startRotation();
  }

  void startRotation() {
    _rotationController.repeat();
  }

  void stopRotationAndSlide() {
    _rotationController.stop();
    setState(() => _startSlide = true);
    _slideController.forward().then((_) {
      widget.onCompleted?.call();
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget logo = widget.child;
    if (!_startSlide) {
      logo = RotationTransition(
        turns: _rotationController,
        child: widget.child,
      );
    }
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_slideAnimation.value, 0),
          child: child,
        );
      },
      child: logo,
    );
  }
}