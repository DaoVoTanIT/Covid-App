import 'package:covidapp/infor_covid/presentation/screen/information.dart';
import 'package:flutter/material.dart';

import '../tab.dart';

class Routers {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (context) => TabBarNavigation());
      case 'LoginPage':
        return MaterialPageRoute(builder: (context) => Information());
      // case 'SignUpPage':
      //   return MaterialPageRoute(builder: (context) => SignUpPage());
      // case 'CurvedNavigationBarWidget':
      //   return MaterialPageRoute(
      //       builder: (context) => CurvedNavigationBarWidget());
      // case 'HomePage':
      //   return MaterialPageRoute(builder: (context) => RoomPage());
      // case 'MapPage':
      //   return MaterialPageRoute(builder: (context) => SearchMapPage());
      // case 'SavedRoomPage':
      //   return MaterialPageRoute(builder: (context) => FavoritePage());
      // case 'ProfilePage':
      //   return MaterialPageRoute(builder: (context) => ProfilePage());
      default:
        {
          return MaterialPageRoute(builder: (_) {
            return Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')));
          });
        }
    }
  }
}
