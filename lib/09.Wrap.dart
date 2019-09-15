import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Wrap')),
        body: WrapLayout(),
      ),
      theme: ThemeData(
          primaryColor: Colors.lightGreen, backgroundColor: Colors.white),
    );
  }
}


// Wrap流式布局
class WrapLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 450,
        height: 500,
        color: Colors.blueGrey,
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 50,  // 主轴间隔
          runSpacing: 30, // 次轴间隔
          direction: Axis.vertical,  // 主轴对齐方向
          alignment: WrapAlignment.center,  // 主轴对齐排列方式
          runAlignment: WrapAlignment.end,  // 次轴对齐排列方式
          children: <Widget>[
            MyButton('Button1'),
            MyButton('Button2'),
            MyButton('Button3'),
            MyButton('Button4'),
            MyButton('Button5'),
            MyButton('Button6'),
            MyButton('Button7'),
            MyButton('Button8'),
          ],
        ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  const MyButton(this.text);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text(this.text),
        textColor: Theme.of(context).accentColor ,
        onPressed: (){

        }
    );
  }
}