import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final Map arguments;

  ProductPage({this.arguments});

  @override
  _ProductPageState createState() =>
      _ProductPageState(arguments: this.arguments);
}

class _ProductPageState extends State<ProductPage> {
  Map arguments;

  _ProductPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.of(context).pop(context);
              },
            ),
            appBar: AppBar(
                title: Text(arguments['type']),
                bottom: TabBar(tabs: <Widget>[
                  Tab(text:'热门'),
                  Tab(text:'推荐')]
                )),
            body: TabBarView( children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.fingerprint),
                    title: Text('商品01'),
                    subtitle: Text('商品描述%%##_商品类型:${arguments['type']}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_balance_wallet),
                    title: Text('商品02'),
                    subtitle: Text('商品描述%%##_商品类型:${arguments['type']}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wallpaper),
                    title: Text('商品03'),
                    subtitle: Text('商品描述%%##_商品类型:${arguments['type']}'),
                  ),
                  RaisedButton(
                      child: Text('跳转商品详情'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/productDetail',
                            arguments: {'id': '10903'});
                      })
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('推荐商品005'),
                  ),
                  ListTile(
                    title: Text('推荐商品110'),
                  ),
                ],
              )
            ]),
        ));
  }
}
