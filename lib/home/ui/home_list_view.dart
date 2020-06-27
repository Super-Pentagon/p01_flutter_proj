import 'dart:convert';

import 'package:p01flutterproj/bean/Good.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:convert' as convert;
import 'dart:io';

import 'package:p01flutterproj/utils/native_utils.dart';

class HomeListView extends StatefulWidget {
  HomeListView({Key key}) : super(key: key);

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<Good> goods = [];
  var httpClient = new HttpClient();

  _HomeListViewState() {
    initGoods();
  }

  void initGoods() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http(
        'cn.bing.com', '/HPImageArchive.aspx', {'format': 'js', 'n': '18'});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    Map<String, dynamic> data = convert.jsonDecode(responseBody);
    List<dynamic> list = data['images'];
    for(var index in list) {
      var good = Good();
      good.pictureUrl = "https://www.bing.com" + index['url'];
      setState(() {
        goods.add(good);
      });
    }
    // Assume the response body is something like: ['foo', { 'bar': 499 }]
    // String barValue = data['images']; // barValue is set to 499
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: goods.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: _handleTap,
            child: Material(
              child: GestureDetector( onTap: (){
    NativeUtils.getNativeData("jumpToDetail");},child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 300.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              goods[index].pictureUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            goods[index].price != null ? goods[index].price.toString() : "9.9",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            goods[index].name != null ? goods[index].name : "红烧牛肉",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                height: 60,
              ),),
              color: Colors.white ,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 2.5),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }

  // StaggeredTile _getStaggeredTile(int i) {
  //   return i >= '我是一个标题'.length ? null : tiles[i];
  // }

  void _handleTap() {
    print("object"); //先跳过 实现
  }
}
