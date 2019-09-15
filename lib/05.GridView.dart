import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'res/listData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Grid View')),
        body: HomeContent2(),
      ),
      theme: ThemeData(
          primaryColor: Colors.orangeAccent, backgroundColor: Colors.white),
    );
  }
}

// Grid View 用 GridView.count 实现
class HomeContent extends StatelessWidget {
  // List<Widget> _getData() {
  //   var list = listData.map((item) {
  //     return ListView(children: <Widget>[
  //       Image.network(item['imageUrl']),
  //       Text(item['title']),
  //       Text(item['author'])
  //     ]);
  //   });
  //   return list.toList();
  // }

  List<Widget> _getData() {
    var list = listData.map((item) {
      return Container(
        child: Column(children: <Widget>[
          Image.network(item['imageUrl']),
          SizedBox(height: 7),
          Text(item['title'], style: TextStyle(color: Colors.black)),
          SizedBox(height: 3),
          Text(item['author'])
        ]),
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromRGBO(233, 233, 233, 0.8), width: 1)),
      );
    });
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10),
      // 水平 widget 间距
      crossAxisSpacing: 10,
      // 垂直 widget 间距
      mainAxisSpacing: 12,
      // 一行 widget 个数
      crossAxisCount: 3,
      // 宽度/高度比例
      childAspectRatio: .9,
      children: this._getData(),
    );
  }
}

// Grid View 用 GridView.builder 实现
class HomeContent2 extends StatelessWidget {

  Widget _getData(content, index) {
      return Container(
        child: Column(children: <Widget>[
          Image.network(listData[index]['imageUrl']),
          SizedBox(height: 7),
          Text(listData[index]['title'], style: TextStyle(color: Colors.black)),
          SizedBox(height: 3),
          Text(listData[index]['author'])
        ]),
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromRGBO(233, 233, 233, 0.8), width: 1)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        // 宽度/高度比例
        // children: this._getData(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 水平 widget 间距
          crossAxisSpacing: 10,
          // 垂直 widget 间距
          mainAxisSpacing: 15,
          // 一行 widget 个数
          crossAxisCount: 2,
          // 宽度/高度比例
          childAspectRatio: 1,
        ),
        itemCount: listData.length,
        itemBuilder: this._getData,
      )
    );
  }
}
