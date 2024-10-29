import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static const String _firstTimeUserKey = 'first_time_user';

  static Future<bool> isFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTimeUserKey) ?? true;
  }

  static Future<void> setFirstTimeUser(bool isFirstTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTimeUserKey, isFirstTime);
  }
}
