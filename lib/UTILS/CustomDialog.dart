import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  const CustomDialog(
      {Key key, this.title, this.description, this.buttonText, this.image});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
//          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                'Your Predict',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Image.asset("assets/images/manu.png"),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Image.asset("assets/images/manu.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffb8bfbd),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                Container(
                alignment: Alignment.center,
                  width: 30,
                  child: TextField(
                      maxLines: 1,
                    textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0'
                      ),
                  )
                ),
//                    SizedBox(width: 2,),
                    Container(
                      color: Color(0xff000000),
                        child: SizedBox(height: 40,width: 1,)),
//                    SizedBox(width: 3,),
                    Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '0'
                          ),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                              color: Color(0xffb8bfbd)),
                          child: Center(
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )),
                    InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {print('Hello');},
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),

                              color: Color(0xffE90052)),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
