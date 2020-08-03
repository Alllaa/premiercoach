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
        itemCount: match.match.length,
        itemBuilder: (context,index){
          if(match.match.isEmpty){
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
//                index!=0? match.match[index].round == match.match[index-1].round?Container():
//                Container(
//                  margin: EdgeInsets.only(left: 15.0,top: 8,bottom: 8),
//                  alignment: Alignment.center,
//                  child: Text(
//                    "Round ${match.match[index].round}",
//                    style: TextStyle(
//                      fontSize: 18.0,
//                      color: Colors.white,
//                      fontWeight: FontWeight.w600,
//                    ),
//                  ),
//                ):Container(
//                  margin: EdgeInsets.only(left: 15.0,top: 8,bottom: 8),
//                  alignment: Alignment.center,
//                  child: Text(
//                    "Round ${match.match[index].round}",
//                    style: TextStyle(
//                      fontSize: 18.0,
//                      color: Colors.white,
//                      fontWeight: FontWeight.w600,
//                    ),
//                  ),
//                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailsPageBloc("${match.match[index].id}",match.match[index]),
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
                                  "assets/logo/${match.match[index].homeId}.png",
                                  height: 50.0,
                                  width: 50.0,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/4.0,
                                margin: EdgeInsets.only(left: 5.0),
                                child:AutoSizeText(
                                  '${match.match[index].homeName}',
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
                                child: Text("${match.match[index].date}",style: TextStyle(fontSize: 15,color: Colors.white),),
                              ),
                              Container(
                                child: Text("${match.match[index].time}",style: TextStyle(fontSize: 15,color: Colors.white),),
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
                                  "assets/logo/${match.match[index].awayId}.png",
                                  height: 50.0,
                                  width: 50.0,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/4.0,
                                margin: EdgeInsets.only(left: 5.0),
                                child:AutoSizeText(
                                  '${match.match[index].awayName}',
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
  Widget predictMatches(Match match,BuildContext context) {
//    String round = match.match[0].round;
    if (match.toString() == 'null') {
     return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 0),
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
    } else{
      return ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: match.match.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
//              index == 0? Container(
//                margin: EdgeInsets.only(left: 15.0,top: 8,bottom: 8),
//                alignment: Alignment.center,
//                child: Text(
//                  "Round ${match.match[index].round}",
//                  style: TextStyle(
//                    fontSize: 18.0,
//                    color: Colors.white,
//                    fontWeight: FontWeight.w600,
//                  ),
//                ),
//              ):Container(),
                InkWell(
                  onTap: () {
                    if (DateTime.now().isAfter(
                        DateTime.parse(match.match[index].date))) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              AlertDialog(
                                backgroundColor: Colors.grey,
                                title: Text(
                                  "This match has been ended so you cann't predict",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "OK",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  )
                                ],
                              )
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            CustomDialog(
                              title: "Success",
                              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              buttonText: "Okay",
                              fixtures: match.match[index],
                            ),
                      );
                    }
                  },
                  splashColor: Color(0xff37003C),
                  highlightColor: Color(0xff37003C),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0),
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
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 4.0, top: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Image.asset(
                                  "assets/logo/${match.match[index]
                                      .homeId}.png",
                                  height: 50.0,
                                  width: 50.0,
                                ),
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 4.0,
                                margin: EdgeInsets.only(left: 5.0),
                                child: AutoSizeText(
                                  '${match.match[index].homeName}',
                                  style: TextStyle(color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
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
                                child: Text("VS", style: TextStyle(
                                    fontSize: 15, color: Colors.white),),
                              ),
                              Container(
                                child: Text("${match.match[index].date}",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),),
                              ),
                              Container(
                                child: Text("${match.match[index].time}",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 4.0, top: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Image.asset(
                                  "assets/logo/${match.match[index]
                                      .awayId}.png",
                                  height: 50.0,
                                  width: 50.0,
                                ),
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 4.0,
                                margin: EdgeInsets.only(left: 5.0),
                                child: AutoSizeText(
                                  '${match.match[index].awayName}',
                                  style: TextStyle(color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
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
      );
  }
  }
}