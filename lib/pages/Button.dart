import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print(11);
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,color: Colors.black,size: 30,),
          backgroundColor: Colors.orange,
          onPressed: () {
            print('FloatingActionButton');
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('默认按钮'),
                  onPressed: () {
                    print('普通按钮点击');
                  }),
              SizedBox(width: 15),
              RaisedButton(
                  child: Text('改色按钮'),
                  color: Colors.amberAccent,
                  textColor: Colors.black54,
                  onPressed: () {
                    print('改色按钮点击');
                  }),
              SizedBox(width: 15),
              RaisedButton(
                  child: Text('阴影按钮'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7,
                  onPressed: () {
                    print('阴影按钮点击');
                  }),
              SizedBox(width: 15),
              RaisedButton.icon(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    print('图标');
                  },
                  icon: Icon(Icons.print),
                  label: Text('图标')),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 130,
                height: 30,
                child: RaisedButton(
                    child: Text('自定义宽高'),
                    onPressed: () {
                      print('自定义宽高');
                    }),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 50,
                child: RaisedButton(
                    child: Text('100%宽度，高度自定义'),
                    onPressed: () {
                      print('100%宽度，高度自定义');
                    }),
              )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('圆角按钮'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  onPressed: () {
                    print('圆角按钮');
                  }),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 70,
                  child: RaisedButton(
                      child: Text('圆形按钮'),
                      splashColor: Colors.orange, // 水波纹颜色
                      shape:
                          CircleBorder(side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        print('圆形按钮');
                      })),
              SizedBox(width: 10),
              FlatButton(
                  color: Colors.black54,
                  textColor: Colors.white,
                  onPressed: () {
                    print('扁平按钮');
                  },
                  child: Text('扁平按钮')),
              SizedBox(width: 10),
              OutlineButton(
                  color: Colors.orangeAccent, // 没有背景颜色无效
                  textColor: Colors.deepOrangeAccent,
                  onPressed: () {
                    print('线框按钮');
                  },
                  child: Text('线框按钮'))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                      onPressed: () {
                        print('按钮组01');
                      },
                      child: Text('按钮组01'),
                      color: Colors.deepOrangeAccent,
                      textColor: Colors.white),
                  RaisedButton(
                      onPressed: () {
                        print('按钮组02');
                      },
                      child: Text('按钮组02'),
                      color: Colors.deepOrangeAccent,
                      textColor: Colors.white)
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyButton(
                  text: '自定义按钮01',
                  width: 100,
                  height: 35,
                  onPressed: () {
                    print('自定义按钮');
                  })
            ],
          )
        ],
      ),
    );
  }
}

// 自定义按钮组件

class MyButton extends StatelessWidget {
  final text;
  final onPressed;
  final double width;
  final double height;

  // ignore: avoid_init_to_null
  const MyButton(
      {this.text = '按钮',
      this.onPressed = null,
      this.width = 80,
      this.height = 30});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: onPressed,
      child: Text(this.text),
    );
  }
}
