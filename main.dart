
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1976F3),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFFF2F5FC),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saamiya Profile',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1976F3),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF1976F3);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FC),
      appBar: AppBar(
        backgroundColor: blue,
        foregroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            // Blue header
            Container(
              width: double.infinity,
              height: 175,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1685FF),
                    Color(0xFF1764E8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(240, 55),
                ),
              ),
            ),

            // White profile card
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16, 100, 16, 24,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  20, 76, 20, 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: blue.withOpacity(0.10),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Ms Saamiya',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF172B4D),
                      ),
                    ),
                    const SizedBox(height: 7),

                    const Text(
                      'Mobile Developer',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF52658A),
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Building great mobile experiences\n'
                          'with Flutter.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.6,
                        color: Color(0xFF7183A3),
                      ),
                    ),
                    const SizedBox(height: 28),

                    const ProfileDetail(
                      icon: Icons.email_outlined,
                      label: 'Email',
                      value: 'saamiya@email.com',
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 20),

                    const ProfileDetail(
                      icon: Icons.phone_outlined,
                      label: 'Phone',
                      value: '25#######',
                      color: Colors.green,
                    ),
                    const SizedBox(height: 20),

                    const ProfileDetail(
                      icon: Icons.location_on_outlined,
                      label: 'Location',
                      value: 'Mogadishu, Somalia',
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(height: 28),

                    // Contact button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Contact: saamiya@email.com',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.chat_outlined,
                          size: 20,
                        ),
                        label: const Text(
                          'Contact Me',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Profile picture
            Positioned(
              top: 22,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/image.png',
                    width: 116,
                    height: 116,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 116,
                        height: 116,
                        color: const Color(0xFFDCE8FA),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.person,
                          size: 70,
                          color: blue,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const ProfileDetail({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 22,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8290A8),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF243653),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
