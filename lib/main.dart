import 'package:covidapp/home/presentation/screen/home.dart';
import 'package:covidapp/tab/presentation/screen/routes/router.dart';
import 'package:flutter/material.dart';

import 'tab/presentation/screen/routes/route_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //set up router
      initialRoute: RouteName.home,
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
