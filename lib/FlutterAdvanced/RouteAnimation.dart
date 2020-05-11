import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
主要介绍路由动画：
路有动画的原理：重写并继承PageRouterBuilder这个类里的transitionsBuilder方法。
AppBar Widger的 elevation 属性：
这个值是AppBar滚动时的融合程度，一般有滚动时默认是4.0，现在我们设置成0.0，也就是和main完全融合了
* */
/*开始页面*/
class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
//      appBar: AppBar(
//        title: Text(
//          'StartPage',
//          style: TextStyle(fontSize: 36),
//        ),
//        elevation: 0.0,
//      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64,
          ),
          onPressed: () {
            //普通的push方式
//            Navigator.of(context)
//                .push(MaterialPageRoute(builder: (BuildContext context) {
//              return EndPage();
//            }));
            //路由动画 渐变式push
//            Navigator.push(context, CustomRoute(EndPage()));
            //缩放路由动画
//            Navigator.push(context, ScaleRouter(EndPage()));
            //旋转加缩放路由动画
            Navigator.push(context, RotateScaleRouter(EndPage()));
            //左右滑动路由动画
//            Navigator.push(context, SlidingRouter(EndPage()));
          },
        ),
      ),
    );
  }
}

/*二级页面*/
class EndPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          'EndPage',
          style: TextStyle(fontSize: 36),
        ),
        backgroundColor: Colors.pinkAccent,
        leading: Container(),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}

/*
开始路由动画 上面的是普通动画
FadeTransition:渐隐渐现过渡效果，主要设置opactiy（透明度）属性，值是0.0~1.0
animate:动画的样式，一般使用动画曲线组件(CurvedAnimation)
curve:设置动画的节奏，也就是常说的曲线，改变曲线从而实现多种动画效果
transitionDuration:设置动画的持续时间，建议1~2之间
*/
class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  CustomRoute(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 1), //
            pageBuilder: (
              BuildContext context,
              Animation<double> animationStart,
              Animation<double> animationEnd,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animationStart,
                Animation<double> animationEnd,
                Widget child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationStart, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

/*缩放路由*/
class ScaleRouter extends PageRouteBuilder {
  final Widget widget;

  ScaleRouter(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 1), //
            pageBuilder: (
              BuildContext context,
              Animation<double> animationStart,
              Animation<double> animationEnd,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animationStart,
                Animation<double> animationEnd,
                Widget child) {
              return ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationStart, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

/*旋转+缩放路由*/
class RotateScaleRouter extends PageRouteBuilder {
  final Widget widget;

  RotateScaleRouter(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 1), //
            pageBuilder: (
              BuildContext context,
              Animation<double> animationStart,
              Animation<double> animationEnd,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animationStart,
                Animation<double> animationEnd,
                Widget child) {
              return RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationStart, curve: Curves.fastOutSlowIn)),
                child: ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animationStart, curve: Curves.fastOutSlowIn)),
                  child: child,
                ),
              );
            });
}

/*左右滑动路由动画*/
class SlidingRouter extends PageRouteBuilder {
  final Widget widget;

  SlidingRouter(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 1), //
            pageBuilder: (
              BuildContext context,
              Animation<double> animationStart,
              Animation<double> animationEnd,
            ) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animationStart,
                Animation<double> animationEnd,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                    .animate(CurvedAnimation(
                        parent: animationStart, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
