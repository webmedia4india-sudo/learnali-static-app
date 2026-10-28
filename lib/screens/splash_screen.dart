import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff6A11CB), Color(0xff4A00E0)],
          ),
        ),

        child: Stack(
          children: [
            /// TOP RIGHT CIRCLE
            Positioned(
              top: -40,
              right: -40,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.withOpacity(0.5),
                      Colors.purple.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
            ),

            /// TOP LEFT SMALL
            Positioned(
              top: 90,
              left: -30,
              child: Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink.withOpacity(0.35), Colors.transparent],
                  ),
                ),
              ),
            ),

            /// BOTTOM LEFT
            Positioned(
              bottom: -40,
              left: -40,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.withOpacity(0.5),
                      Colors.purple.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
            ),

            /// BOTTOM RIGHT
            Positioned(
              bottom: 40,
              right: -20,
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.withOpacity(0.5),
                      Colors.purple.withOpacity(0.2),
                    ],
                  ),
                ),
              ),
            ),

            /// SMALL STARS
            ...List.generate(
              15,
              (index) => Positioned(
                top: (index * 45).toDouble() + 40,
                left: (index % 2 == 0)
                    ? 50 + (index * 8).toDouble()
                    : 250 - (index * 5).toDouble(),
                child: Container(
                  height: 4,
                  width: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            /// CENTER CONTENT
            /// CENTER CONTENT
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 🎬 LOTTIE ANIMATION
                  Lottie.asset("assets/animations/study1.json", height: 180),

                  /// VERY SMALL GAP
                  const SizedBox(height: 10),

                  /// 📌 APP NAME (WHITE TEXT - KEEP)
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 8),

                  // const Text(
                  //   "Learn Anytime, Anywhere",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.white70,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),

                  const SizedBox(height: 90),

                  /// LOADING INDICATOR (UNCHANGED)
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.pinkAccent,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
