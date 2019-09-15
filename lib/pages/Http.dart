import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  String _name = '默认名字';
  List dataList = [];

  _httpGet() async {
    var url = "http://www.guilinenguang.org/public/api/v1/preacher";

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      setState(() {
        dataList = json.decode(response.body);
        this._name = dataList[14]['name'];
      });
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  // http POST请求
  // var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});


  void dioGetHttp() async {
    // Response response;
    // Dio dio = new Dio();
    // response = await dio.get("/test?id=12&name=wendu");
    // print(response.data.toString());
    // 请求参数也可以通过对象传递，上面的代码等同于：
    // response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
    // print(response.data.toString());
    try {
      Response response = await Dio().get("http://www.guilinenguang.org/public/api/v1/preacher");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  // Dio 发起一个 POST 请求:
  //response = await dio.post("/test", data: {"id": 12, "name": "wendu"});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Map userInfo = {'name': 'cZM', 'hope': 'God'};

    var jsonMap = json.encode(userInfo); //将map转换成json 字符串
    print(userInfo is Map);
    print(jsonMap is String);
    print(jsonMap);

    String jsonData = '''
    {"name": "cZM","hope": "God"}
         ''';

    Map dataMap = json.decode(jsonData); //将json 字符串转换成map
    print(dataMap is Map);
    print(jsonData is String);
    print(dataMap['hope']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Http请求,数据处理')),
        body: Container(
            child: Column(children: <Widget>[
          Text(this._name),
          RaisedButton(onPressed: _httpGet, child: Text('get 请求')),
          RaisedButton(onPressed: _httpGet, child: Text('post 请求')),
            Expanded(
              child: ListView(
                  children: this.dataList.length > 0
                      ? this.dataList.map((item) {
                          return ListTile(
                            title: Text(item['name']),
                          );
                        }).toList()
                      : <Widget>[ Text('加载中')] // 注意要加 <Widget>[...]
              ))
        ])));
  }
}
