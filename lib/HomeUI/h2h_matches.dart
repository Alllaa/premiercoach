import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:premiercoach/model/h2hModel.dart';

class H2hMatches extends StatefulWidget {
  H2hModel h2hModel;
  H2hMatches(this.h2hModel);
  @override
  _H2hMatchesState createState() => _H2hMatchesState();
}

class _H2hMatchesState extends State<H2hMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xff00FF87),
        centerTitle: true,
        title: Container(
          child: Text(
            "History",
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
      backgroundColor: Color(0xff37003C),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 25.0,right: 15.0,left: 15),
          child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.h2hModel.data.h2h.length,
            itemBuilder: (context,index){
              return matchDesign(widget.h2hModel.data.h2h[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget matchDesign(H2h h2h){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              "${h2h.competition.name}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          matchCard(h2h),
          SizedBox(height: 12.0,),
        ],
      ),
    );
  }
  Widget matchCard(H2h h2h){
    return Container(
      margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
      padding: EdgeInsets.only(top: 7.0,bottom: 7.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xff00FF87)),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 4.0,top: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    "assets/logo/${h2h.homeId}.png",
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/4.0,
                  margin: EdgeInsets.only(left: 5.0),
                  child:AutoSizeText(
                    '${h2h.homeName}',
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
                  child: Text("${h2h.date}",style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
                Container(
                  child: Text("${h2h.score}",style: TextStyle(fontSize: 15,color: Colors.white),),
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
                    "assets/logo/${h2h.awayId}.png",
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/4.0,
                  margin: EdgeInsets.only(left: 5.0),
                  child:AutoSizeText(
                    '${h2h.awayName}',
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
    );
  }
}
