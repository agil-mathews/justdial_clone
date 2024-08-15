import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _moveToCenterAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _moveToLeftAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    // Moving from bottom center to the center of the screen
    _moveToCenterAnimation = Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeInOut),
      ),
    );

    // No rotation initially, then 3 spins with delays
    _rotationAnimation = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 1), // No rotation initially
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 2 * math.pi), weight: 1), // First spin
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 1), // Delay before next spin
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 2 * math.pi), weight: 1), // Second spin
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 1), // Delay before next spin
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 2 * math.pi), weight: 1), // Third spin
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeInOut),
      ),
    );

    // Scale up during the first two spins, then back to normal
    _scaleAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.2), weight: 2), // Scale up
      TweenSequenceItem(tween: Tween<double>(begin: 1.2, end: 1.0), weight: 1), // Scale down to normal
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 1), // Maintain normal size during third spin
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeInOut),
      ),
    );

    // Moving from the center to the left side of the screen
    _moveToLeftAnimation = Tween<double>(begin: 0, end: -100).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 0.9, curve: Curves.easeInOut),
      ),
    );

    // Fade in the text at the center
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SlideTransition(
            position: _moveToCenterAnimation,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_moveToLeftAnimation.value, 0), // Moving left after spin
                  child: Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: child,
                    ),
                  ),
                );
              },
              child: Center(
                child: Image.asset('assets/images/webLogo.png', width: 100, height: 100),
              ),
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            child: const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 100.0),
                child: Text(
                  "MetaLaunch.ai",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
