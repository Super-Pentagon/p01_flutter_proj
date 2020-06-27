import 'package:flutter/services.dart';

class NativeUtils{

  static const String NATIVE_CHANNEL_NAME = "com.cc.flutter.native"; //给native发消息，此处应和客户端名称保持一致
  //channel_name每一个通信通道的唯一标识，在整个项目内唯一！！！
  static const _channel = const MethodChannel(NATIVE_CHANNEL_NAME);

  ///
  /// @Params:
  /// @Desc: 获取native的数据
  ///
  static getNativeData(key,[ dynamic arguments ]) async{
    try {
      String resultValue = await _channel.invokeMethod(key, arguments);
      return resultValue;
    }on PlatformException catch (e){
      print(e.toString());
      return "";
    }
  }

   static registerMethod(){
    //接收处理原生消息
    _channel.setMethodCallHandler((handler) {
      switch (handler.method) {
        case "aaa": 
          // 发送原生消息
          _channel.invokeMethod("toast", {"msg": "您调用了dart里的方法"});
          break;
      }
    });
  }
}