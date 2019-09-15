import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack,Align,Positioned')),
        body: LayoutDemo2(),
      ),
      theme: ThemeData(
          primaryColor: Colors.limeAccent, backgroundColor: Colors.white),
    );
  }
}

// Stack 定位布局 一般不这样使用
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment(.5,.3),
        children: <Widget>[
          Container(
            width: 200,
            height: 300,
            color: Colors.blueGrey,
          ),
          Text('这是一个盒子'),
        ],
      ),
    );
  }
}

// Stack 定位布局
class LayoutDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 300,
        color: Colors.orangeAccent,
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child:Icon(Icons.wb_cloudy,size: 30,color: Colors.white)
            ),
            Align(
                alignment: Alignment(.5,.1),
                child:Icon(Icons.score,size: 30,color: Colors.white)
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child:Icon(Icons.account_balance,size: 30,color: Colors.white)
            ),
            Positioned(
                left: 30,
                bottom: 50,
                child:Icon(Icons.gavel,size: 30,color: Colors.white)
            ),
            Positioned(
                left: 60,
                bottom: 170,
                child:Icon(Icons.tap_and_play,size: 30,color: Colors.white)
            )
          ],
        ),
      ),
    );
  }
}