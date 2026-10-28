import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),

        child: Column(
          children: [

            /// Skip Button
            Align(
              alignment: Alignment.topRight,

              child: Text(
                "Skip",

                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Image
            Expanded(
              flex: 5,

              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 25),

            /// Title
            Text(
              title,
              textAlign: TextAlign.center,

              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),

            /// Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),

              child: Text(
                subtitle,
                textAlign: TextAlign.center,

                style: GoogleFonts.poppins(
                  fontSize: 17,
                  height: 1.6,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}