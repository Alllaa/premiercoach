import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:premiercoach/UTILS/matches.dart';

Widget predictWidget(BuildContext contx){
  Matches matches = new Matches();
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                'Current GameWeek',
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 32,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(contx).size.height,
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return matches.matches(index,context,2);
                  }
              ) ,
            )
          ],
        ),
      ),
    ),
  );
}