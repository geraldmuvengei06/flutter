import 'package:back_to_basics/main_drawer.dart';
import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class PrayerHand extends StatefulWidget {
  final heroTag = 'assets/prayer_hand.jpg';
  final basicName = 'Prayer Hand';
  final verseNumber = '5 verses';
  // final basicColor;

  // PrayerHand({ this.heroTag, this.basicName, this.verseNumber, this.basicColor });
  @override
  _PrayerHandState createState() => _PrayerHandState();
}

class _PrayerHandState extends State<PrayerHand> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text( widget.basicName,
          style: TextStyle(
            fontFamily: 'Montserrat', 
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white 
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          ShareButton(),
        ],

      ),

      drawer: MainDrawer(),

      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white
              ),



              Positioned(
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.verseNumber,
                          style: TextStyle(
                            // fontFamily: 'Montserrat',
                            fontSize: 16.0,
                            color: Theme.of(context).accentColor
                          ),
                        ),
                        
                        Container(
                          width:60.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xFFA27500)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget> [
                              
                              Text('NIV',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Montserrat',
                                  backgroundColor: Theme.of(context).accentColor,
                                  color: Theme.of(context).primaryColorLight
                                )
                              ),
                            
                            ]
                          ),

                        )

                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 140.0,
                      width: MediaQuery.of(context).size.width,
                      child: DefaultTabController(
                        length: 5,
                        child: Scaffold(
                          backgroundColor: Colors.white,
                          appBar: PreferredSize(
                            preferredSize: Size.fromHeight(50.0),
                            child: AppBar(
                              automaticallyImplyLeading: false,
                              leading: new Container(),
                              elevation: 0,
                              backgroundColor: Colors.white,
                              
                              bottom: TabBar( 
                                isScrollable: true,
                                labelPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                                indicatorColor: Theme.of(context).accentColor, 
                                labelColor: Theme.of(context).accentColor,
                                unselectedLabelColor: Theme.of(context).primaryColor,
                                tabs: <Widget>[
                                _buildTabMenu('C1'),
                                _buildTabMenu('C2'),
                                _buildTabMenu('C3'),
                                _buildTabMenu('C4'),
                                _buildTabMenu('C5'),
                              ],
                              ),
                            ),
                          ),

                          body: TabBarView(
                            children: [
                            _buildVerseCard(
                              "Confession",
                              "1 John 1:9",
                              'If we confess our sins, he is faithful and just and will forgive us our sins and purify us from all unrighteousness.'
                            ),
                            _buildVerseCard(
                              "Petition",
                              "1 Samuel 1:27",
                              'I prayed for this child, and the Lord has  granted me what I asked of him.'
                            ),
                            _buildVerseCard(
                              'Intercession',
                              'Ephesians 6:18-19',
                              'And pray in the Spirit on all occasions with all kinds of prayers and requests. With this in mind, be alert and always keep on praying for all the Lord’s people. Pray also for me, that whenever I speak, words may be given me so that I will fearlessly make known the mystery of the gospel..'
                            ),
                            _buildVerseCard(
                              "Thanksgiving",
                              'Ephesians 5:20',
                              '..always giving  thanks to God the Father for everything, in the name of our  Lord Jesus Christ.'
                            ),
                            _buildVerseCard(
                              "Praise",
                              'Psalm 146:1-2',
                              'Praise the Lord.  Praise the Lord, my soul. I will praise the Lord all my life; I will sing praise to my God as long as I live.'
                            ),
                          ]),


                        ),

                      )
                    )
                  ],
                ),
              ),
            
            ],
          ) 
        ]
      ),
    );


  }

  Widget _buildTabMenu(String title){
    return Tab(text: title.toUpperCase());
  }
  
  Widget _buildVerseCard(String verseTitle, String verseRef, String verse) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(verseTitle.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            
          ),
        ),
        SizedBox(height: 6.0,),
        Text(verseRef,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Theme.of(context).accentColor
          ),
        ),
        SizedBox(height: 12.0,),
        Text(verse,
          textAlign: TextAlign.center,
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        )

      ],
    );
  }

  selectCard(verseTitle){
    setState(() {
      // selectedCard = verseTitle;
    });
  }
}