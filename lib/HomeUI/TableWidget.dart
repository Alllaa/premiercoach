import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premiercoach/UTILS/Loader.dart';
import 'package:premiercoach/blocs/auth_bloc/authentication_state.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_bloc.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_event.dart';
import 'package:premiercoach/blocs/home_bloc/home_bloc_state.dart';
import 'package:premiercoach/model/user.dart';
import 'package:premiercoach/model/user_ranking_model.dart';


class UserRanking extends StatefulWidget {
  @override
  _UserRankingState createState() => _UserRankingState();
}

class _UserRankingState extends State<UserRanking> {
  getRank(){
    final matchBloc = BlocProvider.of<HomeBlocBloc>(context);
    matchBloc.add(GetRanking());
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRank();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBlocBloc, HomeBlocState>(
      builder: (context, state) {
        if (state is InitialHomeBlocState) {
          return Container(
            margin: EdgeInsets.only(top: 50.0),
            color: Colors.transparent,
            child: ColorLoader(),
          );
        } else if (state is Ranking) {
          print("Hi All ${state.rankingModel.users.length}");
          return tableWidget(context,state.rankingModel);
        }
        return Container();
      },
    );
  }
  Widget tableWidget(BuildContext context,RankingModel rank) {
    if(rank.users.isEmpty){
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
    }else {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
              child: Table(
                border: TableBorder.all(width: 1, color: Colors.white),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.only(left: 5.0,right: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'number',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 20.0),
                              child: Text(
                                'user name',
                                style: TextStyle(color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              'Points',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            )
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
                            itemCount: rank.users.length,
                            itemBuilder: (context,index){
                              return Container(
                                child: Column(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: (){
                                        showUserInfo(rank,index);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 5.0,right: 5.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              '${index + 1}',
                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${rank.users[index].firstname} ${rank.users[index].lastname}',
                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${rank.users[index].score}',
                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    index == rank.users.length-1? Container(width: 0.0,height: 0.0,):
                                    Container(
                                      color: Colors.white,
                                      height: 1.0,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
                                    ),
                                  ],
                                ),
                              );
                            }
                        )
                      ]
                  ),

                ],
              )),
        ),
      );
    }


  }
  showUserInfo(RankingModel rank,int index){
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey,
          title: Container(
            padding: EdgeInsets.all(7.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Full name',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '${rank.users[index].firstname} ${rank.users[index].lastname}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'User rank',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'User Score',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '${rank.users[index].score}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Correct predict',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '${rank.users[index].correct}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Wrong predict',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '${rank.users[index].wrong}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ],
        )
    );
  }
}


