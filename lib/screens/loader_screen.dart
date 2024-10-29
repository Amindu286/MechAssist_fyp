// import 'package:flutter/material.dart';
// import 'package:mechassist/screens/dashboard_screen.dart';
// import '../screens/onboarding_screen.dart';
// import '../services/onboarding_services.dart';
//
// class LoaderScreen extends StatefulWidget {
//   const LoaderScreen({super.key});
//
//   @override
//   _LoaderScreenState createState() => _LoaderScreenState();
// }
//
// class _LoaderScreenState extends State<LoaderScreen> {
//   bool _showGif = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _startLoading();
//   }
//
//   void _startLoading() async {
//     bool isFirstTimeUser = await OnboardingService.isFirstTimeUser();
//
//     Future.delayed(const Duration(seconds: 2), () {
//       setState(() {
//         _showGif = true;
//       });
//
//       // Navigate to the appropriate screen based on whether it's the first-time user or not
//       Future.delayed(const Duration(seconds: 3), () { // Optional delay to allow GIF to show briefly
//         if (isFirstTimeUser) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => OnboardingPage1()),
//           );
//         } else {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => DashboardScreen()),
//           );
//         }
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(
//               'assets/Logo-modified.png', // Replace with your logo path
//               width: 150,  // Adjust width according to your logo size
//               height: 150, // Adjust height according to your logo size
//             ),
//             if (_showGif) // Conditionally display the GIF
//               Image.asset(
//                 'assets/483.gif', // Replace with your GIF path
//                 width: 200,  // Ensure appropriate width
//                 height: 200, // Ensure appropriate height
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
