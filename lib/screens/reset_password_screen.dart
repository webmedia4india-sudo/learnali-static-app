import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends State<ResetPasswordScreen>
    with SingleTickerProviderStateMixin {

  final TextEditingController newPassController =
      TextEditingController();

  final TextEditingController confirmPassController =
      TextEditingController();

  bool hideNew = true;
  bool hideConfirm = true;

  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  Widget passwordField({
    required String hint,
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback toggle,
  }) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(18),
      ),

      child: TextField(
        controller: controller,
        obscureText: obscure,

        decoration: InputDecoration(
          hintText: hint,

          prefixIcon: const Icon(
            Icons.lock_outline,
            color: AppColors.purple,
          ),

          suffixIcon: IconButton(
            onPressed: toggle,

            icon: Icon(
              obscure
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: Colors.grey,
            ),
          ),

          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.mainGradient,
        ),

        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: FadeTransition(
                opacity: _fade,

                child: SlideTransition(
                  position: _slide,

                  child: Container(
                    padding: const EdgeInsets.all(25),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 20,
                        ),
                      ],
                    ),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        /// ICON
                        const Icon(
                          Icons.lock_reset,
                          size: 70,
                          color: AppColors.purple,
                        ),

                        const SizedBox(height: 15),

                        /// TITLE
                        const Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // const Text(
                        //   "Create a new password for your account",
                        //   textAlign: TextAlign.center,

                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //     fontSize: 14,
                        //   ),
                        // ),

                        const SizedBox(height: 25),

                        /// NEW PASSWORD
                        passwordField(
                          hint: "New Password",
                          controller: newPassController,
                          obscure: hideNew,

                          toggle: () {
                            setState(() {
                              hideNew = !hideNew;
                            });
                          },
                        ),

                        const SizedBox(height: 15),

                        /// CONFIRM PASSWORD
                        passwordField(
                          hint: "Confirm Password",
                          controller: confirmPassController,
                          obscure: hideConfirm,

                          toggle: () {
                            setState(() {
                              hideConfirm = !hideConfirm;
                            });
                          },
                        ),

                        const SizedBox(height: 25),

                        /// RESET BUTTON
                        GestureDetector(
                          onTap: () {

                            Navigator.pushReplacement(
                              context,

                              MaterialPageRoute(
                                builder: (context) =>
                                    const LoginScreen(),
                              ),
                            );
                          },

                          child: Container(
                            height: 55,
                            width: double.infinity,

                            decoration: BoxDecoration(
                              gradient: AppColors.mainGradient,
                              borderRadius: BorderRadius.circular(30),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purple.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),

                            child: const Center(
                              child: Text(
                                "Reset Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}