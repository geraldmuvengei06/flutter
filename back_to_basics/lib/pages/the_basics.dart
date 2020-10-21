import 'package:back_to_basics/main_drawer.dart';
import 'package:back_to_basics/pages/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class BasicsPage extends StatefulWidget {
  final heroTag = 'assets/the_basics.jpg';
  final basicName = 'Prayer Promises';
  final verseNumber = '13 verses';
  // final basicColor;

  // BasicsPage({ this.heroTag, this.basicName, this.verseNumber, this.basicColor });
  @override
  _BasicsPageState createState() => _BasicsPageState();
}

class _BasicsPageState extends State<BasicsPage> {

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
                   
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.verseNumber,
                          style: TextStyle(
                            // fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Theme.of(context).accentColor
                          ),
                        ),
                        
                        Container(
                          width:50.0,
                          height: 26.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xFFA27500)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget> [
                              
                              Text('NIV',
                                style: TextStyle(
                                  fontSize: 15.0,
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
                      height: MediaQuery.of(context).size.height - 120.0,
                      width: MediaQuery.of(context).size.width,
                      child: DefaultTabController(
                        length: 13,
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
                                _buildTabMenu('1'),
                                _buildTabMenu('2'),
                                _buildTabMenu('3'),
                                _buildTabMenu('4'),
                                _buildTabMenu('5'),
                                _buildTabMenu('6'),
                                _buildTabMenu('7'),
                                _buildTabMenu('8'),
                                  _buildTabMenu('9'),
                                  _buildTabMenu('10'),
                                  _buildTabMenu('11'),
                                  _buildTabMenu('12'),
                                  _buildTabMenu('13'),
                                
                              ],
                              ),
                            ),
                          ),

                          body: TabBarView(
                            children: [
                            _buildVerseCard(
                              'Genesis 12:1-3',
                              'The LORD had said to Abram,\n"Go from your country, your people and your father\'s household to the land I will show you.\nI will make you into a great nation, and I will bless you;\nI will make your name great, and you will be a blessing.\nI will bless those who bless you, and whoever curses you I will curse;\n and all people on earth will be blessed through you."'
                            ),
                            _buildVerseCard(
                              'Genesis 15:5-6',
                              'He took him outside and said\n Look up at the sky and count the stars - if indeed you can count them."\n Then he said to him, \n"So shall your offspring be." \n Abram believed the LORD, and he credited it to him as righteousness.'

                            ),
                              _buildVerseCard(
                              'Genesis 17:1-2',
                              'When Abram was ninety-nine years old, the LORD appeared to him and said, "I am God Almighty, walk before me faithfully and be blameless. Then I will make my covenant between me and you and will greatly increase your numbers."'
                            ),

                            _buildVerseCard(
                                  '1st Chronicles 4:9-10',
                                  'Jabez was more honourable than his brothers. His mother has named him Jabez, saying,\n"I gave birth to him in pain."\n Jabez cried out to the God of Israel, \n "Oh, that you would bless me and enlarge my territory! Let your hand be with me, and keep me from pain." \n And God granted his request.'
                              ),
                              _buildVerseCard(
                              'Psalms 2:8',
                              'Ask me, and I will make the nations your inheritance, the ends of the earth your possession.'
                            ),
                            _buildVerseCard(
                              'Isaiah 41:10',
                              'So do not fear, for I am with you; do not be dismayed, for I am your God. I will strengthen you and help you; I will uphold you with my righteous right hand.'
                            ),
                            _buildVerseCard(
                              'Isaiah 54:10',
                              'Though the mountains be shaken and the hills be moved, yet my unfailing love for you will not be shaken nor my covenant of peace be removed," says the LORD, who has compassion on you.'
                            ),
                            _buildVerseCard(
                                  'Isaiah 60:21-22',
                                  'Whoever has my commands and obeys them, he is the one who loves me. He who loves me will be loved by my Father, and I too will love him and show myself to him.'
                              ),
                            _buildVerseCard(
                              'Isaiah 61:1-3',
                              'The Spirit of the Sovereign LORD is on me, because the LORD has anointed me to proclaim good news to the poor. He has sent me to bind up the brokenhearted, to proclaim freedom for the captives and release from darkness for the prisoners, to proclaim the year of the LORD\'s favor and the day of vengeance of our God, to comfort all who mourn and provide for those who grieve in Zion - to bestow on them a crown of beauty instead of ashes, the oil of joy instead of mourning, and a garment of praise instead of a spirit of despair. They will be called oaks of righteousness, a planting of the LORD for the display of his Splendor.'
                            ),
                            
                              _buildVerseCard(
                                  'Zechariah 10:4-5',
                                  'From Judah will come the cornerstone, from him the tent peg, from him the battle bow, from him every ruler. Together they will be like warriors in battle tramping their enemy into the mud of the streets. They will fight because the LORD is with them, and they will put the enemy horsemen to shame.'
                              ),
                              _buildVerseCard(
                                  'Matthew 9:35-38',
                                  'Jesus went through all the towns and villages, teaching in their synagogues, proclaiming the good news of the kingdom and healing every disease and sickness. When he saw the crowds, he had compassion on them, because they were harassed and helpless, like sheep without a shepherd. Then he said to his disciples, \n"The harvest is plentiful but the workers are few. Ask the Lord of the harvest, therefore, to send out workers into his harvest field."'
                              ),
                              _buildVerseCard(
                                  'Matthew 28:18-20',
                                  'Then Jesus came to them and said, \n"All authority in heaven and on earth has been given to me. Therefore go and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit, and teaching them to obey everything I have commanded you. And surely I am with you always, to the very end of the age."'
                              ),
                            _buildVerseCard(
                              'John 15:16',
                              'You did not choose me, but I chose you and appointed you so that you might go and bear fruit - fruit the will last - and so that whatever you ask in my name the Father will give you.'
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
      )
    );


  }

  Widget _buildTabMenu(String title){
    return Tab(text: title.toUpperCase());
  }
  
  Widget _buildVerseCard(String verseRef, String verse) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

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
            fontSize: 15.6,
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