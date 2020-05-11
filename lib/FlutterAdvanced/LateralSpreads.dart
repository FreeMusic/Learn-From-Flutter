import 'package:flutter/cupertino.dart';
/*
侧滑返回案例

Cupertino UI：Flutter有两套UI模板，一套是material，另一套是Cupertino。
Cupertino主要针对的是iOS系统

CupertinoPageScaffold跟Scaffold很类似。不过它里面的参数都是child：
Cupertino有很多Widget属性，都是Cupertino开头的
*/

class YQLateralSpreads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: CupertinoColors.activeBlue,
          child: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (BuildContext context) {
                return YQLateralSpreads();
              }));
            },
          ),
        ),
      ),
    );
  }
}
