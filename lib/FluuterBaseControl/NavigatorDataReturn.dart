import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
页面跳转并返回数据：
异步请求和等待：Dart的异步请求和等待直接使用async...wait就可以实现

*/

/*第一个页面*/
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(title: Text('找小姐姐要电话'),),
      body: Center(
        child: RouteButton(),
      ),
    );
  }
}

/*跳转的按钮*/
class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {
        _navigateToXiaoJieJie(context);
      },
      child: Text("下一步按钮"),
    );
  }

  _navigateToXiaoJieJie(BuildContext context) async {
    //启用异步方法

    final result = await Navigator.push(
        //等待
        context,
        MaterialPageRoute(builder: (context) => XiaoJieJie()));
    //SnackBar的使用 SnackBar是用户操作后，显示提示信息的一个控件，类似Tost，会自动隐藏。
    //SnackBar是以Scaffold的showSnackBar方法来进行的
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}

/*小姐姐的实体类*/
class XiaoJieJie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('我是小姐姐'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('大长腿小姐姐'),
              onPressed: () {
                Navigator.pop(context, '大长腿：15734569078');
              },
            ),
            RaisedButton(
              child: Text('小蛮腰小姐姐'),
              onPressed: () {
                Navigator.pop(context, '小蛮腰：17845692301');
              },
            ),
          ],
        ),
      ),
    );
  }
}
/*
静态资源和项目图片的处理:
首先找到pubspec.yaml 文件
*/
