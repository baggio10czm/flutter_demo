import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Map arguments;
  SearchPage({Key key,this.arguments}) : super(key: key);

  _SearchPageState createState() => _SearchPageState(arguments:this.arguments);
}

class _SearchPageState extends State<SearchPage> {
  final Map arguments;
  _SearchPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SearchPage')),
      body: Text('搜索名：${arguments["name"]}'),
    );
  }
}