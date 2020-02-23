import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:premiercoach/UTILS/CustomDialog.dart';

import '../HomeUI/DetailsPage.dart';

class Matches{
  Widget matches(int index,BuildContext context,int where){
    return InkWell(
      onTap: (){
        if(where == 1)
          {
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => DetailsPage()));
          }
        else if(where == 2)
          {
            showDialog(
              context: context,
              builder: (BuildContext context) => CustomDialog(
                title: "Success",
                description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                buttonText: "Okay",
              ),
            );
          }
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
}