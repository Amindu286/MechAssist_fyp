// import 'package:geolocator/geolocator.dart';
// import '../screens/page_c.dart';
//
// class Permissions {
//   static Future<bool> checkPermission() async {
//     bool serviceEnabled;
//     LocationServicesStatus status;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return false;
//     }
//
//     status = await Geolocator.checkPermission();
//     return status == LocationServicesStatus.enabled;
//   }
//
//   static Future<void> requestPermission() async {
//     bool serviceEnabled;
//     LocationServicesStatus status;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return;
//     }
//
//     status = await Geolocator.checkPermission();
//     if (status != LocationServicesStatus.enabled) {
//       final permission = await Geolocator.requestPermission();
//       if (permission == LocationServicesStatus.granted) {
//         print("Location services granted");
//       } else {
//         print("Location services denied");
//       }
//     }
//   }
// }
