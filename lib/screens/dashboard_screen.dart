import 'package:flutter/material.dart';
import 'package:mech_assist/widgets/custom_header.dart';
import '../widgets/bottom_nav.dart';
import '../screens/page_a.dart';
import '../screens/page_b.dart' as page_b;
import '../screens/page_c.dart';
import '../screens/page_d.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    PageAScreen(),
    page_b.PageBScreen(),
    PageCScreen(),
    const PageDScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(title: 'MechAssist'),
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: _navBarItems,
      ),
    );
  }
}
const _navBarItems = [
  NavigationDestination(
    icon: Icon(Icons.car_crash_outlined),
    selectedIcon: Icon(Icons.car_crash_rounded),
    label: 'Extra',
  ),
  NavigationDestination(
    icon: Icon(Icons.chat_bubble_outline),
    selectedIcon: Icon(Icons.chat_bubble),
    label: 'Chatbot',
  ),
  NavigationDestination(
    icon: Icon(Icons.map_outlined),
    selectedIcon: Icon(Icons.map),
    label: 'Map',
  ),
  NavigationDestination(
    icon: Icon(Icons.settings_outlined),
    selectedIcon: Icon(Icons.settings),
    label: 'Settings',
  ),
];