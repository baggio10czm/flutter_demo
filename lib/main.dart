import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'pages/Tabs.dart';
import 'routes/Route.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 取消debug 显示
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
    ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US')
      ],
//      home: Tabs(),
      // 命名路由
      // routes: {
      //   '/search': (content)=> SearchPage(),
      //   '/form': (content)=> FormPage()
      // },
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute ,
      theme: ThemeData(
          primaryColor: Colors.purpleAccent, backgroundColor: Colors.white),
    );
  }
}
