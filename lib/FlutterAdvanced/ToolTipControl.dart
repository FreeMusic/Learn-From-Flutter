import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
Flutter中的轻提示：toolTip
Flutter中有很多提示控件 比如Dialog、SnackBar和BottomSheet这些操作比较重量级，
存在屏幕时间较长。
Tooltip是继承于StatefulWidget的一个Widget，他并不需要调出方法，当用户长按被Tooltip
包裹的Widget时，会自动弹出相应的操作提示

*/

class YQToolTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Tooltip(
          message: '我只是一个提示',
          child: Icon(Icons.all_inclusive),
        ),
      ),
    );
  }
}
