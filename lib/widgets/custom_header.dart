import 'package:flutter/material.dart';
import '../screens/onboarding_screen.dart'; // Ensure this is correctly imported
import '../screens/chat_history_screen.dart'; // Ensure this is correctly imported

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[900],
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.menu), // Hamburger icon
        onPressed: () {
          Scaffold.of(context).openDrawer(); // Open the drawer for navigation
        },
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: const Icon(Icons.lightbulb_outline), // Bulb icon for onboarding
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OnboardingPage1()), // Navigate to onboarding
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MainPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the scaffold key to the scaffold
      appBar: const CustomHeader(title: 'Main Page'), // Use the CustomHeader here
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Chat History'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatHistoryScreen()), // Navigate to Chat History screen
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Main Page Content'),
      ),
    );
  }
}

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat History'),
      ),
      body: const Center(
        child: Text('Chat History Content'),
      ),
    );
  }
}
