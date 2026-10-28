import 'package:flutter/material.dart';
import 'package:learnli_app/pages/course_detail_page.dart';
import 'package:learnli_app/utils/app_colors.dart';

class TeacherSelectionScreen extends StatefulWidget {
  const TeacherSelectionScreen({super.key});

  @override
  State<TeacherSelectionScreen> createState() => _TeacherSelectionScreenState();
}

class _TeacherSelectionScreenState extends State<TeacherSelectionScreen> {
  int? selectedTeacher;
  int? hoveredIndex;

  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> teachers = [
    {
      "name": "Rahul Patil",
      "role": "Math Expert",
      "rating": 4.8,
      "reviews": 120,
      "initial": "R",
      "avatarBg": Colors.purple.shade50,
      "avatarColor": Colors.purple,
    },
    {
      "name": "Priya Sharma",
      "role": "Science Expert",
      "rating": 4.6,
      "reviews": 98,
      "initial": "P",
      "avatarBg": Colors.blue.shade50,
      "avatarColor": Colors.blue,
    },
    {
      "name": "Amit Deshmukh",
      "role": "Physics Expert",
      "rating": 4.9,
      "reviews": 210,
      "initial": "A",
      "avatarBg": Colors.orange.shade50,
      "avatarColor": Colors.orange,
    },
    {
      "name": "Sneha Joshi",
      "role": "English Expert",
      "rating": 4.7,
      "reviews": 150,
      "initial": "S",
      "avatarBg": Colors.green.shade50,
      "avatarColor": Colors.green,
    },
  ];

  List<Map<String, dynamic>> filteredTeachers = [];

  @override
  void initState() {
    super.initState();
    filteredTeachers = teachers;
  }

  void filterSearch(String value) {
    setState(() {
      filteredTeachers = teachers
          .where(
            (t) =>
                t["name"].toLowerCase().contains(value.toLowerCase()) ||
                t["role"].toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          "Select Your Teacher",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6DD5FA), Color(0xFFB06AB3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 12),

          // ── New Search Bar ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildSearchBar(),
          ),

          const SizedBox(height: 10),

          // ── Teacher List ──
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredTeachers.length,
              itemBuilder: (context, index) {
                final t = filteredTeachers[index];
                final isSelected = selectedTeacher == index;
                final isHovered = hoveredIndex == index;

                return MouseRegion(
                  onEnter: (_) => setState(() => hoveredIndex = index),
                  onExit: (_) => setState(() => hoveredIndex = null),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTeacher = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(bottom: 14),
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? AppColors.mainGradient
                            : isHovered
                            ? AppColors.mainGradient.withOpacity(0.6)
                            : LinearGradient(
                                colors: [
                                  Colors.grey.shade300,
                                  Colors.grey.shade200,
                                ],
                              ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.all(2.5),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                // Avatar
                                Container(
                                  width: 66,
                                  height: 66,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: t['avatarBg'],
                                  ),
                                  child: Center(
                                    child: Text(
                                      t['initial'],
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                        color: t['avatarColor'],
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // Name + Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        t['name'],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        t['role'],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.amber,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            "${t['rating']} (${t['reviews']})",
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                AnimatedOpacity(
                                  opacity: selectedTeacher == index ? 1 : 0,
                                  duration: const Duration(milliseconds: 200),
                                  child: const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // View Details Button
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "View Details",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF7C3AED),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // ── Continue Button ──
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CourseDetailPage()),
            );
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              gradient: AppColors.mainGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── NEW SEARCH BAR ──────────────────────────────────────
  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C3AED).withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          const Icon(
            Icons.search_rounded,
            color: Color(0xFF9CA3AF),
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged: filterSearch,
              decoration: const InputDecoration(
                hintText: 'Search teacher or subject...',
                hintStyle: TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFF5B21B6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.mic_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}