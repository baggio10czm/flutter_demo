import 'package:flutter/material.dart';
import 'package:flutter_start/08.AspectRatioCard.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperPage extends StatelessWidget {

  List<Map> imgList= [
    {
      'url': 'http://www.itying.com/images/flutter/1.png'
    },
    {
      'url': 'http://www.itying.com/images/flutter/2.png'
    },
    {
      'url': 'http://www.itying.com/images/flutter/3.png'
    },
    {
      'url': 'http://www.itying.com/images/flutter/4.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Swiper')),
      body: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16/9,
            child: Swiper(itemCount: imgList.length,
              itemBuilder: (BuildContext context,int index){
                return Image.network(imgList[index]['url'],fit: BoxFit.cover);
              },
              autoplay: true,
              autoplayDelay: 3000,
              pagination: SwiperPagination(),),
          )
        ],
      )
    );
  }
}
