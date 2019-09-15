import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'res/listData2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AspectRatioCard')),
        body: CardLayout3(),
      ),
      theme: ThemeData(
          primaryColor: Colors.blueGrey, backgroundColor: Colors.white),
    );
  }
}

// AspectRatio 相对父容器宽度，设置子元素宽高比
class AspectRatioLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: AspectRatio(
          aspectRatio: 3.0 / 1.0,
          child: Container(
            color: Colors.blue,
          )),
    );
  }
}

// AspectRatio 相对父容器宽度，设置子元素宽高比
class AspectRatioLayout2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.3 / 1.0,
        child: Container(
          color: Colors.blue,
        ));
  }
}

// CardLayout
class CardLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
            margin: EdgeInsets.all(10),
            child: Column(
            children: <Widget>[
              ListTile(
                title: Text("利夫灵"),
                subtitle: Text('高级工程师'),
              ),
              ListTile(
                title: Text("电话：190020021")
              ),
              ListTile(
                title: Text("地址：北京市垃圾卡斯基亲王")
              )
              ])
        ),
        Card(
            margin: EdgeInsets.all(10),
            child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("马精武"),
                    subtitle: Text('测试工程师'),
                  ),
                  ListTile(
                      title: Text("电话：1912320081")
                  ),
                  ListTile(
                      title: Text("地址：广州沙利文请饶恕的")
                  )
                ])
        ),
        Card(
            margin: EdgeInsets.all(10),
            child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("J.Z.深水区"),
                    subtitle: Text('玛纳斯'),
                  ),
                  ListTile(
                      title: Text("电话：1912320081")
                  ),
                  ListTile(
                      title: Text("地址：广州沙利文请饶恕的")
                  )
                ])
        )
      ],
    );
  }
}

// CardLayout2
class CardLayout2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20/9,
                child: Image.network("http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg", fit: BoxFit.cover),
              ),
              ListTile(
                leading: ClipOval(
                    child: Image.network("http://www.guilinenguang.org/public/images/defaultSermon_img01.jpg", width: 60, height: 60, fit: BoxFit.cover)
                ),
                title: Text('奥斯曼三千理论上完全'),
                subtitle: Text('三马上去微软'),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20/9,
                child: Image.network("http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg", fit: BoxFit.cover),
              ),
              ListTile(
                leading:  CircleAvatar(
                  backgroundImage: NetworkImage("http://www.guilinenguang.org/public/images/defaultSermon_img02.jpg"),
                ),
                title: Text('奥斯曼三千理论上完全'),
                subtitle: Text('三马上去微软'),
              )
            ],
          ),
        )
      ],
    );
  }
}
// CardLayout3 动态卡片
class CardLayout3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listData.map((value){
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 20/9,
                child: Image.network(value['imageUrl'], fit: BoxFit.cover),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ListTile(
                  leading:  CircleAvatar(
                    backgroundImage: NetworkImage(value['imageUrl']),
                  ),
                  title: Text(value['title']),
                  subtitle: Text(value['description'],maxLines: 2,overflow: TextOverflow.ellipsis,),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}