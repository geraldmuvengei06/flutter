// import 'package:back_to_basics/home_page.dart';
import 'package:back_to_basics/main_router.dart';
import 'package:flutter/material.dart';
// import 'package:flutterapp/settings_page.dart';

// import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Back To Basics',
      theme: ThemeData.light().copyWith(
       primaryColor: Color(0xFF01524B),
       accentColor: Color(0xFFA27500),
       primaryColorLight: Color(0xFFFFFFFF),
      ),
      initialRoute: '/',
      // home: MyHomePage(),
      
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
