import 'package:back_to_basics/main_drawer.dart';
import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class BridgePage extends StatefulWidget {
  final heroTag = 'assets/the_bridge.png';
  final basicName = 'The Bridge';
  final verseNumber = '6 verses';
  // final basicColor;

  // BridgePage({ this.heroTag, this.basicName, this.verseNumber, this.basicColor });
  @override
  _BridgePageState createState() => _BridgePageState();
}

class _BridgePageState extends State<BridgePage> {

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
                        length: 6,
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
                                _buildTabMenu('B1'),
                                _buildTabMenu('B2'),
                                _buildTabMenu('B3'),
                                _buildTabMenu('B4'),
                                _buildTabMenu('B5'),
                                _buildTabMenu('B6'),
                                
                              ],
                              ),
                            ),
                          ),

                          body: TabBarView(
                            children: [
                            _buildVerseCard(
                              "God's Plan", 
                              "Jeremiah 29:11", 
                              '"For I know the plans I have for you," declares the LORD, "plans to prosper you and not to harm you, plans to give you hope and a future."'
                            ),
                            _buildVerseCard(
                              "Man's Problem", 
                              "Isaiah 59:2",
                              'But your iniquities have separated you from your God; your sins have hidden his face from you, so that he will not hear.'
                            ),
                            _buildVerseCard(
                              'Jesus The Man',
                              '1st Timothy 2:5-6a',
                              'For there is one God and one mediator between God and man, the man Christ Jesus, who gave himself as a ransom for all men.'
                            ),
                            _buildVerseCard(
                              "God's Remedy",
                              '1 Peter 3:18',
                              'For Christ died for sins once for all, the righteous for the unrighteousness, to bring you to God. He was put to death in the body but made alive by the spirit.'
                            ),
                            _buildVerseCard(
                              "Man's Response",
                              'John 5:24',
                              'I tell you the truth, whoever hears my word and believes him who sent me has eternal life and will not be condemned; he has crossed over from death to life.'
                            ),
                            _buildVerseCard(
                              "God's Promise",
                              'John 1:12',
                              'Yet to all who received him, to those who believed in his name, he gave the right to become children of God.'
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
    return Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
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
        )
    );
  }

  selectCard(verseTitle){
    setState(() {
      // selectedCard = verseTitle;
    });
  }
}