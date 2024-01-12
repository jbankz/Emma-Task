import 'package:shared_preferences/shared_preferences.dart';
import 'package:wat_mobile/app/core/router/page_router.dart';
import 'package:wat_mobile/app/stack/app.router.dart';

class SessionManager {
  SessionManager();

  SharedPreferences? sharedPreferences;

  Future<void> initilize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String loggedin = 'isLoggedIn';

  bool get isLoggedIn => sharedPreferences?.getBool(loggedin) ?? false;

  set isLoggedIn(bool login) => sharedPreferences?.setBool(loggedin, login);

  Future<bool> logOut() async {
    try {
      await sharedPreferences?.clear() ?? false;
      PageRouter.pushReplacement(Routes.signinView);
      return true;
    } catch (e) {
      return false;
    }
  }
}
