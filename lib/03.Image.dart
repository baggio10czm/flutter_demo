import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Image')),
        body: HomeContent(),
      ),
      theme: ThemeData(
          primaryColor: Colors.lightBlue, backgroundColor: Colors.white),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      // 添加图片子组件
      // child: Image.network(
      //   "http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg",
      //   alignment: Alignment.topCenter,
      //   fit: BoxFit.cover,
      // ),
      //第二种方式制作圆形图片 一般用作头像
      child: ClipOval(
          child: Image.asset('images/defaultAlbum_img.jpg',
              width: 300, height: 300, fit: BoxFit.cover)),
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(150),
        // 通过装饰里面的 image 制作圆形图片
        // image: DecorationImage(
        //   image: NetworkImage("http://www.guilinenguang.org/public/images/defaultAlbum_img.jpg"),
        //   fit: BoxFit.cover
        // )),
      ),
    ));
  }
}
