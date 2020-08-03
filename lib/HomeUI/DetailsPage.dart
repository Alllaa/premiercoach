import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:premiercoach/UTILS/Loader.dart';
import 'package:premiercoach/blocs/auth_bloc/authentication_bloc.dart';
import 'package:premiercoach/blocs/machine_bloc/machine_bloc.dart';
import 'package:premiercoach/blocs/statistics/stat_bloc.dart';
import 'package:premiercoach/blocs/statistics/stat_event.dart';
import 'package:premiercoach/blocs/statistics/stat_state.dart';
import 'package:premiercoach/model/fixturesMatches.dart';
import 'package:premiercoach/model/h2hModel.dart';
import 'package:premiercoach/model/machine_model.dart';
import 'package:premiercoach/model/statistics_model.dart';
import 'package:premiercoach/repository/home.dart';
import 'package:premiercoach/repository/matches_statistics.dart';
import 'dart:math' as math;
import '../blocs/statistics/stat_state.dart';
import 'h2h_matches.dart';

class DetailsPageBloc extends StatefulWidget {
  String matchId;
  Fixtures match;
  DetailsPageBloc(this.matchId,this.match);
  @override
  _DetailsPageBlocState createState() => _DetailsPageBlocState();
}

class _DetailsPageBlocState extends State<DetailsPageBloc> {



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider <StatBloc>(
          create: (context) => StatBloc(MatchStatistics()),
        ),
        BlocProvider <MachineBloc>(
          create: (context) => MachineBloc(MatchStatistics()),
        ),

      ],
      child: DetailsPage(widget.matchId,widget.match),
    );
  }
}


class DetailsPage extends StatefulWidget {
  String matchId;
  Fixtures match;
  DetailsPage(this.matchId,this.match);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  int homeWinsNumber = 0;
  int awayWinsNumber = 0;
  int drawNumber = 0;

  int done = 0;
  Statistics matchStatistics;
  H2hModel h2hModel;
  MachineModel machineModel;
   final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
   final GlobalKey<AnimatedCircularChartState> _chartKey2 = new GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  String splitString(String event,int home_away){
    return home_away == 0? event.split(":")[0] : event.split(":")[1];
  }
  
  getMatchesStatistics(){
    final bloc = BlocProvider.of<StatBloc>(context);
    bloc.add(GetStatistics(widget.matchId,widget.match.homeId,widget.match.awayId));
  }
  getMachinePredict(){
    print("HOME ${widget.match.homeName}");
    print("Away ${widget.match.awayName}");
    final bloc = BlocProvider.of<MachineBloc>(context);
    bloc.add(EventMachinePredict(widget.match.homeName, widget.match.awayName));
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Here");
    print("state ${matchStatistics == null}");
    getMatchesStatistics();

    getMachinePredict();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff37003C),
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xff00FF87),
        centerTitle: true,
        title: Container(
          child: Text(
            "Details",
            style: TextStyle(
              color: Color(0xff37003C),
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: Container(
          child: IconButton(icon: Icon(Icons.arrow_back,color: Color(0xff37003C),size: 25,),
              onPressed: (){
            Navigator.pop(context);
          }),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 20.0),
          child:Column(
            children: <Widget>[
              //title
              SizedBox(
                height: 25.0,
              ),

              BlocBuilder<StatBloc,StatState>(
                builder: (context,state)
                {
                  if(state is InitialHomeBlocState) {
                    return Container(
                      margin: EdgeInsets.only(top: 0.0),
                      color: Colors.transparent,
                      child: ColorLoader(),
                    );
                  }else if(state is StatisticsState)
                  {
                    print("MOdel ${state.h2hModel}");
                    print("MOdel ${widget.match.awayId}");
                    print("MOdel ${widget.match.homeId}");
                    h2hModel = state.h2hModel;
                    awayWinsNumber = 0;
                    homeWinsNumber = 0;
                    drawNumber = 0;
                    for(int i= 0;i<h2hModel.data.h2h.length;i++){
                      if(h2hModel.data.h2h[i].homeId == widget.match.homeId){
                        if(int.parse(h2hModel.data.h2h[i].score.split("-")[0]) > int.parse(h2hModel.data.h2h[i].score.split("-")[1])){
                          homeWinsNumber++;
                        }else if(int.parse(h2hModel.data.h2h[i].score.split("-")[0]) < int.parse(h2hModel.data.h2h[i].score.split("-")[1])){
                          awayWinsNumber++;
                        }else{
                          drawNumber++;
                        }
                      }else{
                        if(int.parse(h2hModel.data.h2h[i].score.split("-")[0]) < int.parse(h2hModel.data.h2h[i].score.split("-")[1])){
                          homeWinsNumber++;
                        }else if(int.parse(h2hModel.data.h2h[i].score.split("-")[0]) > int.parse(h2hModel.data.h2h[i].score.split("-")[1])){
                          awayWinsNumber++;
                        }else{
                          drawNumber++;
                        }
                      }

                    }
                    print("DONE ${done}");
                    return resultsDesign();
                  }
                  else{
                    return Container();
                  }
                },
              ),
              Container(
                height: 1.5,
                width: MediaQuery.of(context).size.width/2,
                color: Colors.white,
                margin: EdgeInsets.only(left: 20.0,right: 20.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              BlocBuilder<MachineBloc,MachineState>(
                builder: (context,state)
                {
                  if(state is MachineInitial) {
                    return Container(
                      margin: EdgeInsets.only(top: 0.0),
                      color: Colors.transparent,
                      child: ColorLoader(),
                    );
                  }else if(state is PredictMachineState)
                  {
                    machineModel = state.machineModel;
                    return predictionDesign();
                  }
                  else{
                    return Container();
                  }
                },
              ),
              Container(
                height: 1.5,
                width: MediaQuery.of(context).size.width/2,
                color: Colors.white,
                margin: EdgeInsets.only(left: 20.0,right: 20.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              BlocBuilder<StatBloc,StatState>(
                builder: (context,state)
                {
                  if(state is InitialHomeBlocState) {
                    return Container(
                      margin: EdgeInsets.only(top: 0.0),
                      color: Colors.transparent,
                      child: ColorLoader(),
                    );
                  }else if(state is StatisticsState)
                    {
                      matchStatistics = state.stat;
                      h2hModel = state.h2hModel;
                      print("DONExx ${matchStatistics.toString()}");
                      return statisticsDesign();
                    }
                  else{
                    return Container();
                  }
                },
              ),


            ],
          )
        ),
      ),
    );
  }
  Widget resultsDesign(){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15.0,right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "Last ${h2hModel.data.h2h.length} matches",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) => H2hMatches(h2hModel)
                        )
                    );
                  },
                  child: Container(
                    child: Text(
                      "View details >",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0,left: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    "assets/logo/${widget.match.homeId}.png",
                    height: 40.0,
                    width: 40.0,
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "${homeWinsNumber}",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Text(
                          "Win",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 7.0,right: 7.0),
                  height: 40.0,
                  width: .5,
                  color: Colors.white,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "${drawNumber}",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Text(
                          "Draw",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 7.0,right: 7.0),
                  height: 40.0,
                  width: .5,
                  color: Colors.white,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "${awayWinsNumber}",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Text(
                          "Win",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.asset(
                    "assets/logo/${widget.match.awayId}.png",
                    height: 40.0,
                    width: 40.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
  Widget predictionDesign(){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Ai Prediction",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(height: 30.0,),
          Container(
            margin: EdgeInsets.only(left: 15.0,right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 20.0,
                        height: 20.0,
                        color:  Color(0xff034694),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        color: Colors.green,
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        color: Colors.red,
                      ),


                    ],
                  ),
                ),
                SizedBox(width: 35.0,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container (
                        child: Text(
                          "Draw",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container (
                        child: Text(
                          "Win",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container (
                        child: Text(
                          "Loss",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(width: 35.0,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        child: Text(
                          "${(double.parse(machineModel.drawPercentage)).abs()}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        child: Text(
                          "${machineModel.homeWinPercentage}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        child: Text(
                          "${(double.parse(machineModel.awayWinPercentage)).abs()}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(width: 35.0,),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "${machineModel.drawAwaygoals} - ${machineModel.drawAwaygoals}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        child: Text(
                          "${machineModel.homeWinHomegoals} - ${machineModel.homeWinAwaygoals}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        child: Text(
                          "${machineModel.awayWinHomegoals} - ${machineModel.awayWinAwaygoals}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            margin: EdgeInsets.only(left: 15.0,right: 15.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40),
                          topRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0)
                      )
                  ),
                  padding: EdgeInsets.only(right: 20.0,top: 5.0),
                  alignment: Alignment.centerRight,
                ),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width*(double.parse(machineModel.drawPercentage)/100),
                  decoration: BoxDecoration(
                      color: Color(0xff034694),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          topLeft: Radius.circular(40.0)
                      )
                  ),
                ),
                Positioned(
                  left:MediaQuery.of(context).size.width*(double.parse(machineModel.drawPercentage)/100) ,
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width*(double.parse(machineModel.awayWinPercentage)/100),
                    decoration: BoxDecoration(
                        color: Colors.red,

                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          //AWAY WIN
        ],
      ),
    );
  }
  Widget statisticsDesign(){
    return matchStatistics.toString() == 'null'?Container(
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
            "  No details for this match",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ],
      ),
    ):Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Match Statistics",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0,left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    '${widget.match.score.split("-")[0]}',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Score',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '${widget.match.score.split("-")[1]}',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
          possessionDesign(),
          Container(
            margin: EdgeInsets.only(right: 20.0,left: 20.0),
            child: attempts(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0,left: 20.0),
            child: shotOnTarget(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0,left: 20.0),
            child: freeKicks(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0,left: 20.0),
            child: cornerKicks(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0,left: 20.0),
            child: offSides(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0,left: 20.0),
            child: yellowCards(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0,left: 20.0),
            child: redCards(),
          ),
        ],
      ),
    );
  }
  Widget possessionDesign(){
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'Possession',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),

                Container(
                  child: AnimatedCircularChart(
                    key: _chartKey,
                    size: Size(120, 120),
                    initialChartData: <CircularStackEntry>[
                      new CircularStackEntry(
                        <CircularSegmentEntry>[
                          new CircularSegmentEntry(
                            double.parse(splitString(matchStatistics.data.possesion,0)),
                            Color(0xffE01922),
                            rankKey: 'completed',
                          ),
                          new CircularSegmentEntry(
                            double.parse(splitString(matchStatistics.data.possesion,1)),
                            Color(0xff034694),
                            rankKey: 'remaining',
                          ),
                        ],
                        rankKey: 'progress',
                      ),
                    ],
                    chartType: CircularChartType.Radial,
                    percentageValues: true,
                    holeLabel: '${splitString(matchStatistics.data.possesion,0)}/${splitString(matchStatistics.data.possesion,1)}',
                    labelStyle: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
            width: MediaQuery.of(context).size.width/2,
            height: 1,
            color: Colors.white,
          ),
          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
  Widget attempts(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            '${splitString(matchStatistics.data.attemptsOnGoal,0)}',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            'Attempts',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            '${splitString(matchStatistics.data.attemptsOnGoal,1)}',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
  Widget freeKicks(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            '${splitString(matchStatistics.data.freeKicks,0)}',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            'Free Kicks',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            '${splitString(matchStatistics.data.freeKicks,1)}',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
  Widget cornerKicks(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            '${splitString(matchStatistics.data.corners,0)}',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            'Corner Kicks',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            '${splitString(matchStatistics.data.corners,1)}',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
  Widget shotOnTarget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            '${splitString(matchStatistics.data.shotsOnTarget,0)}',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            'Shots on Goal',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            '${splitString(matchStatistics.data.shotsOnTarget,1)}',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
  Widget yellowCards(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            splitString(matchStatistics.data.yellowCards,0),
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            'Yellow Cards',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            splitString(matchStatistics.data.yellowCards,1),
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
  Widget redCards(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            splitString(matchStatistics.data.redCards,0),
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            'Red Cards',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            splitString(matchStatistics.data.redCards,1),
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
  Widget offSides(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            '${splitString(matchStatistics.data.offsides,0)}',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            'Offsides',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
        Container(
          child: Text(
            '${splitString(matchStatistics.data.offsides,1)}',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ),
      ],
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
}
