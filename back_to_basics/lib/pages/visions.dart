// import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:back_to_basics/main_drawer.dart';
import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VisionPage extends StatefulWidget {
  @override
  _VisionPageState createState() => _VisionPageState();
}

class _VisionPageState extends State<VisionPage> {

  _launchURL() async {
    const url = 'https://kenyanavigators.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text( 'Calling',
          style: TextStyle(
            fontFamily: 'Montserrat', 
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white 
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          ShareButton()
        ],

      ),

      body: Container(
        height: MediaQuery.of(context).size.height - 80.0,
        // margin: EdgeInsets.only(top: 40.0),
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        color: Theme.of(context).primaryColorLight,
        // decoration: new BoxDecoration(
        //   color: Theme.of(context).primaryColorLight,
        //   borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        // ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/logo2.png'),
                height: 60.0,
              ),
              Container(
                height: 10.0,
              ),
              Text('The Navigators calling is: ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: Theme.of(context).accentColor,
                  fontFamily: 'montsserat'
                ),
              ),
              Container(
                height : 30.0
              ),
              Text(
                'To advance the Gospel of Jesus and His Kingdom into the nations through spiritual generations of laborers living and discipling among the lost.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0
                ),
              ),

              Container(
                height : 50.0
              ),

              RaisedButton(
                elevation: 10.0,
                textColor: Theme.of(context).primaryColorLight,
                padding: EdgeInsets.all(0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor
                    ]),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Icon(Icons.link,
                          color: Theme.of(context).primaryColorLight
                        ),
                        SizedBox(width: 10.0),
                        Text('Website',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColorLight
                          ),
                        )
                      ]
                    ),
                  ),
                ),
                onPressed: _launchURL
              ),
            ],
          )
        ),
        
      ),
      
    );
  }
}