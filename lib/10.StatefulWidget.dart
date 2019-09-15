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
        body: HomePage2(),
      ),
      theme: ThemeData(
          primaryColor: Colors.purpleAccent, backgroundColor: Colors.white),
    );
  }
}

// 有状态组件 数++
 class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 200),
        Container(
          alignment: Alignment.center,
          child: Chip(
            label: Text('${this.num}'),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: RaisedButton(
              child: Text('点击++'),
              onPressed: (){
                setState(() {
                  this.num++;
                });
              }),
        ),
      ],
    );
  }
}

// 有状态组件 列表++
class HomePage2 extends StatefulWidget {
  HomePage2({Key key}) : super(key: key);

  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {

  List list=new List();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: list.map((value){
            return ListTile(title: Text(value));
          }).toList(),
        ),
        Container(
          alignment: Alignment.center,
          child: RaisedButton(
              child: Text('点击列表++'),
              onPressed: (){
                setState(() {
                  this.list.add('添加列表数组1');
                  this.list.add('添加列表数组2');
                });
              }),
        ),
      ],
    );

  }
}