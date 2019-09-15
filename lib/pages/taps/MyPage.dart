import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 800.0,
        width: 800.0,
        color: Colors.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('登录'),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                }),
            RaisedButton(
                child: Text('注册'),
                onPressed: () {
                  Navigator.pushNamed(context, '/registerFirst');
                })
          ],
        ));
  }
}
