import 'package:flutter/material.dart';

class FormDemoPage extends StatefulWidget {
  @override
  _FormDemoPageState createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {
  String _username; // 初始化赋值需要实例化
  String _password;
  int sex = 1;

  List hobby = [
    {'checked': true, 'title': '足球'},
    {'checked': true, 'title': '篮球'},
    {'checked': true, 'title': '登上'},
    {'checked': true, 'title': '音乐'},
    {'checked': true, 'title': '旅游'},
    {'checked': true, 'title': '电影'},
  ];

  List<Widget> getHobby() {
    List<Widget> list = [];
    for (var i = 0; i < this.hobby.length; ++i) {
      list.add(
        Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(this.hobby[i]['title'])),
      );
      list.add(
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Checkbox(
              value: this.hobby[i]['checked'],
              onChanged: (v) {
                setState(() {
                  this.hobby[i]['checked'] = v;
                });
              }),
        ),
      );
    }
    return list;
  }

  void setData(value) {
    setState(() {
      this.sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('表单综合'),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText:'账号', hintText: '输入账号'),
                  onChanged: (v) {
                    setState(() {
                      this._username = v;
                    });
                  },
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText:'密码', hintText: '请输入密码'),
                  onChanged: (v) {
                    setState(() {
                      this._password = v;
                    });
                  },
                ),
                Row(children: <Widget>[
                  Text('男'),
                  Radio(
                      value: 1, groupValue: this.sex, onChanged: this.setData),
                  SizedBox(width: 20),
                  Text('女'),
                  Radio(value: 2, groupValue: this.sex, onChanged: this.setData)
                ]),
                Wrap(children: this.getHobby()),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: '描述信息'
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: 200,
                  height: 35,
                  child: RaisedButton(
                      onPressed: () {
                        print(this.sex);
                        print(this._username);
                        print(this._password);
                        print(this.hobby);
                      },
                      child: Text('提交')),
                )
              ],
            )));
  }
}
