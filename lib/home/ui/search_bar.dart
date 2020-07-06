import 'package:flutter/material.dart';
import 'package:p01flutterproj/utils/native_utils.dart';

class SearChBar extends StatelessWidget {
  const SearChBar({Key key}) : super(key: key);

  Widget buildTextField(BuildContext context) {
    return Theme(
      data: new ThemeData(primaryColor: Colors.grey, hintColor: Colors.grey),
      child: GestureDetector(
        onTap: () {
          NativeUtils.getNativeData("jumpToSearch");
        },
        child: Container(
            constraints: new BoxConstraints.expand(
              height: 40.0,
            ),
            decoration: new BoxDecoration(
              border: new Border.all(width: 2.0, color: Colors.grey),
              color: Colors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
            ),
            padding: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            child: Row(children: <Widget>[
              Container(child: Image.network(
                "https://img-blog.csdnimg.cn/20200627175804911.png",
              ),),
              
              new Text('  搜索商品',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  )),
            ])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: buildTextField(context),
    );
  }
}
