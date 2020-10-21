import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.share),
      color: Colors.white,
      onPressed: () {
        Share.share('Whatsup, check out Back to Basics memory verse app. https://example.com', subject: 'The Navigators Back to Basics app!');
      }
    );
  }
}

