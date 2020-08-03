import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:premiercoach/HomeUI/PredictWidget.dart';
import 'package:premiercoach/HomeUI/TableWidget.dart';
import 'package:premiercoach/RegistrationUi/login_screen.dart';
import 'package:premiercoach/UTILS/Loader.dart';
import 'package:premiercoach/UTILS/matches.dart';
import 'package:premiercoach/blocs/auth_bloc/authentication_bloc.dart';
import 'package:premiercoach/blocs/auth_bloc/authentication_event.dart';
import 'package:premiercoach/blocs/auth_bloc/authentication_state.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_bloc.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_event.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_state.dart';
import 'package:premiercoach/model/fixturesMatches.dart';
import 'package:premiercoach/model/teamRanking.dart';
import 'package:premiercoach/model/user.dart';
import 'package:premiercoach/repository/authentication.dart';
import 'package:premiercoach/repository/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'PitchPage.dart';
import 'StandingTable.dart';




class HomePage extends StatefulWidget {
  static final String id = "home_page";
  int pageRoute;
  String teamName;
  HomePage(this.teamName,this.pageRoute);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider <HomeBlocBloc>(
          create: (context) => HomeBlocBloc(HomeApi(),"${widget.teamName}",0),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(AuthApi()),
        ),
      ],
      child: HomeMain("${widget.teamName}",widget.pageRoute),
    );
  }
}

class HomeMain extends StatefulWidget {
  int pageRoute;
  String teamName;
  HomeMain(this.teamName,this.pageRoute);
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      widget.pageRoute = 0;
      _selectedIndex = index;
    });
  }
  MatchInfoModel matches = new MatchInfoModel();
  Matches match = new Matches();


  getMatches(){
    final matchBloc = BlocProvider.of<HomeBlocBloc>(context);
    matchBloc.add(MatchEvent('${dateSelected.toString().substring(0,10).replaceAll("-", "/")}'));
  }
  getUserInfo(){
    final bloc = BlocProvider.of<AuthenticationBloc>(context);
    bloc.add(InfoEvent());
  }
  DateTime dateSelected;
  @override
  void initState() {
    // TODO: implement initState
//    getUserInfo();
    dateSelected = DateTime.now();
    getMatches();
    super.initState();
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
          child: IconButton(
              icon: SvgPicture.asset(
                "assets/images/menu_icon.svg",
                color: Color(0xff37003C),
                height: 30,
                width: 30,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              }),
        ),
        actions: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: ()async
                {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  setState(() {
                    prefs.clear();
                  });
                  Navigator.pushReplacement(context,MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ) );
                },
                child: Text(
              "Sign out",
              style: TextStyle(fontSize: 16, color: Color(0xff37003C)),
            )),
          ))
        ],
      ),
      drawer: Drawer(
        elevation: 0.0,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is InitialHomeBlocState) {
              return drawerUI('user', 'user', 0,"0","0");
            } else if (state is InfoUser) {
              print("Hi All there 45456adsa54d65sa");
              return (drawerUI(state.user.firstName, state.user.lastName, state.user.score,state.user.correct,state.user.wrong));
            }
            return Container();
          },
        ),
      ),
      body:
          widget.pageRoute == 4?PitchPage("${widget.teamName}"):
          _selectedIndex == 0 ? homeWidget() : _selectedIndex == 1 ? predictWidget(context,matches.data)
          : _selectedIndex == 2 ?UserRanking() :_selectedIndex == 3 ?StandingTabloue():PitchPage("${widget.teamName}") ,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff00FF87),
        elevation: 5.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/home.png",height: 30.0,width: 30.0,),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/predict.png",height: 40.0,width: 40.0,),
            title: Text('Predict'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/ranking.png",height: 40.0,width: 40.0,),
            title: Text('Ranking'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/league_table.png",height: 40.0,width: 40.0,),
            title: Text('Table'),
          ),

          BottomNavigationBarItem(
            icon: Image.asset("assets/images/formation.png",height: 40.0,width: 40.0,),
            title: Text('Formation'),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color(0xff37003C),
        selectedItemColor: Color(0xffE90052),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget drawerUI(String firstName, String lastName, int score,String correct,String wrong) {
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
              onTap: () {
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
                    child: Image.asset(
                      "assets/images/default.jpg",
                      height: 100,
                      width: 100,
                    ),
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
            )),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "${firstName} ${lastName}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      child: Container(
                        child: Icon(
                          Icons.edit,
                          size: 25,
                          color: Color(0xff37003C),
                        ),
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
              margin: EdgeInsets.only(left: 5.0, right: 5.0),
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Your Predict",
                style: TextStyle(
                    color: Color(0xff37003C),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
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
                          child: Icon(
                            Icons.check,
                            color: Color(0xff1A73E8),
                            size: 25.0,
                          ),
                        ),
                        Container(
                          child: Text(
                            "${correct}",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
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
                          child: Icon(
                            Icons.clear,
                            color: Color(0xffC73A34),
                            size: 25.0,
                          ),
                        ),
                        Container(
                          child: Text(
                            "${wrong}",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
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
              margin: EdgeInsets.only(left: 5.0, right: 5.0),
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
                  Text(
                    "Your Rank:  ",
                    style: TextStyle(
                        color: Color(0xff37003C),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "17th",
                    style: TextStyle(
                        color: Color(0xffC73A34),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget homeWidget() {
    return SingleChildScrollView(
      child: Container(padding: EdgeInsets.only(bottom: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Container(
              color: Color(0xff00FF87),
              width: MediaQuery.of(context).size.width,
              height: 105,
              child: Image.asset(
                "assets/images/cover.jpg",
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 15.0,right: 15.0),
              child: IconButton(
                icon: Icon(
                  Icons.date_range,
                  color: Color(0xff00FF87),
                  size: 40,
                ),
                onPressed: (){
                  datePicker();
                },
              )
            ),
            SizedBox(
              height: 25.0,
            ),
            BlocBuilder<HomeBlocBloc, HomeBlocState>(
              builder: (context, state) {
                if (state is InitialHomeBlocState) {
                  return Container(
                    margin: EdgeInsets.only(top: 50.0),
                    color: Colors.transparent,
                    child: ColorLoader(),
                  );
                } else if (state is MatchInfoState) {
                  print("Hi All there 45456adsa54d65sa");
                  if(state.match.data.match.isEmpty){
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                              'assets/images/nullempty.png',
                            height: 64.0,
                            width: 64.0,
                          ),
                          Text(
                            "  No Matches",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    );
                  }else{
                    matches = state.match;
                    return Container(
                        height: MediaQuery.of(context).size.height/1.70,
                        child: match.matches(state.match.data, 1, context,false)
                    );
                  }

                }
                return Container();
              },
            ),

          ],
        ),
      ),
    );
  }

  datePicker() async{
    DateTime picked = await showDatePicker(
      context: context,
      firstDate: DateTime.parse("2019-08-09"),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    );
    setState(() {
      dateSelected = picked;
      getMatches();
    });
    print("DATE ${picked}");
  }
}
