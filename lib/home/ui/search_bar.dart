import 'package:flutter/material.dart';

class SearChBar extends StatelessWidget {
  const SearChBar({Key key}) : super(key: key);

  Widget buildTextField() {
    return Theme(
      data: new ThemeData(primaryColor: Colors.grey, hintColor: Colors.grey),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            hintText: ' 🔍 搜索商品',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
//            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: buildTextField(),
    );
  }
}