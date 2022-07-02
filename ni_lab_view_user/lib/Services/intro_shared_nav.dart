import 'package:shared_preferences/shared_preferences.dart';

class SetSharedPreferencesForsIntroScreens {
//TODO: Change Path on Logout Feature also.

  // Change Path to Direct Initialzing Screen
  Future chaangeIntroRoute(bool value) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      await sharedPreferences.setBool("throughIntroRoute", value);
    } catch (e) {
      print(e.toString());
    }
  }
}
