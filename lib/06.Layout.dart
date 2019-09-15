import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Padding, Column, Row, Expanded')),
        body: LayoutDemo4(),
      ),
      theme: ThemeData(
          primaryColor: Colors.greenAccent, backgroundColor: Colors.white),
    );
  }
}

// ROW 水平布局
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 800.0,
        width: 400.0,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start, //用的比较少
          children: <Widget>[
            IconContainer(Icons.account_balance_wallet,
                size: 30.0, color: Colors.green),
            IconContainer(Icons.account_balance,
                size: 40.0, color: Colors.pink),
            IconContainer(Icons.save, size: 30.0, color: Colors.blue),
            IconContainer(Icons.save)
          ],
        ));
  }
}

// 组件
class IconContainer extends StatelessWidget {
  double size;
  Color color;
  IconData icon;

  IconContainer(this.icon, {this.size = 32.0, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      color: this.color,
      child:
          Center(child: Icon(this.icon, size: this.size, color: Colors.white)),
    );
  }
}

// Column 水平布局
class LayoutDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 800.0,
        width: 400.0,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center, //用的比较少
          children: <Widget>[
            IconContainer(Icons.account_balance_wallet,
                size: 30.0, color: Colors.green),
            IconContainer(Icons.account_balance,
                size: 40.0, color: Colors.pink),
            IconContainer(Icons.save, size: 30.0, color: Colors.blue),
            IconContainer(Icons.save)
          ],
        ));
  }
}

// Column 水平布局
class LayoutDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 800.0,
        width: 400.0,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start, //用的比较少
          children: <Widget>[
            IconContainer(Icons.score, size: 30.0, color: Colors.green),
            Expanded(
                flex: 2,
                child: IconContainer(Icons.sentiment_very_satisfied, size: 30.0, color: Colors.pink)),
            Expanded(
                flex: 1,
                child:IconContainer(Icons.cake, size: 30.0, color: Colors.blue))
          ],
        ));
  }
}

// 综合练习
class LayoutDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                height: 180,
                color: Colors.blueGrey
              ))
        ]),
        SizedBox(height: 10),
        Row(children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  height: 180,
                  child: Image.network("http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg", fit: BoxFit.cover,),
                )),
          SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Container(
                height: 180,
                  child: ListView(children: <Widget>[
                    Container(
                      height: 85,
                      child: Image.network("http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg", fit: BoxFit.cover),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 85,
                      child: Image.network("http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg", fit: BoxFit.cover),
                    )
                  ]),
              ),
            )
          ]
        )
      ],
    );
  }
}
