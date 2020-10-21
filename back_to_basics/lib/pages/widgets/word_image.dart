import 'package:flutter/material.dart';

class WordImage extends StatefulWidget {
  @override
  _WordImageState createState() => _WordImageState();
}

class _WordImageState extends State<WordImage> {
  final title = "Prayer Hand Illustration";
  final image = 'assets/word_hand.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
          ),
          shape: BoxShape.rectangle,
        ),
        height: 340.0,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
