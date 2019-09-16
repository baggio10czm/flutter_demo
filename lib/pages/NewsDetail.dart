import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

// ignore: must_be_immutable
class NewsDetail extends StatefulWidget {
  Map arguments;
  NewsDetail({Key key, this.arguments}): super(key: key);
  @override
  _NewsDetailState createState() => _NewsDetailState(this.arguments);
}

class _NewsDetailState extends State<NewsDetail> {
  Map arguments;
  List detail=[];
  bool _flag= true;

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
          this._flag?_getMoreWidget():Text(""),
          Expanded(child:
          InAppWebView(
            initialUrl: "http://www.phonegap100.com/newscontent.php?aid=${this.arguments["aid"]}",
//            initialUrl: "http://www.guilinenguang.org/public/love/#/sermons/${arguments['aid']}/sermons",
              onProgressChanged: (InAppWebViewController controller, int progress) {
                print(progress/100);
                if((progress/100)>0.999){
                  setState(() {
                    this._flag=false;
                  });
                }
              }
          ))
        ],
      ),
    );
  }


  //加载中的圈圈
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
