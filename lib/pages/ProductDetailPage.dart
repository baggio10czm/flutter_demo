import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Map arguments;
  ProductDetailPage({this.arguments});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState(arguments: this.arguments);
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Map arguments;
  _ProductDetailPageState({this.arguments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: (){
          Navigator.of(context).pop(context);
        },
      ),
      appBar: AppBar(title: Text('商品详情')),
      body: Container(
        child: ListTile(
          leading: Icon(Icons.fingerprint),
          title: Text('商品标题'),
          subtitle: Text('商品描述%%##_商品ID:${arguments['id']}'),
        )
      ),
    );
  }
}
