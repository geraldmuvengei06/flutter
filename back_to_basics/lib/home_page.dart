import 'package:back_to_basics/main_drawer.dart';
// import 'package:back_to_basics/main_header.dart';
import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

// import 'detailsPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class ScreenArguments {
  final String imgPath;
  final String basicName;
  final String basicNumber;

  ScreenArguments(this.imgPath, this.basicName, this.basicNumber);
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text(
          'Back to Basics',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[ShareButton()],
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Row(children: <Widget>[
                    Text('Memory ',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 18.0)),
                    Text(
                      'Verses',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    )
                  ]),
                ),
                SizedBox(height: 18.0),
                Container(
                  height: MediaQuery.of(context).size.height - 142.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      children: <Widget>[
                        buildBasicItem('/wheel', 'assets/the_wheel.png',
                            'The Wheel', '12 Verses', 'purple'),
                        buildBasicItem('/bridge', 'assets/the_bridge.png',
                            'The Bridge', '6 Verses', 'deepOrange[800]'),
                        buildBasicItem('/prayer', 'assets/prayer_hand.jpg',
                            'Prayer Hand', '5 Verses', 'greenAccent[400]'),
                        buildBasicItem('/word', 'assets/word_hand.jpg',
                            'Word Hand', '5 Verses', 'lightBlue[600]'),
                        buildBasicItem('/basics', 'assets/the_basics.jpg',
                            'Prayer Promises', '13 Verses', 'blue'),
                        SizedBox(height: 10.0)
                      ]),
                )
              ],
            ),
          )),
    );
  }

  Widget buildBasicItem(String route, String heroTag, String basicName,
      String verseNumber, String basicColor) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: InkWell(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => DetailsPage(heroTag: imgPath, basicName: basicName, verseNumber: verseNumber, basicColor: basicColor)
            // ));
            Navigator.of(context).pushNamed(route);
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Row(
                  children: [
                    Hero(
                      tag: basicName,
                      child: Image(
                        image: AssetImage(heroTag),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 100.0,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(basicName,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  color: Theme.of(context).primaryColor)),
                          Text(verseNumber,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Montserrat',
                                  color: Theme.of(context).accentColor)),
                        ])
                  ],
                )),
              ])),
    );
  }
}
