import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:premiercoach/HomeUI/DetailsPage.dart';
import 'package:premiercoach/HomeUI/PredictWidget.dart';
import 'package:premiercoach/HomeUI/TableWidget.dart';
class HomePage extends StatefulWidget {
  static final String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff37003C));

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff37003C),
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xff00FF87),
        leading: Container(
          child: IconButton(icon: SvgPicture.asset("assets/images/menu_icon.svg",color: Color(0xff37003C),height: 30,width: 30,), onPressed: (){
            _scaffoldKey.currentState.openDrawer();
          }),
        ),
      ),
      drawer: Drawer(
        elevation: 0.0,
        child: drawerUI(),
      ),
      body: _selectedIndex == 0? homeWidget():_selectedIndex == 1? predictWidget():tableWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff00FF87),
          elevation: 5.0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.brightness_5),
              title: Text('Predict'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.border_all),
              title: Text('Table'),
            ),
          ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color(0xff37003C),
        selectedItemColor: Color(0xffE90052),
        onTap: _onItemTapped,
      ),
    );
  }
  Widget drawerUI(){
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff00FF87),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Container(
                child: InkWell(
                  onTap: (){
                    print("KKKKKK");
                  },
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Color(0xff37003C)),
                        ),
                        child: Image.asset("assets/images/default.jpg",height: 100,width: 100,),
                      ),
                      Positioned(
                        left: -12,
                        child: Container(
                          child: Icon(
                            Icons.add_circle,
                            color: Color(0xff37003C),
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text("Mahmoud Ahmed",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      child: Container(
                        child: Icon(Icons.edit,size: 25,color: Color(0xff37003C),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 5.0,right: 5.0),
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Your Predict",style: TextStyle(color: Color(0xff37003C),fontSize: 18,fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.check,color: Color(0xff1A73E8),size: 25.0,),
                        ),
                        Container(
                          child: Text("5",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.clear,color: Color(0xffC73A34),size: 25.0,),
                        ),
                        Container(
                          child: Text("5",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 5.0,right: 5.0),
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Your Rank:  ",style: TextStyle(color: Color(0xff37003C),fontSize: 18,fontWeight: FontWeight.w700),),
                  Text("17th",style: TextStyle(color: Color(0xffC73A34),fontSize: 18,fontWeight: FontWeight.w700),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget matches(int index){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => DetailsPage()));
      },
      splashColor: Color(0xff37003C),
      highlightColor: Color(0xff37003C),
      child: Container(
        margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Color(0xff00FF87)),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 4.0,top: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Image.asset("assets/images/manu.png"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/4.0,
                  margin: EdgeInsets.only(left: 5.0),
                  child:AutoSizeText(
                    'Manchester United',
                    style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text("VS",style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
                Container(
                  child: Text("24/09/2019",style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
                Container(
                  child: Text("13:30",style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 4.0,top: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Image.asset("assets/images/manu.png"),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/4.0,
                  margin: EdgeInsets.only(left: 5.0),
                  child:AutoSizeText(
                    'Manchester United',
                    style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                 ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
  Widget homeWidget(){
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color:  Color(0xff00FF87),
              width: MediaQuery.of(context).size.width,
              height: 105,
              child: Image.asset("assets/images/cover.jpg",width: MediaQuery.of(context).size.width,),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return matches(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }



}
