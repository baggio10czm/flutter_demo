import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SharedPreferencesPage extends StatefulWidget {
  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  String username;

  void _saveData() async{
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("username","Czm");
  }
  void _loadData() async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    print(sp.getString('username'));
    setState(() {
      this.username = sp.getString('username');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('本地存储 shared_preferences + 打开应用')),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(onPressed: (){
              this._saveData();
            },
            child: Text('保存数据')),
            RaisedButton(onPressed: (){
              this._loadData();
            },
                child: Text('读取数据')),
            Text(username==null ? 'No Data':username),
            RaisedButton(onPressed: () async{

              const url = 'https://cflutter.com';
              if (await canLaunch(url)) {
              await launch(url);
              } else {
              throw 'Could not launch $url';
              }
            },
                child: Text('打开外部浏览器')),
            RaisedButton(onPressed: () async{

              const tel = 'tel:15677309009';
              if (await canLaunch(tel)) {
                await launch(tel);
              } else {
                throw 'Could not launch $tel';
              }
            },
                child: Text('打电话')),
            RaisedButton(onPressed: () async{
              const tel = 'sms:10086';
              if (await canLaunch(tel)) {
                await launch(tel);
              } else {
                throw 'Could not launch $tel';
              }
            },
                child: Text('发短信')),
            RaisedButton(onPressed: () async{
              /*
               alipays://
               weixin://
               */
              const tel = 'weixin://';
              if (await canLaunch(tel)) {
                await launch(tel);
              } else {
                throw 'Could not launch $tel';
              }
            },
                child: Text('打开外部应用'))
          ],
        ),
      ),
    );
  }
}
