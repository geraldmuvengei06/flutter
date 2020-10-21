//import 'package:back_to_basics/main_header.dart';
// import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class AuthorPage extends StatelessWidget {

  _launchURL() async {
    const url = 'https://thundersoftwares.com';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text( 'Meet the Author',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        centerTitle: true,

      ),

      body: Container(
        height: MediaQuery.of(context).size.height - 100.0,
        margin: EdgeInsets.only(top: 40.0),
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        ),

        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              CircularProfileAvatar(
              '', //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
              radius: 80, // sets radius, default 50.0
              backgroundColor: Colors.transparent, // sets background color, default Colors.white
              borderWidth: 10,  // sets border, default 0.0
              initialsText: Text(
                "GM",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),  // sets initials text, set your own style, default Text('')
              borderColor: Theme.of(context).primaryColor, // sets border color, default Colors.white
              elevation: 5.0, // sets elevation (shadow of the profile picture), default value is 0.0
              foregroundColor: Theme.of(context).primaryColor.withOpacity(0.5), //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
              cacheImage: true, // allow widget to cache image against provided url
              onTap: () {
//                print('adil');
              }, // sets on tap
              showInitialTextAbovePicture: true, // setting it true will show initials text above profile picture, default false
            ),
                Container(
                  height: 10.0,
                ),
                Text('Gerald Muvengei ',
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
                Text('geraldmuvengei06@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                ),
                SizedBox(height: 12.0,),
                Text('+254798931277',
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
