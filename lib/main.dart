import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:p01_flutter_proj/home/swiper_view.dart';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String url) {

  // route名称
  String route =  url.indexOf('?') == -1 ? url : url.substring(0, url.indexOf('?'));
  // 参数Json字符串
  String paramsJson =  url.indexOf('?') == -1 ? '{}' : url.substring(url.indexOf('?') + 1);
  Map<String, dynamic> mapJson = json.decode(paramsJson);  String message = mapJson["message"];
  // 解析参数

  switch (route) {
    case 'home_page':
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter页面'),
          ),
          body: SwiperView(),
        ),
      );
    case 'route2':
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter66666页面'),
          ),
          body: Center(child: Text('页面名字: $route',style: TextStyle(color: Colors.red), textDirection: TextDirection.ltr),),
        ),
      );
    default:
    // Text('Unknown route: $route',style: TextStyle(color: Colors.red), textDirection: TextDirection.ltr),
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter页面'),
          ),
          body: SwiperView(),
        ),
      );
  }}