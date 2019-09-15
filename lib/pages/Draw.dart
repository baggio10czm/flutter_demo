import 'package:flutter/material.dart';

class DrawPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: (){
          Navigator.of(context).pop(context);
        },
      ),
      appBar: AppBar(title: Text('侧滑 Draw')),
      body: Text('DrawPage'),
      drawer: Drawer(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: UserAccountsDrawerHeader(
                      accountName: Text('Czm'),
                      accountEmail: Text('122300413@qq.com'),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage('http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg'),
                      ),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('http://www.guilinenguang.org/public/images/defaultSermon_img03.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                      otherAccountsPictures: <Widget>[
                        Image.network('http://www.guilinenguang.org/public/images/defaultSermon_img02.jpg'),
                        Image.network('http://www.guilinenguang.org/public/images/defaultSermon_img05.jpg'),
                      ],
                    ),
                  )
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
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.supervised_user_circle),
                ),
                title: Text('MY'),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/my');
                },
              ),
              Divider(),
            ],
          ),
        )
    );
  }
}