import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premiercoach/UTILS/Loader.dart';
import 'package:premiercoach/app_class.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_bloc.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_event.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_state.dart';
import 'package:premiercoach/model/formationModel.dart';
import 'package:premiercoach/repository/home.dart';

import 'HomePage.dart';
class PitchPage extends StatefulWidget {
  String teamName;
  PitchPage(this.teamName);
  @override
  _PitchPageState createState() => _PitchPageState();
}

class _PitchPageState extends State<PitchPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create:  (BuildContext context) => HomeBlocBloc(HomeApi(),"${widget.teamName}",0),
    child: FormationScreen(team:"${widget.teamName}"),
    );
  }
}
class FormationScreen extends StatefulWidget {
  String team;
  FormationScreen({this.team});
  @override
  _FormationScreenState createState() => _FormationScreenState();
}

class _FormationScreenState extends State<FormationScreen> {
  getFormation(String team){
    final stBloc = BlocProvider.of<HomeBlocBloc>(context);
    stBloc.add(GetBest(team));
  }
  @override
  void initState() {
    print("go");
    getFormation(widget.team);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Color,
      body: blocBuilder()
    );
  }
  Widget blocBuilder(){
    return BlocBuilder<HomeBlocBloc, HomeBlocState>(
        bloc: BlocProvider.of<HomeBlocBloc>(context),
        builder: (BuildContext context, HomeBlocState state) {
          if (state is InitialHomeBlocState) {
            return loadingData();
          }
          else if (state is FormationLoaded) {
            return  bestFormation(state.players);
          }else{
            return Container();
          }
        }
    );
  }
  Widget bestFormation(Squad players){
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/1.22,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/pitch.jpg"),
              ),
            ),
          ),
          Positioned(
            top: 35.0,
            left: 10.0,
            child: Container(
              color: Colors.transparent,
              child: DropdownButton(
                onChanged: (team){
                  print("TEAM ${team}");
                  Navigator.pushReplacement(context,MaterialPageRoute(
                    builder: (context) => HomePage("${team}",4),
                  ) );
                },
                hint: Text(
                  "  ${widget.team}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                ),
                elevation: 6,
                items: AppClass.teams
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          Positioned(
            bottom: 35.0,
            right: MediaQuery.of(context).size.width/2.6,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 68,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                        Text(players.formation[0].goalKeeper.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 120.0,
            right: MediaQuery.of(context).size.width/4,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 68,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                        Text(players.formation[1].leftCentralDefender.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 68,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                        Text(players.formation[2].rightCentralDefender.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 140.0,
            right: 10,
            child:  Container(
              width: 100,
              height: 68,
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                    Text(players.formation[4].rightWingBack.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 140.0,
            left: 10,
            child:  Container(
              width: 100,
              height: 68,
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                    Text(players.formation[3].leftWingBack.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 270,
            left: MediaQuery.of(context).size.width/4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 68,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                        Text(players.formation[7].controllerMidFielders.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 68,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                        Text(players.formation[6].beastMidFielders.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 360,
            right: MediaQuery.of(context).size.width/2.6,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 68,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                        Text(players.formation[5].playMakerMidFielders.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 450,
            left: 10,
            child:Container(
              width: 100,
              height: 68,
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                    Text(players.formation[8].leftWingAttacker.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 450,
            right: 10,
            child:Container(
              width: 100,
              height: 68,
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                    Text(players.formation[9].rightWingAttacker.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 450,
            right: 10,
            child:Container(
              width: 100,
              height: 68,
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                    Text(players.formation[9].rightWingAttacker.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 500,
            right: MediaQuery.of(context).size.width/2.6,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 68,
                  child: InkWell(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                        Text(players.formation[10].strikerAttacker.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget loadingData() => Center(child:ColorLoader());
}



