import 'package:flutter/material.dart';

import 'Screens/DrawerScreens/about_ni_lab_view_screen.dart';
import 'Screens/DrawerScreens/contact_us_screen.dart';
import 'Screens/DrawerScreens/user_profile.dart';
import 'Screens/boarding_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/initializing_screen.dart';
import 'Screens/notification_details_screen.dart';

class RouteGenerator {
  // bool wentThrough = false;

  RouteGenerator() {
    // checkRoute();
  }

  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case '/initializingScreen':
        return MaterialPageRoute(builder: (_) => const InitializingScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/userProfile':
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());
      case '/aboutNiLabView':
        return MaterialPageRoute(builder: (_) => const AboutNiLabViewScreen());
      case '/ContactScreen':
        return MaterialPageRoute(builder: (_) => const ContactScreen());
      case '/notificationScreen':
        List? args = routeSettings.arguments as List;
        return MaterialPageRoute(
            builder: (_) => NoticeScreen(
                  noticeID: args[0],
                  noticeTitle: args[1],
                  noticeBody: args[2],
                  noticeImage: args[3],
                  noticeDate: args[4],
                ));
      default:
        return _errorRoute();
    }
  }

  // Future checkRoute() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   final throughRoute = sharedPreferences.getBool("throughIntroRoute");
  //   wentThrough = throughRoute!;
  //   return throughRoute;
  // }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      ),
    );
  }
}
