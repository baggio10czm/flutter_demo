import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import 'package:flutter_start/pages/SearchPage.dart';
import 'package:flutter_start/pages/ProductPage.dart';
import 'package:flutter_start/pages/ProductDetailPage.dart';
import 'package:flutter_start/pages/user/Login.dart';
import 'package:flutter_start/pages/user/RegisterFirst.dart';
import 'package:flutter_start/pages/user/RegisterSecond.dart';
import 'package:flutter_start/pages/user/RegisterThird.dart';
import 'package:flutter_start/pages/TabBarController.dart';
import 'package:flutter_start/pages/Draw.dart';
import 'package:flutter_start/pages/taps/MyPage.dart';
import 'package:flutter_start/pages/Button.dart';
import 'package:flutter_start/pages/Form.dart';
import 'package:flutter_start/pages/FormDemo.dart';
import 'package:flutter_start/pages/DateFormat.dart';
import 'package:flutter_start/pages/dateThird.dart';
import 'package:flutter_start/pages/SwiperPage.dart';
import 'package:flutter_start/pages/Dialog.dart';
import 'package:flutter_start/pages/Http.dart';
import 'package:flutter_start/pages/Scroll.dart';
import 'package:flutter_start/pages/NewsDetail.dart';
import 'package:flutter_start/pages/Device.dart';
import 'package:flutter_start/pages/SharedPreferences.dart';

final routes = {
  '/': (content) => Tabs(),
  '/search': (content, {arguments}) => SearchPage(arguments: arguments),
  '/product': (content, {arguments}) => ProductPage(arguments: arguments),
  '/productDetail': (content, {arguments}) => ProductDetailPage(arguments: arguments),
  '/login': (content) => Login(),
  '/registerFirst': (content) => RegisterFirstPage(),
  '/registerSecond': (content) => RegisterSecondPage(),
  '/registerThird': (content) => RegisterThirdPage(),
  '/registerThird': (content) => RegisterThirdPage(),
  '/tabBarController': (content) => TabBarControllerPage(),
  '/draw': (content) => DrawPage(),
  '/my': (content) => MyPage(),
  '/button': (content) => ButtonPage(),
  '/form': (content) => FormPage(),
  '/formDemo': (content) => FormDemoPage(),
  '/dateFormat': (content) => DateFormatPage(),
  '/dateThird': (content) => DateThird(),
  '/swiper': (content) => SwiperPage(),
  '/dialog': (content) => DialogPage(),
  '/http': (content) => HttpPage(),
  '/scroll': (content) => ScrollPage(),
  '/newsDetail': (content, {arguments}) => NewsDetail(arguments: arguments),
  '/device': (content) => DevicePage(),
  '/sharedPreferences': (content) => SharedPreferencesPage(), // url_launcher 打开外部浏览器，打电话，发短信，外部应用
};

// ignore: strong_mode_top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
