import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/app_colors.dart';
import '../widgets/onboarding_page.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController controller = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: PageView(
                controller: controller,

                onPageChanged: (index) {

                  setState(() {
                    isLastPage = index == 1;
                  });
                },

                children: const [

                  OnboardingPage(
                    image: "assets/images/screen1.png",
                    title: "Learn Without Limits",
                    subtitle:
                    "Access 1000+ courses anytime, anywhere and at your pace.",
                  ),

                  OnboardingPage(
                    image: "assets/images/screen2.png",
                    title: "Learn From Experts",
                    subtitle:
                    "Connect with top mentors and gain knowledge from industry leaders.",
                  ),
                ],
              ),
            ),

            SmoothPageIndicator(
              controller: controller,
              count: 2,

              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.pink,
                dotColor: Colors.grey.shade300,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),

            const SizedBox(height: 35),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),

              child: GestureDetector(

                onTap: () {

                  if (isLastPage) {

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );

                  } else {

                    controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },

                child: Container(
                  height: 65,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    gradient: AppColors.mainGradient,
                    borderRadius: BorderRadius.circular(40),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.25),
                        blurRadius: 14,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        isLastPage ? "Get Started" : "Next",

                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
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