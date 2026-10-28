import 'package:flutter/material.dart';
import 'package:learnli_app/pages/pages/pages/play_video_course_page.dart';
import 'package:learnli_app/pages/pages/pages/profile_page.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  int _selectedIndex = 2; // Wishlist tab active by default

  final List<Map<String, dynamic>> _wishlistItems = [
    {
      'subject': 'Mathematics',
      'icon': Icons.calculate_rounded,
      'color': const Color(0xFF7C3AED),
      'bg': const Color(0xFFEDE9FE),
      'lessons': '24 Lessons',
      'level': '10th',
      'price': '₹499',
      'originalPrice': '₹999',
      'teacher': 'Ronald Richards',
      'rating': '4.6',
      'isSaved': true,
    },
    {
      'subject': 'Physics',
      'icon': Icons.bolt_rounded,
      'color': const Color(0xFFF59E0B),
      'bg': const Color(0xFFFEF3C7),
      'lessons': '22 Lessons',
      'level': '11th',
      'price': '₹599',
      'originalPrice': '₹1199',
      'teacher': 'Anil Sharma',
      'rating': '4.8',
      'isSaved': true,
    },
    {
      'subject': 'Chemistry',
      'icon': Icons.biotech_rounded,
      'color': const Color(0xFFDB2777),
      'bg': const Color(0xFFFCE7F3),
      'lessons': '19 Lessons',
      'level': '12th',
      'price': '₹549',
      'originalPrice': '₹1099',
      'teacher': 'Dionne Russell',
      'rating': '4.7',
      'isSaved': true,
    },
    {
      'subject': 'English',
      'icon': Icons.menu_book_rounded,
      'color': const Color(0xFF0369A1),
      'bg': const Color(0xFFE0F2FE),
      'lessons': '20 Lessons',
      'level': '12th',
      'price': '₹449',
      'originalPrice': '₹899',
      'teacher': 'Jane Cooper',
      'rating': '4.9',
      'isSaved': true,
    },
    {
      'subject': 'Science',
      'icon': Icons.science_rounded,
      'color': const Color(0xFF10B981),
      'bg': const Color(0xFFD1FAE5),
      'lessons': '18 Lessons',
      'level': '10th',
      'price': '₹399',
      'originalPrice': '₹799',
      'teacher': 'Dionne Russell',
      'rating': '4.5',
      'isSaved': true,
    },
  ];

  void _removeFromWishlist(int index) {
    setState(() {
      _wishlistItems.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Removed from wishlist'),
        backgroundColor: const Color(0xFF7C3AED),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(
        title: const Text(
          "My Wishlist",
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
      body: _wishlistItems.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: _wishlistItems.length,
              itemBuilder: (context, index) {
                return _buildWishlistCard(_wishlistItems[index], index);
              },
            ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildWishlistCard(Map<String, dynamic> course, int index) {
    final Color color = course['color'];

    return Dismissible(
      key: Key(course['subject']),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => _removeFromWishlist(index),
      background: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 25),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(.10),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 115,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(.7)],
                ),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Icon(course['icon'], color: Colors.white, size: 34),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            course['subject'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _removeFromWishlist(index),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "by ${course['teacher']}",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 15),
                        const SizedBox(width: 4),
                        Text(course['rating']),
                        const SizedBox(width: 12),
                        Text(
                          course['lessons'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              course['price'],
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              course['originalPrice'],
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.purple),
          SizedBox(height: 15),
          Text(
            "Wishlist is Empty",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Add courses to your wishlist",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ── BOTTOM NAV BAR (same as DashboardPage) ───────────────
  Widget _buildBottomNavBar() {
    final items = [
      {
        'icon': Icons.home_rounded,
        'activeIcon': Icons.home_rounded,
        'label': 'Home',
      },
      {
        'icon': Icons.play_circle_outline_rounded,
        'activeIcon': Icons.play_circle_rounded,
        'label': 'My Courses',
      },
      {
        'icon': Icons.favorite_border_rounded,
        'activeIcon': Icons.favorite_rounded,
        'label': 'Wishlist',
      },
      {
        'icon': Icons.person_outline_rounded,
        'activeIcon': Icons.person_rounded,
        'label': 'Profile',
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 68,
          child: Row(
            children: List.generate(items.length, (index) {
              final isSelected = _selectedIndex == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      // Home — pop back to dashboard
                      Navigator.popUntil(context, (route) => route.isFirst);
                    } else if (index == 1) {
                      setState(() => _selectedIndex = index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PlayVideoCoursePage(),
                        ),
                      ).then((_) => setState(() => _selectedIndex = 2));
                    } else if (index == 2) {
                      // Already on Wishlist — do nothing
                      setState(() => _selectedIndex = index);
                    } else if (index == 3) {
                      setState(() => _selectedIndex = index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ProfilePage()),
                      ).then((_) => setState(() => _selectedIndex = 2));
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Top indicator line
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          height: 3,
                          width: isSelected ? 32 : 0,
                          margin: const EdgeInsets.only(bottom: 6),
                          decoration: BoxDecoration(
                            gradient: isSelected
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF6DD5FA),
                                      Color(0xFFB06AB3),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        // Icon with animated scale
                        AnimatedScale(
                          scale: isSelected ? 1.15 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: isSelected
                              ? ShaderMask(
                                  shaderCallback: (bounds) =>
                                      const LinearGradient(
                                        colors: [
                                          Color(0xFF6DD5FA),
                                          Color(0xFFB06AB3),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ).createShader(bounds),
                                  child: Icon(
                                    items[index]['activeIcon'] as IconData,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                )
                              : Icon(
                                  items[index]['icon'] as IconData,
                                  size: 24,
                                  color: const Color(0xFFB0B8C1),
                                ),
                        ),
                        const SizedBox(height: 4),
                        // Label
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w400,
                            color: isSelected
                                ? const Color(0xFFB06AB3)
                                : const Color(0xFFB0B8C1),
                          ),
                          child: Text(items[index]['label'] as String),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}