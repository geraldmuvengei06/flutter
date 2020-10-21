import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 50.0,
//          width: 200.0,
          margin: EdgeInsets.all(4.0),

          // MainAxisAlignment.center,
          // decoration: BoxDecoration(
          //   shape: BoxShape.rectangle,
          //   image: DecorationImage(image: AssetImage('assets/logo.png'))
          // ),
        ),

          IconButton(
            icon: Icon(Icons.share),
            color: Colors.white,
              onPressed: () {
                Share.share('Whatsup, check out Back to Basics memory verse app. Download from https://www.mediafire.com/folder/dygekumq48yrx/', subject: 'The Navigators Back to Basics app!');
              }
          )      ], 
    );
  }
}