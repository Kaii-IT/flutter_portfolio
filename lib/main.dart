import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

// Root app widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Omar's Portfolio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF09090B),
        fontFamily: 'Inter',
        primaryColor: const Color(0xFFFAFAFA),
      ),
      home: const HomePage(),
    );
  }
}

// Home page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TEXTS FOR EASY EDITING
  final String fullName = 'Omar D. Abro';
  final String tagline = '3rd Year BSIT Student';

  final String examDate = 'September 3, 2026';
  final String professorName = 'Prof. Albert Q. Alforja';
  final String studentFullName = 'Omar D. Abro';

  final String aboutMe =
      "Hi, I’m Omar. I’m a BSIT student and an aspiring Full-Stack Developer. I build clean, efficient, and scalable digital solutions. Currently focused on mastering Laravel and exploring the world of Cloud Computing. Let’s build something great together.";

  final String footerText = 'Omar Abro © 2026 - ITP107 Midterm Lab Exam';

  // ---- State for gesture output ----
  String _outputLabel = 'Tap, double tap, or long-press the button';
  String _outputValue = 'Output';

  // ---- Gesture handlers (Module 8) ----
  void _handleSingleTap() {
    setState(() {
      _outputLabel = 'Single Tap';
      _outputValue = examDate;
    });
    print('[Single Tap] Date: $examDate');
  }

  void _handleDoubleTap() {
    setState(() {
      _outputLabel = 'Double Tap';
      _outputValue = professorName;
    });
    print('[Double Tap] Professor: $professorName');
  }

  void _handleLongPress() {
    setState(() {
      _outputLabel = 'Long Press';
      _outputValue = studentFullName;
    });
    print('[Long Press] Student: $studentFullName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.code, color: Color(0xFFFAFAFA), size: 20),
            SizedBox(width: 8),
            Text(
              "Omar's Portfolio",
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFFFAFAFA),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: ListView(
          children: [
            // ---- Profile header ----
            Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: Color(0xFF18181B),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: const TextStyle(
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xFFFAFAFA),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tagline,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Color(0xFFA1A1AA),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ---- Divider ----
            Container(height: 1, color: const Color(0xFF27272A)),

            const SizedBox(height: 20),

            // ---- Gesture row ----
            Row(
              children: [
                Expanded(
                  flex: 25,
                  child: GestureDetector(
                    onTap: _handleSingleTap,
                    onDoubleTap: _handleDoubleTap,
                    onLongPress: _handleLongPress,

                    child: Container(
                      height: 56,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4E4E7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Click Me',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF09090B),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 75,
                  child: Container(
                    height: 56,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF18181B),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF27272A)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _outputValue,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color(0xFFFAFAFA),
                          ),
                        ),
                        Text(
                          '[$_outputLabel]',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Color(0xFFA1A1AA),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // ---- Skills ----
            const Text(
              'Skills',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFFFAFAFA),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                SkillChip(label: 'Java'),
                SkillChip(label: 'Dart/Flutter'),
                SkillChip(label: 'Kotlin'),
                SkillChip(label: 'Javascript'),
                SkillChip(label: 'PHP/Laravel'),
                SkillChip(label: 'MySQL'),
              ],
            ),

            const SizedBox(height: 28),

            // ---- About Me ----
            const Text(
              'About Me',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFFFAFAFA),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF18181B),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFF27272A)),
              ),
              child: Text(
                aboutMe,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13.5,
                  color: Color(0xFFA1A1AA),
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 28),

            // ---- Projects ----
            const Text(
              'Projects',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFFFAFAFA),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 260,
              child: ListView(
                children: [
                  ProjectCard(
                    title: 'Lumiere',
                    description:
                        'An e-commerce project built with PHP and MySQL as database.',
                    icon: FontAwesomeIcons.cartShopping,
                  ),
                  ProjectCard(
                    title: 'CTRL ALT DELIGHT POS',
                    description:
                        'A point-of-sale project for a computer parts shop.',
                    icon: FontAwesomeIcons.cashRegister,
                  ),
                  ProjectCard(
                    title: 'SnapStash',
                    description:
                        'An Android application to easily log and retrieve household items for organization.',
                    icon: FontAwesomeIcons.boxesStacked,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ---- Contact / Socials ----
            const Text(
              'Contact',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFFFAFAFA),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: buildSocialBox(
                    const FaIcon(
                      FontAwesomeIcons.github,
                      size: 18,
                      color: Color(0xFFFAFAFA),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: buildSocialBox(
                    const FaIcon(
                      FontAwesomeIcons.linkedinIn,
                      size: 18,
                      color: Color(0xFFFAFAFA),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: buildSocialBox(
                    const Icon(Icons.email, size: 18, color: Color(0xFFFAFAFA)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),
            Container(height: 1, color: const Color(0xFF27272A)),
            const SizedBox(height: 16),

            // ---- Footer ----
            Center(
              child: Text(
                footerText,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 11.5,
                  color: Color(0xFF52525B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSocialBox(Widget iconWidget) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: iconWidget,
    );
  }
}

// ---- Skill chip ----
class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF18181B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF27272A)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Color(0xFFFAFAFA),
        ),
      ),
    );
  }
}

// ---- Project card ----
class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final FaIconData icon;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF18181B),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF09090B),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF27272A)),
              ),
              child: FaIcon(icon, size: 15, color: const Color(0xFFFAFAFA)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFFFAFAFA),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: Color(0xFFA1A1AA),
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
