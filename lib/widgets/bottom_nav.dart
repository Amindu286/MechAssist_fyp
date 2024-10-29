// import 'package:flutter/material.dart';
//
// class BottomNav extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   const BottomNav({required this.currentIndex, required this.onTap, Key? key}) : super(key: key);
//
//   static const List<NavigationDestination> _navBarItems = [
//     NavigationDestination(
//       icon: Icon(Icons.home_outlined),
//       selectedIcon: Icon(Icons.home_rounded),
//       label: 'Page A',
//     ),
//     NavigationDestination(
//       icon: Icon(Icons.chat_outlined),
//       selectedIcon: Icon(Icons.chat),
//       label: 'Dashboard',
//     ),
//     NavigationDestination(
//       icon: Icon(Icons.person_outline_rounded),
//       selectedIcon: Icon(Icons.person_rounded),
//       label: 'Page C',
//     ),
//     NavigationDestination(
//       icon: Icon(Icons.settings_outlined),
//       selectedIcon: Icon(Icons.settings),
//       label: 'Page D',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: onTap,
//       backgroundColor: Colors.blue[900],
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.grey,
//       items: _navBarItems
//           .map(
//             (destination) => BottomNavigationBarItem(
//           icon: destination.icon,
//           label: destination.label,
//         ),
//       )
//           .toList(),
//     );
//   }
// }
