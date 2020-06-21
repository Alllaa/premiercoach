import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_bloc.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_event.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_state.dart';
import 'package:premiercoach/model/formationModel.dart';
import 'package:premiercoach/repository/home.dart';
class PitchPage extends StatefulWidget {
  @override
  _PitchPageState createState() => _PitchPageState();
}

class _PitchPageState extends State<PitchPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create:  (BuildContext context) => HomeBlocBloc(HomeApi()),
    child: FormationScreen(team:"Arsenal"),
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

  @override
  void initState() {
    print("go");
    final stBloc = BlocProvider.of<HomeBlocBloc>(context);
    stBloc.add(GetBest(widget.team));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Color,
      body:BlocBuilder<HomeBlocBloc, HomeBlocState>(
          bloc: BlocProvider.of<HomeBlocBloc>(context),
          builder: (BuildContext context, HomeBlocState state) {
            if (state is InitialHomeBlocState) {
              return loadingData();
            }
            else if (state is FormationLoaded) {
              return  BestFormation(state.players);
            }else{
              return Container();
            }
          }
      ),
    );
  }
  Widget loadingData() => Center(child:CircularProgressIndicator());
}


class BestFormation extends StatefulWidget {
  Squad players;
  BestFormation(this.players);
  @override
  _BestFormationState createState() => _BestFormationState();
}

class _BestFormationState extends State<BestFormation> {

  GoalKeeper player=new GoalKeeper();

  _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title:Text("PLAYER CARD",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
          content:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Name :${player.name} ",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
              Text("Number :${player.numbers} ",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
              Text("Photo URL :${player.photos} ",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
              Text("Position : ${player.position}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close me!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.725,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/pitch.jpg"),
                  ),
                ),
              ),
              new Positioned(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 68,
                            child: InkWell(
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                                  Text(widget.players.formation[10].strikerAttacker.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 68,
                            child: InkWell(
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                                  Text(widget.players.formation[8].leftWingAttacker.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
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
                                  Text(widget.players.formation[9].rightWingAttacker.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 68,
                            child: InkWell(
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                                  Text(widget.players.formation[5].playMakerMidFielders.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 68,
                            child: InkWell(
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                                  Text(widget.players.formation[7].controllerMidFielders.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
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
                                  Text(widget.players.formation[6].beastMidFielders.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 68,
                            child: InkWell(
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                                  Text(widget.players.formation[3].leftWingBack.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
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
                                  Text(widget.players.formation[4].rightWingBack.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 68,
                            child: InkWell(
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                                  Text(widget.players.formation[1].leftCentralDefender.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
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
                                  Text(widget.players.formation[2].rightCentralDefender.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 68,
                            child: InkWell(
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                                  Text(widget.players.formation[0].goalKeeper.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:14.0),overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.275,
          color: Colors.deepPurple,
          child: Column(
            children: <Widget>[
              Center(
                child: Text("Players Cards",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: MediaQuery.of(context).size.height*0.2,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[0].goalKeeper;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[0].goalKeeper.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[1].leftCentralDefender;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[1].leftCentralDefender.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[2].rightCentralDefender;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[2].rightCentralDefender.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[3].leftWingBack;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[3].leftWingBack.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[4].rightWingBack;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[4].rightWingBack.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[7].controllerMidFielders;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[7].controllerMidFielders.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[6].beastMidFielders;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[6].beastMidFielders.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[5].playMakerMidFielders;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[5].playMakerMidFielders.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[8].leftWingAttacker;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[8].leftWingAttacker.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[9].rightWingAttacker;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[9].rightWingAttacker.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: InkWell(
                        onTap: (){player=widget.players.formation[10].strikerAttacker;_showMaterialDialog();},
                        child: Column(
                          children: <Widget>[
                            Image.asset("assets/images/shirt.png",width: 70,height: 50,),
                            Text(widget.players.formation[10].strikerAttacker.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:18.0),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
