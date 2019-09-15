import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var _username = new TextEditingController(); // 初始化赋值需要实例化
  var _password;
  var flag = true;
  int sex = 1;
  var want = 1;
  var switchFlag = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _username.text = '紫影锋';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('表单'),
        ),
//      body: TextDemo(),
        body: Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _username,
                  decoration: InputDecoration(hintText: '用户名'),
                  onChanged: (value) {
                    setState(() {
                      _username.text = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: '密码'),
                  onChanged: (value) {
                    setState(() {
                      this._password = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: this.flag,
                      activeColor: Colors.lightGreen,
                      onChanged: (value) {
                        setState(() {
                          this.flag = value;
                        });
                      },
                    ),
                    Text(this.flag ? '同意' : '不同意！'),
                  ],
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  value: this.flag,
                  title: Text('分享数据'),
                  subtitle: Text('小小一个说明'),
                  secondary: Icon(Icons.flag),
                  onChanged: (value) {
                    setState(() {
                      this.flag = value;
                    });
                  },
                  selected: this.flag,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                        value: 1,
                        groupValue: this.sex,
                        onChanged: (value) {
                          setState(() {
                            this.sex = value;
                          });
                        }),
                    SizedBox(width: 20),
                    Radio(
                        value: 2,
                        groupValue: this.sex,
                        onChanged: (value) {
                          setState(() {
                            this.sex = value;
                          });
                        }),
                    SizedBox(width: 20),
                    Text(this.sex == 1 ? '男' : '女')
                  ],
                ),
                // RadioListTile 父元素不能用ROW !!!!!
                Column(children: <Widget>[
                  RadioListTile(
                    value: 1,
                    title: Text('RadioList'),
                    subtitle: Text('win10 is Good'),
                    secondary: Icon(Icons.landscape),
                    groupValue: this.want,
                    onChanged: (v) {
                      setState(() {
                        this.want = v;
                      });
                    },
                    selected: this.want == 1,
                  ),
                  RadioListTile(
                    value: 2,
                    title: Text('RadioList'),
                    subtitle: Text('win10 is Bad'),
                    secondary: Icon(Icons.pages),
                    groupValue: this.want,
                    onChanged: (v) {
                      setState(() {
                        this.want = v;
                      });
                    },
                    selected: this.want == 2,
                  ),
                  SizedBox(width: 20),
                  Text(this.want == 1 ? 'win10蛮好用' : 'win10不好用')
                ]),
                Row(children: <Widget>[
                  Text('是否开启寻路功能'),
                  Switch(value: this.switchFlag, onChanged: (v){
                    setState(() {
                      this.switchFlag = v;
                    });
                  })
                ]),
                Container(
                  child: RaisedButton(
                      onPressed: () {
                        print(this._username.text);
                        print(this._password);
                      },
                      child: Text('登录'),
                      color: Colors.blue,
                      textColor: Colors.white),
                )
              ],
            )));
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
              decoration: InputDecoration(
            hintText: "请输入搜索内容",
          )),
          SizedBox(height: 25),
          TextField(
              decoration: InputDecoration(
                  hintText: "请输入内容", border: OutlineInputBorder())),
          SizedBox(height: 25),
          TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "多行文本", border: OutlineInputBorder())),
          SizedBox(height: 25),
          TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "密码框", border: OutlineInputBorder())),
          SizedBox(height: 25),
          TextField(
              decoration: InputDecoration(hintText: "请输入", labelText: '用户名')),
          SizedBox(height: 25),
          TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "请输入",
                  labelText: '密码',
                  border: OutlineInputBorder())),
          SizedBox(height: 25),
          TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.queue_music),
                  hintText: "请输入",
                  labelText: '密码',
                  border: OutlineInputBorder())),
        ],
      ),
    );
  }
}
