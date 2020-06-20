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
        child: StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      itemCount: 18,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: _handleTap,
        child: ListTile(
          trailing: Image.network("https://www.itying.com/images/flutter/2.png"),
          title: Text('1111111111111'),
          subtitle: Text("2222222222222222222"),
        ),
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    ));
  }

  void _handleTap() {
    print("object"); //先跳过 实现
  }
}
