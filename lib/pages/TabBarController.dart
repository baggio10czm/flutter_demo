import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  // 生命周期——销毁
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  // 生命周期——初始化
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    //  监听tabs切换
    _tabController.addListener((){
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarController'),
        bottom: TabBar(controller: this._tabController, tabs: <Widget>[
          Tab(text: '足球'),
          Tab(text: '电影'),
          Tab(text: '旅游'),
        ]),
      ),
      body: TabBarView(controller: this._tabController,children: <Widget>[
        Center(child: Text('足球')),
        Center(child: Text('电影')),
        Center(child: Text('旅游')),
      ]),
    );
  }
}
