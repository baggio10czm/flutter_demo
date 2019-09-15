import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class NewsDetail extends StatefulWidget {
  Map arguments;
  NewsDetail({Key key, this.arguments}): super(key: key);
  @override
  _NewsDetailState createState() => _NewsDetailState(this.arguments);
}

class _NewsDetailState extends State<NewsDetail> {
  Map arguments;
  List detail=[];
  _NewsDetailState(this.arguments);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(arguments);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('新闻详情-flutter_inappbrowser调用webview')),
      body: Column(
        children: <Widget>[
          Expanded(child:
          InAppWebView(
            initialUrl: "http://www.phonegap100.com/newscontent.php?aid=${this.arguments["aid"]}",
//            initialUrl: "http://www.guilinenguang.org/public/love/#/sermons/${arguments['aid']}/sermons",
          ))
        ],
      ),
    );
  }
}
