import 'package:back_to_basics/main_drawer.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final basicName;
  final verseNumber;
  final basicColor;

  DetailsPage({ this.heroTag, this.basicName, this.verseNumber, this.basicColor });
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

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
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white 
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            color: Colors.white,
            onPressed: () {},
          )
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
                color: Colors.transparent 
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),

              Center(
                // top: 10.0,
                // left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                  tag: widget.heroTag, 
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.heroTag),
                        fit: BoxFit.cover
                      ),
                      shape: BoxShape.circle,
                    ),
                    height: 120.0,
                    width: 120.0,
                  ) 
                ),
              ),

              Positioned(
                top: 100.0,
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
                    SizedBox(height: 20.0),
                    Container(
                      height: MediaQuery.of(context).size.height - 400.0,
                      width: MediaQuery.of(context).size.width,
                      child: DefaultTabController(
                        length: 8,
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
                                
                              ],
                              ),
                            ),
                          ),

                          body: TabBarView(
                            children: [
                              _buildVerseCard(
                              'Christ The Center',
                              '2nd Corinthians 5:17',
                              'Therefor, if anyone is in Christ, he is a new creation. The old has gone, the new has come.'
                            ),
                            _buildVerseCard(
                              'Christ The Center',
                              'Galatians 2:20',
                              'I have been cruicified with Christ and I no longer live but Christ lives in me. The life I live in the body, I live by faith in the son of God who loved me and gave himself for me.'
                            ),
                            _buildVerseCard(
                              'The Word',
                              '2nd Timothy 3:16-17',
                              'All scripture is God breathed and is useful for teaching, rebuking, correcting and training in righteousness, so that the man of God mab be thouroughly equiped for every good work.'
                            ),
                            _buildVerseCard(
                              'Prayer',
                              'Phillipians 4:6-7',
                              'Do not be anxious about anything, but in everything, by prayer and petition, with thankgiving, present your requests to God. And the peace of God, which trascends all understanding will guard your hearts and your minds in Christ Jesus'

                            ),
                            _buildVerseCard(
                              'Witnessing',
                              '1st Peter 3:15',
                              'But in your hearts set apart Christ as Lord. Always be prepared to give an answer to everyone who asks you to give the reason for the hope that you have. But do this with gentleness and respect.'
                            ),
                            _buildVerseCard(
                              'Testimony',
                              'Mark 5:19',
                              'Jesus did not let him but said, "Go home to your family and tell them how much the Lord has done for you, and how he has had mercy on you."'
                            ),
                            _buildVerseCard(
                              'Fellowship',
                              'Hebrews 10:24-25',
                              'And let us consider how we may spur one another on towards love and good deeds. Let us not give up meeting together, as some are in the harbit of doing, but let us encourage one another - and all the more as you see the Day approaching.'
                            ),
                            _buildVerseCard(
                              'Obedience',
                              'John 14:21',
                              'Whoever has my commands and obeys them, he is the one who loves me. He who loves me will be loved by my Father, and I too will love him and show myself to him.'
                            )
                          ]),

                           
                          floatingActionButton: FloatingActionButton(onPressed: null,
                            backgroundColor: Theme.of(context).accentColor,
                            child: IconButton(icon: Icon(Icons.share, 
                              color: Theme.of(context).primaryColorLight), 
                              // color: ,
                              onPressed: null,
                            ),
                            elevation: 5.0,
                          ),
                          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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