// import 'package:firebase_auth/firebase_auth.dart';
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   // Sign Up
//   Future<User?> signUp(String email, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return result.user;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   // Sign In
//   Future<User?> signIn(String email, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return result.user;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   // Sign Out
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   // Get Current User
//   User? getCurrentUser() {
//     return _auth.currentUser;
//   }
// }
