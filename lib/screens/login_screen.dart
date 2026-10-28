import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'forgetpassword.dart';
import 'city_selection_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// TOP GRADIENT BACKGROUND
          Container(
            height: double.infinity,
            width: double.infinity,

            decoration: const BoxDecoration(gradient: AppColors.mainGradient),
          ),

          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.38,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// 🎬 LOTTIE ANIMATION (TOP CENTER)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Lottie.asset(
                        "assets/animations/study1.json",
                        height: 180,
                      ),
                    ),
                  ),

                  /// 📌 LOGO
                  Positioned(
                    top: 100,

                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 180,
                      width: 180,
                      fit: BoxFit.contain,
                    ),
                  ),

                  /// 📌 TEXT
                  Positioned(
                    top: 212,
                    child: const Text(
                      "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// WHITE CURVED LOGIN SECTION
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.68,
              width: double.infinity,

              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),

              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(55),
                  topRight: Radius.circular(55),
                ),
              ),

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    /// WELCOME TEXT
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 35),

                    /// MOBILE FIELD
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F6FA),
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Mobile Number",

                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: AppColors.purple,
                          ),

                          border: InputBorder.none,

                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// PASSWORD FIELD
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F6FA),
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: TextField(
                        obscureText: isPasswordHidden,

                        decoration: InputDecoration(
                          hintText: "Password",

                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: AppColors.purple,
                          ),

                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordHidden = !isPasswordHidden;
                              });
                            },

                            icon: Icon(
                              isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),

                          border: InputBorder.none,

                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// FORGET PASSWORD
                    Row(
                      children: [
                        const Spacer(),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ForgetPassword(),
                              ),
                            );
                          },

                          child: const Text(
                            "Forget password?",
                            style: TextStyle(
                              color: AppColors.purple,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 35),

                    /// LOGIN BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CitySelectionScreen(),
                          ),
                        );
                      },

                      child: Container(
                        height: 60,
                        width: double.infinity,

                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xffFF6FD8), Color(0xff7B61FF)],
                          ),

                          borderRadius: BorderRadius.circular(40),

                          boxShadow: [
                            BoxShadow(
                              color: AppColors.purple.withOpacity(.35),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),

                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    /// SIGNUP
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "New user? ",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),

                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    /// OR
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),

                          // child: Text(
                          //   "OR",
                          //   style: TextStyle(
                          //     color: Colors.grey.shade600,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ),

                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // const Text(
                    //   "Sign in with another account",
                    //   style: TextStyle(color: Colors.grey, fontSize: 13),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
