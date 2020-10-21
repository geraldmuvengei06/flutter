import 'package:back_to_basics/main_drawer.dart';
import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class WordHand extends StatefulWidget {
  final heroTag = 'assets/word_hand.jpg';
  final basicName = 'Word Hand';
  final verseNumber = '5 verses';
  // final basicColor;
  // WordHand({ this.heroTag, this.basicName, this.verseNumber, this.basicColor });
  @override
  _WordHandState createState() => _WordHandState();
}

class _WordHandState extends State<WordHand> {

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
                                _buildTabMenu('D1'),
                                _buildTabMenu('D2'),
                                _buildTabMenu('D3'),
                                _buildTabMenu('D4'),
                                _buildTabMenu('D5'),
                              ],
                              ),
                            ),
                          ),

                          body: TabBarView(
                            children: [
                            _buildVerseCard(
                              "Hearing", 
                              "Romans 10:17", 
                              "Consequently, faith comes from hearing the message, and the message is heard through the word og God"
                            ),
                            _buildVerseCard(
                              "Reading", 
                              "Revelation 1:3",
                              "Blessed is the one who reads aloud the word of this prophecy, and blessed are those who hear it and take to heart what is written in it, because the time is near."
                            ),
                            _buildVerseCard(
                              'Studying',
                              "Acts 17:11",
                              "Now the Berean Jews were of more noble character than those in Thessalonica, for they received the message with great eagerness and examined the Scriptures every day to see if what Paul said was true."
                            ),
                            _buildVerseCard(
                              "Memorizing",
                              "Psalms 119:9 and 11",
                              "How can a young man keep his way pure? By living according to your word. I have hidden your word in my heart that I might not sin against you."
                            ),
                            _buildVerseCard(
                              'Meditating',
                              'Psalm 1:2,3',
                              'Blessed is the one who does not walk in step with the wicked or stand in ther way that sinners take or sit in the company of mockers, but his delight is in the law of the LORD, and who meditates on his law day and night.'
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