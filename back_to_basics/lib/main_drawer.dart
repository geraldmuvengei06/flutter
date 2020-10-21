
// import 'package:back_to_basics/home_page.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).primaryColor,
          child: Column(
          children: <Widget>[
            Container(
              // width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                color: Theme.of(context).primaryColorLight,
                child: Center(
                child: Column(children: <Widget>[
                  Container(
                    height: 60,
                    width: 200,
                    margin: EdgeInsets.only(top: 16.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(image: AssetImage('assets/logo2.png')),
                    )
                  ),

                  SizedBox(height: 2.0),

                  Text('To know Christ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                      fontSize: 16.0
                    ),
                  ),

                  Text('and to make Him known',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                      fontSize: 16.0
                    ),
                  ),

                  // SizedBox(height: 20.0),

                  

                ],)
              ),
              )
            ),
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 156.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [

                  

                  // Container(
                  //   color: Theme.of(context).primaryColorLight,
                  //   height: 1.0,
                  // ),

                  
                  ListTile(
                    leading: Icon(Icons.home, color: Theme.of(context).primaryColorLight,),
                    title: Text('Home', style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).primaryColorLight
                    )),
                    onTap: () {
                      Navigator.of(context).pop();
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
                      Navigator.of(context).pushNamed('/', arguments: "Home page");
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.play_arrow, color: Theme.of(context).primaryColorLight,),
                    title: Text('Calling', style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).primaryColorLight
                    )),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/vision');
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.check_box_outline_blank, color: Theme.of(context).primaryColorLight,),
                    title: Text('Core Values', style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).primaryColorLight
                    )),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/cores');
                    },
                  ),

                  
                  Spacer(),
                  
                  

                  ListTile(
                    leading: Icon(Icons.person, color: Theme.of(context).primaryColorLight,),
                    title: Text('Meet The Author', style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).primaryColorLight,
                    )),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/author');
                    },
                  ),
                ]
              ),
            ),

           
            
          ],
        )
        )
    );
  }
}