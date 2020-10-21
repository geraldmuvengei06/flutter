// import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:back_to_basics/main_drawer.dart';
import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class CoresPage extends StatefulWidget {
  @override
  _CoresPageState createState() => _CoresPageState();
}

class _CoresPageState extends State<CoresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text( 'Core Values',
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

      drawer: MainDrawer(),

      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    

                    Container(
                      height : 12.0
                    ),
                    buildCardItem('The passion to know, love and become like Jesus Christ.', '1.jpg'),
                    buildCardItem('The truth and sufficiency of the scriptures for the whole of life.', '2.jpg'),
                    buildCardItem('The transforming power of the gospel.', '3.jpg'),
                    buildCardItem('The leading and empowering of the Holy Spirit.', '4.jpg'),
                    buildCardItem('Expectant faith and persevering prayer rooted in the promises of God.', '5.jpg'),
                    buildCardItem('The dignity and value of every person.', '6.jpg'),
                    buildCardItem('Love and grace expressed among us in community.', '7.jpg'),
                    buildCardItem('Families and relational networks in discipling the nations.', '8.jpg'),
                    buildCardItem('Interdependent relationships in the body of Christ in advancing the Gospel.', '9.jpg'),

                  ],
                ),
              ),
            ),
          ],
        )

      )
    );
  }

  
  
  Widget buildCardItem(String coreValue, String asset) {

    return Card(
      elevation: 2.0,
      color: Colors.white,
      // borderOnForeground: true,
      // shape: ShapeBorder,
      child: Container(
        padding: EdgeInsets.all(12.0),
        color: Theme.of(context).primaryColorLight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Image(
              image: AssetImage('assets/cores/' + asset),
              width: 80.0,
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              width: MediaQuery.of(context).size.width - 180.0,
              child: Text(coreValue,
                style: TextStyle(
                  fontSize: 18.0
                ),
              ), 
            )
          ]
        )
      )
    );
    
  }
}
