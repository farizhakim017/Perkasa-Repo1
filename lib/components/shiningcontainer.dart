// ignore_for_file: overridden_fields, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ShiningContainer extends StatefulWidget {
  final Widget child;
  @override
  final Key? key;

  const ShiningContainer({required this.child, this.key}) : super(key: key);

  @override
  _ShiningContainerState createState() => _ShiningContainerState();
}

class _ShiningContainerState extends State<ShiningContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create the animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Create the animation
    _animation = Tween(begin: 0.0, end: 2 * 3.14159).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Colors.white,
                Colors.grey,
                Colors.white,
              ],
              stops: const [0.0, 0.5, 1.0],
              transform: GradientRotation(_animation.value),
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}
