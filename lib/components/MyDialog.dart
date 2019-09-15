import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyDialog extends Dialog {
  final String title;
  final String content;
  var timer;
  MyDialog({this.title='', this.content=''});

  _showTimer(context){
    timer = Timer.periodic(Duration(milliseconds: 3000),(t){
      Navigator.pop(context);
      timer.cancel();  // 取消定时器
    });
  }

  @override
  Widget build(BuildContext context) {
    _showTimer(context);
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(this.title),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: Icon(Icons.close),
                          onTap: (){
                            Navigator.pop(context);
                            if(timer != null){
                              timer.cancel();
                            }
                          },
                        ),
                      )
                    ],
                  )),
              Divider(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Text(this.content,textAlign: TextAlign.left),
              )
            ],
          )
        )
      ),
    );
  }
}