import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/onboarding_screen.dart';
import 'services/onboarding_services.dart';
import 'package:mech_assist/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mechAssist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue[900],
            foregroundColor: Colors.white,
          ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.blue[900],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const InitialScreen(), // Starting with the InitialScreen that contains the logic
    );
  }
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    bool isFirstTimeUser = await OnboardingService.isFirstTimeUser();

    if (isFirstTimeUser) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage1()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/Logo-modified.png', // Replace with your logo path
          width: 250,  // Adjust width according to your logo size
          height: 250, // Adjust height according to your logo size
        ),
      ),
    );
  }
}
