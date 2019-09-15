import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white54,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: <Widget>[Tab(text: '商品分类'), Tab(text: '所有分类')]))
            ],
          ),
          backgroundColor: Colors.black54,
        ),
        body: TabBarView(children: <Widget>[
          Center(child: Text('商品分类')),
          Column(
            children: <Widget>[
              Text('所有分类'),
              ListTile(
                title: Text('有点小坑'),
                subtitle: Text('which Choose?'),
              )
            ],
          )
        ]),
      ),
    );
  }
}
