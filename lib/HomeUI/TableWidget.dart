import 'package:flutter/material.dart';

Widget tableWidget(BuildContext context) {

  List<String> userNames = ['Mahmoud',"Alaa","Abdo","3bs","Abdallah"];
  List<String> userNumbers = ['1',"2","3","4","5"];
  List<String> userPoints = ['25',"22","18","12","2"];

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
                    itemCount: 5,
                    itemBuilder: (context,index){
                      return Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5.0,right: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '${userNumbers[index]}',
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '${userNames[index]}',
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '${userPoints[index]}',
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            index == userPoints.length-1? Container(width: 0.0,height: 0.0,):
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
