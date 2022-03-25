import 'package:covidapp/country/presentation/screen/covid_country_detail.dart';
import 'package:covidapp/infor_covid/presentation/screen/information.dart';
import 'package:covidapp/readnews/presentation/screen/readnews.dart';
import 'package:covidapp/splash/presentation/screen/splash.dart';
import 'package:flutter/material.dart';

import '../tab.dart';

class Routers {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (context) => IntroPage());
      case 'home':
        return MaterialPageRoute(builder: (context) => TabBarNavigation());
      case 'readnews':
        return MaterialPageRoute(builder: (context) => ReadNews());
      case 'information':
        return MaterialPageRoute(builder: (context) => Information());
      case 'country':
        return MaterialPageRoute(builder: (context) => CovidCountryDetail());
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
