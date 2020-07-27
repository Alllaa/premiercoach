import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:premiercoach/UTILS/CustomDialog.dart';
import 'package:premiercoach/model/fixturesMatches.dart';

import '../HomeUI/DetailsPage.dart';

class Matches{
  Widget matches(Match match,int where,BuildContext context,bool route){
     if(where == 1){
       return homeMatches(match,context);
     }else{
       return predictMatches(match,context);
     }
  }
  Widget homeMatches(Match match,BuildContext context){
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: match.fixtures.length,
        itemBuilder: (context,index){
          if(match.fixtures.isEmpty){
            return Center(
              child: Text(
                "Empty",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            );
          }else{
            return Column(
              children: <Widget>[
                index!=0? match.fixtures[index].round == match.fixtures[index-1].round?Container():
                Container(
                  margin: EdgeInsets.only(left: 15.0,top: 8,bottom: 8),
                  alignment: Alignment.center,
                  child: Text(
                    "Round ${match.fixtures[index].round}",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ):Container(
                  margin: EdgeInsets.only(left: 15.0,top: 8,bottom: 8),
                  alignment: Alignment.center,
                  child: Text(
                    "Round ${match.fixtures[index].round}",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailsPageBloc("178506",match.fixtures[index]),
                      ),
                    );
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
                                child: Image.asset(
                                  "assets/logo/${match.fixtures[index].homeId}.png",
                                  height: 50.0,
                                  width: 50.0,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/4.0,
                                margin: EdgeInsets.only(left: 5.0),
                                child:AutoSizeText(
                                  '${match.fixtures[index].homeName}',
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
                                child: Text("${match.fixtures[index].date}",style: TextStyle(fontSize: 15,color: Colors.white),),
                              ),
                              Container(
                                child: Text("${match.fixtures[index].time}",style: TextStyle(fontSize: 15,color: Colors.white),),
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
                                child: Image.asset(
                                  "assets/logo/${match.fixtures[index].awayId}.png",
                                  height: 50.0,
                                  width: 50.0,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/4.0,
                                margin: EdgeInsets.only(left: 5.0),
                                child:AutoSizeText(
                                  '${match.fixtures[index].awayName}',
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
                ),

              ],
            );
          }

        }
    );
  }
  Widget predictMatches(Match match,BuildContext context){
    String round = match.fixtures[0].round;
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: match.fixtures.length,
        itemBuilder: (context,index){
          return Column(
            children: <Widget>[
              index == 0? Container(
                margin: EdgeInsets.only(left: 15.0,top: 8,bottom: 8),
                alignment: Alignment.center,
                child: Text(
                  "Round ${match.fixtures[index].round}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ):Container(),

              round == match.fixtures[index].round? InkWell(
                onTap: (){

                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "Success",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        buttonText: "Okay",
                        fixtures: match.fixtures[index],
                      ),
                    );
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
                              child: Image.asset(
                                "assets/logo/${match.fixtures[index].homeId}.png",
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/4.0,
                              margin: EdgeInsets.only(left: 5.0),
                              child: AutoSizeText(
                                '${match.fixtures[index].homeName}',
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
                              child: Text("${match.fixtures[index].date}",style: TextStyle(fontSize: 15,color: Colors.white),),
                            ),
                            Container(
                              child: Text("${match.fixtures[index].time}",style: TextStyle(fontSize: 15,color: Colors.white),),
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
                              child: Image.asset(
                                "assets/logo/${match.fixtures[index].awayId}.png",
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/4.0,
                              margin: EdgeInsets.only(left: 5.0),
                              child:AutoSizeText(
                                '${match.fixtures[index].awayName}',
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
              ):Container(),
            ],
          );
        }
    );
  }
}