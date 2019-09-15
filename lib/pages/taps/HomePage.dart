import 'package:flutter/material.dart';

//普通路由跳转需要引入
import '../SearchPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Wrap(
        runSpacing: 20,
        spacing: 12,
        children: <Widget>[
          RaisedButton(
              child: Text('搜索页'),
              onPressed: (){
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //       builder: (context)=> SearchPage())
                // );
                Navigator.pushNamed(context, '/search',arguments:{'name':'Czm'});
              }),
          RaisedButton(
              child: Text('商品页'),
              onPressed: (){
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //       builder: (context)=> SearchPage())
                // );
                Navigator.pushNamed(context, '/product',arguments:{'type':'海淘商品'});
              }),
          RaisedButton(
              child: Text('TabBarController'),
              onPressed: (){
                Navigator.pushNamed(context, '/tabBarController');
              }),
          RaisedButton(
              child: Text('Draw侧滑'),
              onPressed: (){
                Navigator.pushNamed(context, '/draw');
              }),
          RaisedButton(
              child: Text('Button'),
              onPressed: (){
                Navigator.pushNamed(context, '/button');
              }),
          RaisedButton(
              child: Text('表单'),
              onPressed: (){
                Navigator.pushNamed(context, '/form');
              }),
          RaisedButton(
              child: Text('表单综合'),
              onPressed: (){
                Navigator.pushNamed(context, '/formDemo');
              }),
          RaisedButton(
              child: Text('日期'),
              onPressed: (){
                Navigator.pushNamed(context, '/dateFormat');
              }),
          RaisedButton(
              child: Text('第三方日期插件'),
              onPressed: (){
                Navigator.pushNamed(context, '/dateThird');
              }),
          RaisedButton(
              child: Text('Swiper'),
              onPressed: (){
                Navigator.pushNamed(context, '/swiper');
              }),
          RaisedButton(
              child: Text('Dialog'),
              onPressed: (){
                Navigator.pushNamed(context, '/dialog');
              }),
          RaisedButton(
              child: Text('Http'),
              onPressed: (){
                Navigator.pushNamed(context, '/http');
              }),
          RaisedButton(
              child: Text('上拉加载下拉刷新'),
              onPressed: (){
                Navigator.pushNamed(context, '/scroll');
              }),
          RaisedButton(
              child: Text('设备信息和高德定位'),
              onPressed: (){
                Navigator.pushNamed(context, '/device');
              }),
        ],
      )
    );
  }
}