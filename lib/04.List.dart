import 'package:flutter/material.dart';
import 'res/listData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter List')),
        body: HomeContent5(),
      ),
      theme: ThemeData(
          primaryColor: Colors.lightBlue, backgroundColor: Colors.white),
    );
  }
}

// 垂直LIST
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.sentiment_dissatisfied,
            color: Color.fromRGBO(0, 0, 0, 1),
            size: 50,
          ),
          title: Text('ListTitle'),
          subtitle: Text('组件写法很特别很嵌套组件写法很特别很嵌套'),
        ),
        ListTile(
          leading: Icon(
            Icons.sentiment_dissatisfied,
            color: Color.fromRGBO(0, 0, 0, 1),
            size: 50,
          ),
          title: Text('ListTitle'),
          subtitle: Text('组件写法很特别很嵌套组件写法很特别很嵌套'),
          trailing: Icon(
            Icons.sentiment_very_satisfied,
            color: Color.fromRGBO(0, 0, 0, 1),
            size: 50,
          ),
        ),
        ListTile(
            leading: Image.network(
                "http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg"),
            title: Text('ListTitle'),
            subtitle: Text('组件写法很特别很嵌套组件写法很特别很嵌套')),
      ],
    );
  }
}

// 自定义组件LIST
class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        Container(
          child: Text(
            '每个List标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
          width: 100,
          height: 35,
        ),
        Image.network(
            "http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg",
            width: 200,
            height: 200),
        Container(
          child: Text(
            '每个List标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
          height: 35,
        ),
        Image.network(
            "http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg",
            height: 200),
        Container(
          child: Text(
            '每个List标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
          height: 35,
        ),
        Image.network(
            "http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg",
            height: 200),
        Container(
          child: Text(
            '每个List标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
          height: 35,
        ),
        Image.network(
            "http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg",
            height: 200),
        Container(
          child: Text(
            '每个List标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
          height: 35,
        ),
        Image.network(
            "http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg",
            height: 200),
        Container(
          child: Text(
            '每个List标题',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
          height: 35,
        ),
        Image.network(
            "http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg",
            height: 200),
      ],
    );
  }
}

// 水平LIST
class HomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Container(
            width: 160,
            color: Colors.pinkAccent,
            child: ListView(
              children: <Widget>[
                Text('套中套'),
                Image.network(
                    "http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg"),
              ],
            ),
          ),
          Container(
            width: 160,
            color: Colors.yellow,
          ),
          Container(
            width: 160,
            color: Colors.blue,
          ),
          Container(
            width: 160,
            color: Colors.orangeAccent,
          )
        ],
      ),
    );
  }
}

class AllContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: HomeContent(),
        ),
        Container(
          child: HomeContent2(),
        ),
        Container(
          child: HomeContent3(),
        ),
      ],
    );
  }
}

// 动态List 用自定义方法实现
class HomeContent4 extends StatelessWidget {
  List<Widget> _getData() {
    var list = listData.map((item) {
      return ListTile(
          leading: Image.network(item['imageUrl']),
          title: Text(item['title']),
          subtitle: Text(item['author']));
    });
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: this._getData(),
      ),
    );
  }
}

// 动态List 用itemBuilder实现
class HomeContent5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Image.network(listData[index]['imageUrl']),
                  title: Text(listData[index]['title']),
                  subtitle: Text(listData[index]['author']));
            })
    );
  }
}
