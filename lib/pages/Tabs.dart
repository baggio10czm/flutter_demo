import 'package:flutter/material.dart';
import 'taps/HomePage.dart';
import 'taps/MyPage.dart';
import 'taps/CategoryPage.dart';
import 'package:http/http.dart' as http;


class Tabs extends StatefulWidget {
  final int index;

  Tabs({Key key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int index;

  _TabsState(this.index);

  List pageList = [
    HomePage(),
    CategoryPage(),
    MyPage()
  ];

  _getData() async{
    var url = 'http://www.guilinenguang.org/public/api/v1/preacher';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    this._getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('路由，tabs，appBar'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                print('点击了Menu');
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('点击了search');
                }),
            IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  print('点击了message');
                })
          ]),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.only(top: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.white
        ),
        child: FloatingActionButton(
            onPressed: () {
              setState(() {
                this.index = 1;
              });
            },
            child: Icon(Icons.add,size: 33),
        backgroundColor: this.index == 1 ? Colors.purpleAccent : Colors.grey)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this.pageList[this.index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.index,
          iconSize: 25,
          // 选中颜色
          fixedColor: Colors.purpleAccent,
          // 超过3个需要加这个属性
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Category')),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), title: Text('My')),
          ]),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: DrawerHeader(
                  child: Text('Flutter Drawer Header'),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg'),
                          fit: BoxFit.cover)),
                ))
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.message),
              ),
              title: Text('信息'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.queue_music),
              ),
              title: Text('音乐'),
            ),
            Divider(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text('右侧边栏'),
      ),
    );
  }
}
