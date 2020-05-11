import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Knowledge {
  final String title; //标题
  final Object body; //需要跳转的页面
  Knowledge(this.title, this.body);
}

/*
FlutterDemo的学习目录
*/
class FlutterDirectory extends StatelessWidget {
  final List<Knowledge> Knowledges;

  FlutterDirectory({Key key, @required this.Knowledges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter学习目录'),
      ),
      body: ListView.builder(
          itemCount: Knowledges.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index、' + Knowledges[index].title),
              //点击事件
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LearnContent(
                              knowledge: Knowledges[index],
                            )));
              },
            );
          }),
    );
  }
}

class LearnContent extends StatelessWidget {
  final Knowledge knowledge;

  LearnContent({Key key, @required this.knowledge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = myAppBar().preferredSize.height;
    print("AppBar的高度" + height.toString());
    // TODO: implement build
    return new Scaffold(
      appBar: myAppBar(),
      body: knowledge.body,
    );
  }

  AppBar myAppBar() {
    return AppBar(title: Text('${knowledge.title}'));
  }
}

/*
Text Widget 文本组件的使用:

TextAlign属性就是文本的对齐方式，它的属性值有如下几个:
center: 文本以居中形式对齐,这个也算比较常用的了。
left:左对齐，让文本居左进行对齐，效果和start一样。
right :右对齐。
start:以开始位置进行对齐，类似于左对齐。
end: 以为本结尾处进行对齐。有点类似右对齐.

maxLines属性:设置显示文本的最大行数
overflow属性：是用来设置文本溢出时的处理方式，主要分为：
1.clip：直接切断，剩下的文字就没有了
2.ellipsis:在后边显示省略号
3.fade: 溢出的部分会进行一个渐变消失的效果，当然是上线的渐变。

*/
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: new Text(
        '你好 flutter',
        style: TextStyle(
            fontSize: 40,
//            color: Colors.lightGreen
            color: Color.fromARGB(255, 255, 150, 150),
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid),
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

/*
Container容器组件的使用1
Container相当于HTML里的<div>标签

Alignment属性：该属性是针对Container内child的对齐方式，也就是容器字内容的对齐方式，
并不是容器本身的对齐方式。具体对齐方式可查看文档
此外还可以设置颜色宽高等属性
*/
class ContainerBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: new Text(
          '你好',
          style: TextStyle(fontSize: 40),
        ),
        alignment: Alignment.topLeft,
        width: 500,
        height: 400,
        color: Colors.red,
//        padding: const EdgeInsets.all(50),
//        decoration: BoxDecoration(
//          border: Border(top: BorderSide(width: 1))
//        ),
      ),
    );
  }
}

/*Container容器组件的进一步使用*/
class ContainerFurther extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: new Text(
          '你好',
          style: TextStyle(fontSize: 40),
        ),
        alignment: Alignment.center,
        width: 500,
        height: 400,
//        color: Colors.orangeAccent,
//        padding: const EdgeInsets.fromLTRB(10, 30, 0, 30),
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(100),
        clipBehavior: Clip.antiAlias,
        transform: Matrix4.rotationZ(.1),
        constraints: BoxConstraints(minHeight: 10),
        //为Container添加的额外约束
        //设置了color属性 就不要设置decoration了，会产生冲突
        decoration: new BoxDecoration(
//          也可以设置图片
//          image: new DecorationImage(image: NetworkImage('https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1800234590,1071832890&fm=173&app=25&f=JPEG?w=598&h=904&s=4C10759B268D49ED2FFCADF3030090B3',)),
            boxShadow: [
              //阴影属性设置
              BoxShadow(
                color: Colors.black54, //阴影颜色
                offset: Offset(20, 20), //阴影相偏移量
                blurRadius: 2, //高斯模糊数值
              )
            ],
            shape: BoxShape.circle,
            gradient: const LinearGradient(
                colors: [Color(0xFFFEB48D), Color(0xFFFB64AD)]),
            border: Border.all(width: 2, color: Colors.lightGreen)),
//        foregroundDecoration: new BoxDecoration(
//            boxShadow: [//阴影属性设置
//              BoxShadow(
//                color: Colors.black54,//阴影颜色
//                offset: Offset(20, 20),//阴影相偏移量
//                blurRadius: 2,//高斯模糊数值
//              )
//            ],
//            shape: BoxShape.circle,
//            gradient: const LinearGradient(
//                colors: [Colors.lightBlue, Colors.greenAccent, Colors.purple]),
//            border: Border.all(width: 2, color: Colors.lightGreen)
//        ),
      ),
    );
  }
}

/*
图片组件的使用(网络图片)

加载图片的几种方式：
1.Image.asset:加载资源图片，就是加载项目资源目录中的图片,
加入图片后会增大打包的包体体积，用的是相对路径。
2.Image.network:网络资源图片，
意思就是你需要加入一段http://xxxx.xxx的这样的网络路径地址。
3.Image.file:加载本地图片，
就是加载本地文件中的图片，这个是一个绝对路径，跟包体无关。
4.Image.memory: 加载Uint8List资源图片。

fit属性用来控制图片的压缩和挤压:
1.BoxFit.fill:全图显示，图片会被拉伸，并充满父容器。
2.BoxFit.contain:全图显示，显示原比例。
3.BoxFit.cover：显示可能拉伸，可能裁切，充满（图片要充满整个容器，还不变形）。
4.BoxFit.fitWidth：宽度充满（横向充满），显示可能拉伸，可能裁切
5.BoxFit.fitHeight ：高度充满（竖向充满）,显示可能拉伸，可能裁切。
6.BoxFit.scaleDown：效果和contain差不多，
但是此属性不允许显示超过源图片大小，可小不可大。

图片的混合模式：colorBlendMode和color属性的结合使用，可以搭配出很多效果

repeat图片重复:
1.ImageRepeat.repeat : 横向和纵向都进行重复，直到铺满整个画布。
2.ImageRepeat.repeatX: 横向重复，纵向不重复。
3.ImageRepeat.repeatY：纵向重复，横向不重复。

*/
class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: new Image.network(
          'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1800234590,1071832890&fm=173&app=25&f=JPEG?w=598&h=904&s=4C10759B268D49ED2FFCADF3030090B3',
          scale: 1,
          width: 500,
          height: 500,
          color: Colors.lightBlue,
          colorBlendMode: BlendMode.darken,
          repeat: ImageRepeat.repeatX,
          //frameBuilder 提供了图片边距的设置；图片加载过程中的整个帧动画；
          frameBuilder: ImageFrameBuilder('name'),
          //Flutter提供的默认的加载动画；不过貌似loadingBuilder和frameBuilder，只显示loadingBuilder动画，不显示frameBuilder动画，但是frameBuilder只设置padding属性是起作用的；
          loadingBuilder: ImageLoadingBuilder(),
          //图片加载失败的处理
          errorBuilder: ImageLoadErrorHanle(),
          fit: BoxFit.fill,
          alignment: Alignment.center,
//centerSlice: Rect.fromLTRB(2, 3, 1, 2),
        ),
      ),
    );
  }

//*******图片帧动画以及内边距的处理*******//
  ImageFrameBuilder(stringName) {
    return (BuildContext context, Widget child, int frame,
        bool wasSynchronouslyLoaded) {
//      return Padding(
//        padding: const EdgeInsets.all(100),
//        child: child,
//      );
      if (wasSynchronouslyLoaded) {
        return child;
      }

      return AnimatedOpacity(
        opacity: frame == null ? 0 : 1,
        duration: const Duration(seconds: 10),
        curve: Curves.easeOut,
        child: child,
      );
    };
  }

  //*******图片加载中动画处理*******//
  ImageLoadingBuilder() {
    return (BuildContext context, Widget child,
        ImageChunkEvent loadingProgress) {
      if (loadingProgress == null) {
        return child;
      }
      return Center(
        child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
              : null,
        ),
      );
    };
  }

//*******图片加载失败处理*******//
  ImageLoadErrorHanle() {
    return (BuildContext context, Object exception, StackTrace trace) {
//            return Text('加载失败了');
      return new Image(image: new AssetImage('images/timg.jpeg'));
    };
  }
}

/*加载本地图片*/
class ImageLoadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: new Image(image: new AssetImage('images/WechatIMG2.jpeg')),
      width: 300,
      height: 300,
    );
  }
}
