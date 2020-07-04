import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:p01flutterproj/home/ui/drop_down_button.dart';
import 'package:p01flutterproj/home/ui/home_list_view.dart';
import 'package:p01flutterproj/home/ui/search_bar.dart';
import 'package:p01flutterproj/utils/color_utils.dart';    // 引入头文件


class SwiperView extends StatefulWidget {
  @override
  _SwiperViewState createState() => _SwiperViewState();
}

class _SwiperViewState extends State<SwiperView> {
  // 声明一个list，存放image Widget
  List<Image> imageList = List();

  @override
  void initState() {
    imageList
      ..add(Image.network(
        'https://img-blog.csdnimg.cn/2020062716214256.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://img-blog.csdnimg.cn/20200627162112824.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://img-blog.csdnimg.cn/20200627162159160.jpg',
        fit: BoxFit.fill,
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:  PreferredSize(      //ios下更改状态栏颜色
          //判断是是否是android，是android需去掉AppBar，否则无AnnotatedRegion无效
          child: Theme.of(context).platform == TargetPlatform.android   
              ? Container()
              : AppBar(
            backgroundColor: Colors.white,
            title: GestureDetector(child: SearChBar(), onTap: (){},),
          ),
          preferredSize: Size.fromHeight(0),
        ),
          body: Scaffold(
        backgroundColor: ColorsUtil.hexColor(0xf5f5f5,alpha: 0.0),
        body: SingleChildScrollView(
          child:  Column(  
            mainAxisSize: MainAxisSize.min,   // 这里使用listView是因为本地写了几组不同样式的展示，太懒了，所以这里就没有改
            children: <Widget>[
              SearChBar(),
              firstSwiperView(),
              // HomeDropDownBtn(),
              HomeListView(),
            ],
        )
      )
    ),
        );
  }

  Widget firstSwiperView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2,
      child: Swiper(
        itemCount: 3,
        viewportFraction: 0.85,
        scale: 0.9,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white
            )
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return Container( // 用Container实现图片圆角的效果
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageList[index].image,// 图片数组
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
