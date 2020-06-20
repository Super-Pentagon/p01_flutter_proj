import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeListView extends StatefulWidget {
  HomeListView({Key key}) : super(key: key);

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: 18,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: _handleTap,
            child: Material(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 300.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3882265467,3924971696&fm=27&gp=0.jpg"),
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
                            '¥9.9',
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
                            '红烧牛肉',
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
              ),
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
