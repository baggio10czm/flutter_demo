import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("登录")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Text('这是一个登录页面,点击登录会执行登录操作'),
            RaisedButton(
              child: Text("立即登录"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}