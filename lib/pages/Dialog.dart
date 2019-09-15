import 'package:flutter/material.dart';
import 'package:flutter_start/components/MyDialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void _alertDialog() async{
    var result = await showDialog(
      context:context,
      builder: (context){
      return AlertDialog(
        title: Text('提示信息'),
        content: Text('您确定要这样吗？'),
        actions: <Widget>[
            FlatButton(onPressed:(){Navigator.pop(context,'点了取消');}, child: Text('取消')),
            FlatButton(onPressed:(){Navigator.pop(context,'点了确定');}, child: Text('确定')),
        ],
      );
    });
    // 小技巧：通过async await 得到返回值，也可以直接在按钮点击事件里操作
    print(result);
  }

  void _simpleDialog(){
    showDialog(context: context,
    builder: (context){
      return SimpleDialog(
        title: Text('选择内容'),
        children: <Widget>[
          SimpleDialogOption(
            child: Text('足球'),
            onPressed: (){
              print('选择了足球');
              Navigator.pop(context);
            }
          ),
          Divider(),
          SimpleDialogOption(
              child: Text('篮球'),
              onPressed: (){
                print('选择了篮球');
                Navigator.pop(context);
              }
          ),
          Divider(),
          SimpleDialogOption(
              child: Text('电影'),
              onPressed: (){
                print('选择了电影');
                Navigator.pop(context);
              }
          ),
          Divider(),
          SimpleDialogOption(
              child: Text('旅游'),
              onPressed: (){
                print('选择了旅游');
                Navigator.pop(context);
              }
          ),
          Divider(),
          SimpleDialogOption(
              child: Text('玩游戏'),
              onPressed: (){
                print('选择了游戏');
                Navigator.pop(context);
              }
          ),
        ],
      );
    });
  }
  void _actionSheetDialog(){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: 215,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('分享A'),
              onTap: (){
                print('A');
                Navigator.pop(context);
              }
            ),
            Divider(),
            ListTile(
                title: Text('分享B'),
                onTap: (){
                  print('B');
                  Navigator.pop(context);
                }
            ),
            Divider(),
            ListTile(
                title: Text('分享C'),
                onTap: (){
                  print('C');
                  Navigator.pop(context);
                }
            ),
            Divider(),
            ListTile(
                title: Text('分享D'),
                onTap: (){
                  print('C');
                  Navigator.pop(context);
                }
            )
          ],
        ),
      );
    });
  }
  void _toast(){
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Dialog')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: _alertDialog,
                child: Text('alertDialog')),
            RaisedButton(onPressed: _simpleDialog,
                child: Text('simpleDialog')),
            RaisedButton(onPressed: _actionSheetDialog,
                child: Text('actionSheetDialog')),
            RaisedButton(onPressed: _toast,
                child: Text('toast 第三方')),
            RaisedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return MyDialog(
                      title:'自定义的titile',
                      content:'content',
                    );
                  });
            },
                child: Text('自定义Dialog')),
          ],
        ),
      ),
    );
  }
}
