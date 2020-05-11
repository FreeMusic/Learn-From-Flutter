import 'package:flutter/material.dart';
/*贝塞尔曲线*/

/*
ClipPath路径裁切控件,主要有两个属性（参数）：
child，要切割的元素，可以使容器，也可以是图片等等
clipper:切割的路径，这个要和CustomClipper对象结合使用

在Scaffold里放置了一个列容器，然后把ClipPath控件放到了里边，
ClipPath的子元素是一个容器控件Container。
YQBottomCLipper是我们自定义的一个对象，里边主要就是切割的路径。

# CustomClipper 裁切路径

我们主要的贝塞尔曲线路径就写在getClip方法里，它返回一段路径。

一个二阶的贝塞尔曲线是需要控制点和终点的，控制点就像一块磁铁，
把直线吸引过去，形成一个完美的弧度，这个弧度就是贝塞尔曲线了。
*/

class YQClipPath extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: YQBottomCLipper(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}

class YQBottomCLipper extends CustomClipper<Path> {

  @override
    Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-30);

    var firstControlPoint = Offset(size.width/2, size.height);
    var firstEndPoint = Offset(size.width, size.height-30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height-30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}
/*
波浪式贝塞尔曲线
*/

class YQWaveClipPath extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: YQWaveCLipper(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}

class YQWaveCLipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-20);

    var firstControlPoint = Offset(size.width/4, size.height);
    var firstEndPoint = Offset(size.width/2.25, size.height-30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height-40);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}
