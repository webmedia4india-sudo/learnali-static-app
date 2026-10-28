/// FILE NAME:
/// city_selection_screen.dart
library;

import 'package:flutter/material.dart';
import '../pages/dashboard_page.dart';
class CitySelectionScreen extends StatefulWidget {
  const CitySelectionScreen({super.key});

  @override
  State<CitySelectionScreen> createState() =>
      _CitySelectionScreenState();
}

class _CitySelectionScreenState
    extends State<CitySelectionScreen>
    with SingleTickerProviderStateMixin {

  final List<String> cities = [
    "Amravati",
    "Akola",
    "Nagpur",
    "Pune",
    "Yavatmal",
    "Nashik",
    "Wardha",
    
  ];

  String selectedCity = "";

  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
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

      body: SafeArea(
        child: Column(
          children: [

            /// APP BAR
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFF6FD8),
                    Color(0xff7B61FF),
                    Color(0xff4B5DFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Row(
                children: [

                  Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: const Icon(
                      Icons.location_city_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          "Select Your City",

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Choose your location",

                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const SizedBox(height: 25),

                    /// ANIMATION
                    // Center(
                    //   child: ScaleTransition(
                    //     scale: _animation,

                    //     child: Container(
                    //       height: 120,
                    //       width: 120,

                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,

                    //         gradient: const LinearGradient(
                    //           colors: [
                    //             Color(0xffFF6FD8),
                    //             Color(0xff7B61FF),
                    //           ],
                    //         ),

                    //         boxShadow: [
                    //           BoxShadow(
                    //             color: Colors.purple
                    //                 .withOpacity(0.2),
                    //             blurRadius: 20,
                    //             offset: const Offset(0, 8),
                    //           ),
                    //         ],
                    //       ),

                    //       child: const Icon(
                    //         Icons.location_on_rounded,
                    //         color: Colors.white,
                    //         size: 60,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(height: 30),

                    /// SEARCH BAR
                    Container(
                      height: 55,

                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius:
                            BorderRadius.circular(15),
                      ),

                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,

                          hintText: "Search city",

                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 17,
                          ),

                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// CITY LIST
                    Expanded(
                      child: ListView.separated(
                        itemCount: cities.length,

                        separatorBuilder:
                            (context, index) {

                          return Divider(
                            color: Colors.grey.shade200,
                          );
                        },

                        itemBuilder: (context, index) {

                          final city = cities[index];

                          return ListTile(

                            onTap: () {

                              setState(() {
                                selectedCity = city;
                              });
                            },

                            contentPadding:
                                EdgeInsets.zero,

                            title: Text(
                              city,

                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight:
                                    FontWeight.w500,
                                color:
                                    Color(0xff1B1B3A),
                              ),
                            ),

                            /// RADIO BUTTON
                            trailing: Radio<String>(
                              value: city,
                              groupValue: selectedCity,

                              activeColor:
                                  const Color(0xff7B61FF),

                              onChanged: (value) {

                                setState(() {
                                  selectedCity = value!;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// BUTTON
                   GestureDetector(
  onTap: () {
    if (selectedCity.isNotEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Selected City: $selectedCity",
          ),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(),
        ),
      );
    }
  },

  child: Container(
    height: 60,
    width: double.infinity,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(35),

      gradient: const LinearGradient(
        colors: [
          Color(0xffFF6FD8),
          Color(0xff7B61FF),
        ],
      ),

      boxShadow: [
        BoxShadow(
          color: Colors.purple.withOpacity(0.2),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    ),

    child: const Center(
      child: Text(
        "Continue",

        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}