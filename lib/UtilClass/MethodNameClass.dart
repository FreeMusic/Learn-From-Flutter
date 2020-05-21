
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform/platform.dart';

class MethondName {

  static const String calliOSChannel = 'lexiaoyao';//Flutter主动调用iOS方法渠道
  static const String calliOSAlert = 'WeAreVeryHappy';//提示框
  static const String pushNewViewController = 'pushNewViewController';//跳转iOS原生的控制器
}

class CalliOSMethodClass extends Object{

  CalliOSMethodClass();

  CalliOSMethodClass _callClass;

  CalliOSMethodClass.getInstans() {
    if (null == _callClass) {
      _callClass = new CalliOSMethodClass();
    }
  }

  /*Flutter主动调用iOS原生方法*/
  Future callMethodWithName(methodName) async {
    const platform = const MethodChannel(MethondName.calliOSChannel);
    var result;
    try {
      result = await platform.invokeMethod(methodName);
      return Future.value(result);
    } on PlatformException catch (error) {
      return Future.error(error.toString());
    }
  }
}

