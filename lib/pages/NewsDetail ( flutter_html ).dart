import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

// flutter_html 简单html简析用是可以的

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
    this._getNewsDetail(this.arguments['aid']);
  }
  _getNewsDetail(id) async{
    var apiUrl = "http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=$id";
    var response = await Dio().get(apiUrl);
    setState(() {
      detail = json.decode(response.data)['result'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('新闻详情')),
      body: ListView(
        children: <Widget>[
           Text(detail.length>0 ? detail[0]['title']: '毫无数据',style: TextStyle(fontSize: 18,fontWeight:FontWeight.w700)),
          // Text(detail.length>0 ? detail[0]['content']: '毫无数据')
          Html(
            data: """
            ${detail.length>0 ? detail[0]['content']: '毫无数据'}
          """,
            //Optional parameters:
            padding: EdgeInsets.all(8.0),
            linkStyle: const TextStyle(
              color: Colors.redAccent,
              decorationColor: Colors.redAccent,
              decoration: TextDecoration.underline,
            ),
            onLinkTap: (url) {
              print("Opening $url...");
            },
            onImageTap: (src) {
              print(src);
            },
            //Must have useRichText set to false for this to work
            customRender: (node, children) {
              if (node is dom.Element) {
                switch (node.localName) {
                  case "custom_tag":
                    return Column(children: children);
                }
              }
              return null;
            },
            customTextAlign: (dom.Node node) {
              if (node is dom.Element) {
                switch (node.localName) {
                  case "p":
                    return TextAlign.justify;
                }
              }
              return null;
            },
            customTextStyle: (dom.Node node, TextStyle baseStyle) {
              if (node is dom.Element) {
                switch (node.localName) {
                  case "p":
                    return baseStyle.merge(TextStyle(height: 2, fontSize: 20));
                }
              }
              return baseStyle;
            },
          )
        ],
      ),
    );
  }
}
