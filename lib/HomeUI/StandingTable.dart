import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_bloc.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_event.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_state.dart';
import 'package:premiercoach/model/teamRanking.dart';
import 'package:premiercoach/repository/home.dart';

class StandingTabloue extends StatefulWidget {

  @override
  _StandingTabloueState createState() => _StandingTabloueState();
}

class _StandingTabloueState extends State<StandingTabloue> {


  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (BuildContext context) => HomeBlocBloc(HomeApi()),
      child: TeamsTable(),
    );
  }

}
class TeamsTable extends StatefulWidget {

  @override
  _TeamsTableState createState() => _TeamsTableState();
}

class _TeamsTableState extends State<TeamsTable> {
  getTable(){
    final stBloc = BlocProvider.of<HomeBlocBloc>(context);
    stBloc.add(GetStanding());
  }
  List<Tabloue> pl = new List();
  @override
  void initState() {
    // TODO: implement initState
    getTable();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff37003C),
      body: OrientationBuilder(
          builder: (context, orientation){
            if(orientation == Orientation.portrait){
              return  BlocBuilder<HomeBlocBloc, HomeBlocState>(
                builder: (context, state) {
                  if (state is InitialHomeBlocState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is StandingLoaded) {
                    pl = state.pl_standing;
                    return tableView(false);
                  }
                  return Container();
                },
              );
            }else{
              return BlocBuilder<HomeBlocBloc, HomeBlocState>(
                builder: (context, state) {
                  if (state is InitialHomeBlocState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is StandingLoaded) {
                    pl = state.pl_standing;
                    return tableView(true);
                  }
                  return Container();
                },
              );
            }

          }
      ),
    );
  }

  Widget tableView(bool orientation){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Container(
            child: Table(
              border: TableBorder.all(width: 1, color: Colors.white),
              children: [
                TableRow(children: [
                  TableCell(
                    child:!orientation? Container(
                      margin: EdgeInsets.only(left: 5.0,right: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Rank',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,

                              child: Text(
                                'Team',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Points',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),

                        ],
                      ),
                    ):Container(
                      margin: EdgeInsets.only(left: 5.0,right: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Rank',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
//                              margin: EdgeInsets.only(left: 50.0),
                              child: Text(
                                'Team',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
//                              margin: EdgeInsets.only(left: 50.0),
                              child: Text(
                                'Points',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Text(
                              'GS',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
//                           Expanded(
//                             flex: 2,
//                             child: Text(
//                              'GS',
//                              style: TextStyle(color: Colors.white, fontSize: 20),
//                              textAlign: TextAlign.center,
//                          ),
//                           ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'GC',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'GD',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Win',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                TableRow(
                    children: <Widget>[
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: pl.length,
                          itemBuilder: (context,index){
                            return Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  !orientation? Container(
                                    margin: EdgeInsets.only(left: 5.0,right: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            '${pl[index].rank}',
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: AutoSizeText(
                                            '${pl[index].name}',
                                            style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            '${pl[index].points}',
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ):Container(
                                    margin: EdgeInsets.only(left: 5.0,right: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${pl[index].rank}',
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: AutoSizeText(
                                            '${pl[index].name}',
                                            style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: AutoSizeText(
                                            '${pl[index].points}',
                                            style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${pl[index].goalsScored}',
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${pl[index].goalDiff}',
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${pl[index].goalsConceded}',
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${pl[index].won}',
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    height: 1.0,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
                                  )
                                ],
                              ),
                            );
                          }
                      )
                    ]
                ),
//          TableRow(children: [
//            TableCell(
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    '2',
//                    style: TextStyle(color: Colors.white, fontSize: 20),
//                    textAlign: TextAlign.center,
//                  ),
//                  Text(
//                    '7oda',
//                    style: TextStyle(color: Colors.white, fontSize: 20),
//                    textAlign: TextAlign.center,
//                  ),
//                  Text(
//                    '99',
//                    style: TextStyle(color: Colors.white, fontSize: 20),
//                    textAlign: TextAlign.center,
//                  )
//                ],
//              ),
//            ),
//          ]),
              ],
            )),
      ),
    );
  }
}
