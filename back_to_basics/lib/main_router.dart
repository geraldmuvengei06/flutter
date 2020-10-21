import 'package:back_to_basics/pages/author.dart';
import 'package:back_to_basics/pages/widgets/word_image.dart';
import 'package:flutter/material.dart';

import 'package:back_to_basics/home_page.dart';
import 'package:back_to_basics/pages/cores.dart';
import 'package:back_to_basics/pages/prayer_hand.dart';
import 'package:back_to_basics/pages/the_basics.dart';
import 'package:back_to_basics/pages/the_bridge.dart';
import 'package:back_to_basics/pages/the_wheel.dart';
import 'package:back_to_basics/pages/visions.dart';
import 'package:back_to_basics/pages/word_hand.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings){
    // final args = settings.arguments;

    switch (settings.name) {
      case '/': 
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/vision':
        return MaterialPageRoute(builder: (_) => VisionPage());
      case '/cores':
        return MaterialPageRoute(builder: (_) => CoresPage());
      case '/author':
        return MaterialPageRoute(builder: (_) => AuthorPage());
      case '/basics': 
        return MaterialPageRoute(builder: (_) => BasicsPage());
      case '/prayer':
        return MaterialPageRoute(builder: (_) => PrayerHand());
      case '/word':
        return MaterialPageRoute(builder: (_) => WordHand());
      case '/wheel':
        return MaterialPageRoute(builder: (_) => WheelPage());
      case '/bridge':
        return MaterialPageRoute(builder: (_) => BridgePage());
      case '/word-image':
        return MaterialPageRoute(builder: (_) => WordImage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('error'),
        ),
        body: Center(
          child: Text('ERROR')
        ),
      );
    });
  }



}
