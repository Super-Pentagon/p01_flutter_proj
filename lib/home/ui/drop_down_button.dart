import 'package:flutter/material.dart';

class HomeDropDownBtn extends StatefulWidget {
  HomeDropDownBtn({Key key}) : super(key: key);

  @override
  _HomeDropDownBtnState createState() => _HomeDropDownBtnState();
}

class _HomeDropDownBtnState extends State<HomeDropDownBtn> {
  String value = "3";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      // decoration: BoxDecoration(
      //   border: Border.all(),
      // ),
      child: new DropdownButton(
        items: <DropdownMenuItem<String>>[
          DropdownMenuItem(
            child: Text(
              "1111",
              style:
                  TextStyle(color: value == "1" ? Colors.black : Colors.grey),
            ),
            value: "1",
          ),
          DropdownMenuItem(
            child: Text(
              "2222",
              style:
                  TextStyle(color: value == "2" ? Colors.black : Colors.grey),
            ),
            value: "2",
          ),
          DropdownMenuItem(
            child: Text(
              "3333",
              style:
                  TextStyle(color: value == "3" ? Colors.black : Colors.grey),
            ),
            value: "3",
          ),
          DropdownMenuItem(
            child: Text(
              "4444",
              style:
                  TextStyle(color: value == "4" ? Colors.black : Colors.grey),
            ),
            value: "4",
          ),
        ],
        hint: new Text("提示信息"), // 当没有初始值时显示
        onChanged: (selectValue) {
          //选中后的回调
          setState(() {
            value = selectValue;
          });
        },
        value: value, // 设置初始值，要与列表中的value是相同的
        elevation: 10, //设置阴影
        style: new TextStyle(
            //设置文本框里面文字的样式
            color: Colors.blue,
            fontSize: 15),
        iconSize: 30, //设置三角标icon的大小
        underline: Container(
          height: 1,
          color: Colors.blue,
        ), // 下划线
      ),
    );
  }
}
