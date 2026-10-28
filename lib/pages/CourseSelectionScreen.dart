import 'package:flutter/material.dart';
import 'package:learnli_app/pages/teacher_selection_screen.dart';

class AppColors {
  static const Color primary = Color(0xFF55DDE0);
  static const Color blue = Color(0xFF4B5DFF);
  static const Color purple = Color(0xFFB44CFF);
  static const Color pink = Color(0xFFFF6FD8);
  static const Color white = Colors.white;

  static const LinearGradient mainGradient = LinearGradient(
    colors: [
      Color(0xFFFF6FD8),
      Color(0xFF7B61FF),
      Color(0xFF4B5DFF),
      Color(0xFF55DDE0),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class CourseSelectionScreen extends StatefulWidget {
  final String categoryLabel;
  final Color categoryColor;
  final Color categoryBg;

  const CourseSelectionScreen({
    super.key,
    required this.categoryLabel,
    required this.categoryColor,
    required this.categoryBg,
  });

  @override
  State<CourseSelectionScreen> createState() => _CourseSelectionScreenState();
}

class _CourseSelectionScreenState extends State<CourseSelectionScreen> {
  final List<Map<String, dynamic>> subjects = [
    {
      'title': 'Mathematics',
      'icon': Icons.calculate_rounded,
      'desc': 'Algebra, Geometry, Trigonometry & Statistics',
      'iconColors': [Color(0xFF4B5DFF), Color(0xFF55DDE0)],
    },
    {
      'title': 'Science',
      'icon': Icons.science_rounded,
      'desc': 'Physics, Chemistry & Biology combined',
      'iconColors': [Color(0xFF55DDE0), Color(0xFF4B5DFF)],
    },
    {
      'title': 'English',
      'icon': Icons.menu_book_rounded,
      'desc': 'Grammar, Prose, Poetry & Writing skills',
      'iconColors': [Color(0xFFFF6FD8), Color(0xFFB44CFF)],
    },
    {
      'title': 'Marathi',
      'icon': Icons.language_rounded,
      'desc': 'Kavita, Gadya, Vyakaran aani Lekhan',
      'iconColors': [Color(0xFFB44CFF), Color(0xFF4B5DFF)],
    },
    {
      'title': 'History & Civics',
      'icon': Icons.history_edu_rounded,
      'desc': 'Indian History, Political Science & Civics',
      'iconColors': [Color(0xFF7B61FF), Color(0xFFFF6FD8)],
    },
    {
      'title': 'Geography',
      'icon': Icons.public_rounded,
      'desc': 'Map work, Physical & Human Geography',
      'iconColors': [Color(0xFF55DDE0), Color(0xFF7B61FF)],
    },
  ];

  final List<String> selectedSubjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F3FF),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 14,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            decoration: const BoxDecoration(
              gradient: AppColors.mainGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: -20,
                  top: -20,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.08),
                    ),
                  ),
                ),
                Positioned(
                  left: -30,
                  bottom: -10,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.06),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Text(
                          'Class ${widget.categoryLabel}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      'All Subjects',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Text(
                    //   'Select the subjects you want to study',
                    //   style: TextStyle(
                    //     color: Colors.white.withOpacity(0.88),
                    //     fontSize: 14,
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     _headerStat(
                    //       Icons.menu_book_rounded,
                    //       '${subjects.length} Subjects',
                    //     ),
                    //     const SizedBox(width: 20),
                    //     _headerStat(
                    //       Icons.people_outline_rounded,
                    //       '10k+ Students',
                    //     ),
                    //     const SizedBox(width: 20),
                    //     _headerStat(Icons.star_rounded, '4.8 Rating'),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),

          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            child: selectedSubjects.isEmpty
                ? const SizedBox(height: 12)
                : Padding(
                    padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF6FD8), Color(0xFF7B61FF)],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFF7B61FF,
                                ).withOpacity(0.30),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.check_circle_rounded,
                                size: 15,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${selectedSubjects.length} subject'
                                '${selectedSubjects.length > 1 ? 's' : ''} selected',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(18, 6, 18, 6),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                final bool isSelected = selectedSubjects.contains(
                  subject['title'],
                );
                final List<Color> iconColors = List<Color>.from(
                  subject['iconColors'],
                );

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedSubjects.remove(subject['title']);
                      } else {
                        selectedSubjects.add(subject['title']);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF7B61FF)
                            : Colors.transparent,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isSelected
                              ? const Color(0xFF7B61FF).withOpacity(0.18)
                              : Colors.black.withOpacity(0.05),
                          blurRadius: isSelected ? 16 : 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 58,
                          width: 58,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: isSelected
                                  ? const [
                                      Color(0xFFFF6FD8),
                                      Color(0xFF7B61FF),
                                      Color(0xFF4B5DFF),
                                      Color(0xFF55DDE0),
                                    ]
                                  : iconColors,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: iconColors.last.withOpacity(0.35),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Icon(
                            subject['icon'],
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subject['title'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: isSelected
                                      ? const Color(0xFF7B61FF)
                                      : const Color(0xFF1E1B4B),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                subject['desc'],
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF9CA3AF),
                                  height: 1.35,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: isSelected
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFFFF6FD8),
                                      Color(0xFF7B61FF),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            color: isSelected ? null : Colors.transparent,
                            border: Border.all(
                              color: isSelected
                                  ? Colors.transparent
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: const Color(
                                        0xFF7B61FF,
                                      ).withOpacity(0.35),
                                      blurRadius: 8,
                                      offset: const Offset(0, 3),
                                    ),
                                  ]
                                : [],
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                  size: 17,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              10,
              20,
              MediaQuery.of(context).padding.bottom + 18,
            ),
            child: GestureDetector(
              onTap: selectedSubjects.isEmpty
                  ? null
                  : () {
                      // ✅ TeacherSelectionScreen ला navigate करतो
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TeacherSelectionScreen(),
                        ),
                      );
                    },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: selectedSubjects.isEmpty
                      ? const LinearGradient(
                          colors: [Color(0xFFE5E7EB), Color(0xFFE5E7EB)],
                        )
                      : const LinearGradient(
                          colors: [
                            Color(0xFFFF6FD8),
                            Color(0xFF7B61FF),
                            Color(0xFF4B5DFF),
                            Color(0xFF55DDE0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: selectedSubjects.isEmpty
                      ? []
                      : [
                          BoxShadow(
                            color: const Color(0xFF7B61FF).withOpacity(0.40),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                ),
                child: Center(
                  child: Text(
                    selectedSubjects.isEmpty ? 'Select a Subject' : 'Continue ',
                    style: TextStyle(
                      color: selectedSubjects.isEmpty
                          ? const Color(0xFF9CA3AF)
                          : Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerStat(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.white.withOpacity(0.80), size: 14),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.85),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
