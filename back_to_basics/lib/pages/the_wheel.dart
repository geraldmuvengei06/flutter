import 'package:back_to_basics/main_drawer.dart';
import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
// import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class WheelPage extends StatefulWidget {
  final heroTag = 'assets/the_wheel.png';
  final basicName = 'The Wheel';
  final verseNumber = '12 verses';
  // final basicColor;

  // WheelPage({ this.heroTag, this.basicName, this.verseNumber, this.basicColor });
  @override
  _WheelPageState createState() => _WheelPageState();
}

class _WheelPageState extends State<WheelPage> {

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
          ShareButton()
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
                   
                    Container(
                      height: MediaQuery.of(context).size.height - 140.0,
                      width: MediaQuery.of(context).size.width,
                      child: DefaultTabController(
                        length: 12,
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
                                _buildTabMenu('A1'),
                                _buildTabMenu('A2'),
                                _buildTabMenu('A3'),
                                _buildTabMenu('A4'),
                                _buildTabMenu('A5'),
                                _buildTabMenu('A6'),
                                _buildTabMenu('A7'),
                                _buildTabMenu('A8'),
                                _buildTabMenu('A9'),
                                _buildTabMenu('A10'),
                                _buildTabMenu('A11'),
                                _buildTabMenu('A12'),
                                
                              ],
                              ),
                            ),

                            
                            
                          ),

                          body: TabBarView(
                            children: [
                            _buildVerseCard(
                              "Christ The Center", 
                              "1 Corinthians 5:17", 
                              'Therefore, if anyone is in Christ, he is a new creation, the old has gone, the new has come.'
                            ),
                            _buildVerseCard(
                              "Christ The Center",
                              "Galatians 2:20",
                              "I have been cruicified with Christ and I no longer live, but Christ lives in me. The life I now live in the body, I live by faith in the Son of God, who loved me and gave himself for me."
                            ),
                           
                            _buildVerseCard(
                              "Prayer",
                              "Philippians 4:6-7",
                              "Do not be anxious about anything, but in everything, by prayer and petition, with thanksgiving, present your requests to God. And the peace of God which transcends all understanding will guard yout hearts and your minds in Christ Jesus.",
                            ),
                            _buildVerseCard(
                              "Prayer",
                              'John 15:7',
                              "If you remain in me and my words remain in you, ask whatever you wish, and it will be given you."
                            ),
                            _buildVerseCard(
                              "Word",
                              '2nd Timothy 3:16-17',
                              'All scripture is God-breathed and is useful for teaching, rebuking, correcting and training in righteousness, so that the man of God may be thoroughly equiped for every good work.'
                            ),
                            _buildVerseCard(
                              'Word',
                              "Joshua 1:8",
                              'Keey this book of law always on yout lips; meditate on it day and night, so that you may be careful to do everything written in it. Then you will be prosperous and successiful.',
                            ),
                            _buildVerseCard(
                              "Fellowship",
                              'Hebrews 10:24-25',
                              "And let us consider how we may spur one another on towards love and good deeds, let us not stop meeting together, as some are in the habit of doing, but let us encourage one another - and all the more as you see the day approaching."
                            ),
                            _buildVerseCard(
                              "Fellowship",
                              "1 John 1:3",
                              "We proclaim to you what we have seen and heard, so that you may also have fellowship with us. And our fellowship is with the Father and with his son, Jesus Christ."
                            ),
                            _buildVerseCard(
                              'Witnessing',
                              'Matthew 4:19',
                              "'Come follow me', Jesus said, 'and I will make you fishers of men.'"  
                            ),
                            _buildVerseCard(
                              'Witnessing',
                              'Romains 1:16',
                              "I am not ashamed of the gospel, because it is the power of God for the salvation of everyone who believes: first for the Jew, then for the Gentile."
                            ),
                            _buildVerseCard(
                              'Obedience to Christ',
                              'John 14:21',
                              "Whoever has my commands and obeys them is the one who loves me. He who loves me will be loved bu my Father, and I too  will love him and show myself to him."
                            ),
                            _buildVerseCard(
                              'Obedience to Christ',
                              'Romans 12:1',
                              "Therefore, I urge you, brothers, in view of God's mercy, to offer your bodies as living sacrifices, holy and pleasing to God - this is your true and proper worship."
                            )
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
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
    ),
    );
  }

  selectCard(verseTitle){
    setState(() {
      // selectedCard = verseTitle;
    });
  }
}