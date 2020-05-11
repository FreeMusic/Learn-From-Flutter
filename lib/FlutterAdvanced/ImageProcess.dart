import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

/*
毛玻璃处理效果:毛玻璃的效果对系统的消耗比较大
BackdropFilter就是背景滤镜组件，使用它可以给父元素增加滤镜效果，
它里面的最重要的一个属性是filter。filter属性中要添加一个滤镜组件
*/
class FrostedGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        //重叠的Stack,实现重贴
        children: <Widget>[
          ConstrainedBox(
            //约束盒子组件，添加额外的限制条件大child上
            constraints: const BoxConstraints.expand(), //限制条件可扩展的
            child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg'),
          ),
          Center(
            child: ClipRect(
              //裁切长方形
              child: BackdropFilter(
                //背景滤镜器
                //图片模糊过滤，横向竖向都设置5.0
                filter: prefix0.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Opacity(
                  //透明控件
                  opacity: 0.5,
                  child: Container(
                    //容器控件
                    width: 500,
                    height: 700,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Center(
                      child: Text(
                        '乐逍遥',
                        style: Theme.of(context).textTheme.display3, //设置比较酷炫的字体
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
