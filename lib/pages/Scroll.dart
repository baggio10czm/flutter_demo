import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class ScrollPage extends StatefulWidget {
  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  int _page = 1;
  List _list = [];
  bool _hasMore = true;
  ScrollController _ScrollController = new ScrollController();

  void _getNews() async {
    if (_hasMore) {
//      var apiUrl = "http://www.guilinenguang.org/public/api/v1/album/type/1";
      var apiUrl = "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=$_page";
      var response = await Dio().get(apiUrl);
//      print(response.data);
      var res = jsonDecode(response.data)['result'];
//      print(res);

      // 拼接新数据
      setState(() {
        this._list.addAll(res);
      });

      print('加载了:${this._list.length}条数据');

      // 如果新获取的数据小于20条，说明没有更多数据了(应该是有bug，万一最后一条也是20条数据。。。应该还是需要用total来判断)
      if (res.length < 20) {
        setState(() {
          _hasMore = false;
        });
      } else {
        setState(() {
          this._page++;
        });
      }
    } else {
      print('没有更多数据了');
    }
  }

  //下拉刷新
  Future<void> _onRefresh() async {
    _page = 1;
    _hasMore = true;
    await Future.delayed(Duration(milliseconds: 2000), () {
      print('下拉刷新数据');
      this._getNews();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getNews();

    _ScrollController.addListener(() {
      // 获取滚动距离
      // print(_ScrollController.position.pixels);
      // 获取总高度
      // print(_ScrollController.position.maxScrollExtent);

      if (_ScrollController.position.pixels > _ScrollController.position.maxScrollExtent - 40) {
        print('加载更多了,当前页：$_page');
        this._getNews();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('上拉加载，下拉刷新')),
        body: this._list.length > 0
            ? RefreshIndicator(
                child: ListView.builder(
                  controller: _ScrollController,
                  itemBuilder: (context, index) {
                    if (index == this._list.length - 1) {
                      return Column(
                        children: <Widget>[ListTile(title: Text(this._list[index]['title'], maxLines: 1),onTap: (){
                          Navigator.pushNamed(context, '/newsDetail',arguments: {'aid': this._list[index]['aid']});
                        }), Divider(), _getMoreWidget()],
                      );
                    } else {
                      return Column(
                        children: <Widget>[ListTile(title: Text(this._list[index]['title'], maxLines: 1),onTap: (){
                          Navigator.pushNamed(context, '/newsDetail',arguments: {'aid': this._list[index]['aid']});
                        }), Divider()],
                      );
                    }
                  },
                  itemCount: this._list.length,
                ),
                onRefresh: _onRefresh)
            : Text('加载ing...'));
  }

  Widget _getMoreWidget() {
    if (_hasMore) {
      return Center(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[CircularProgressIndicator(strokeWidth: 1.0), Text('加载中...', style: TextStyle(fontSize: 16.0))])));
    } else {
      return Center(child: Text('------我是有底线的------'));
    }
  }
}
