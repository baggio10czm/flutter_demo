import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Lesson Two')),
        body: HomeContent(),
      ),
      theme: ThemeData(primaryColor: Colors.lightBlue, backgroundColor: Colors.white),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          '组件写法很特别很嵌套',
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.solid,
              letterSpacing: 2.0),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textScaleFactor: 1.5,
        ),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
                color: Colors.blue,
                width: 2.0
            ),
            borderRadius: BorderRadius.all(
              //  Radius.circular(150),    //圆形
              Radius.circular(10),
            )
        ),
        margin: EdgeInsets.fromLTRB(10, 100, 20, 10),
        transform: Matrix4.translationValues(50, 0, 0),
        alignment: Alignment.center,
      ),
    );
  }
}
