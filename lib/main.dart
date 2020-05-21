import 'package:flutter/material.dart';
import 'package:flutter_app/ActualProject/DialogSizeToFit.dart';
import 'package:flutter_app/FlutterAdvanced/BesselCurve.dart';
import 'package:flutter_app/FlutterAdvanced/DraggableControl.dart';
import 'package:flutter_app/FlutterAdvanced/ImageProcess.dart';
import 'package:flutter_app/FlutterAdvanced/NormalOperation.dart';
import 'package:flutter_app/FlutterAdvanced/RouteAnimation.dart';
import 'package:flutter_app/FlutterAdvanced/SearchOpration.dart';
import 'package:flutter_app/FlutterAdvanced/ToolTipControl.dart';
import 'package:flutter_app/FluuterBaseControl/ColumnComponent.dart';
import 'package:flutter_app/FluuterBaseControl/FlutterDirectory.dart';
import 'package:flutter_app/FluuterBaseControl/FlutterNavigation.dart';
import 'package:flutter_app/FluuterBaseControl/MyDartExtention.dart';
import 'package:flutter_app/FluuterBaseControl/NavigatorDataReturn.dart';

import 'ActualProject/ActualProjectProduce.dart';

/*目录数组*/
var titlelist = [
  Knowledge('Text Widget 文本组件的使用', TextWidget()),
  Knowledge('Container容器组件的基本使用', ContainerBase()),
  Knowledge('Container容器组件的进一步使用', ContainerFurther()),
  Knowledge('图片组件(网图)', ImageView()),
  Knowledge('横向列表', MyHorizontalList()),
  Knowledge('纵向列表', MyVerticalList()),
  Knowledge('图片网格列表', NewGridleView()),
  Knowledge('水平布局Row(非灵活布局)', UnFlexibleRow()),
  Knowledge('水平布局Row(灵活布局)', FlexibleRow()),
  Knowledge('水平布局Row(灵活和非灵活的水平布局混用)', MixFlexibleRow()),
  Knowledge('垂直布局', ColumnLayout()),
  Knowledge('Stack层叠布局', MyStack()),
  Knowledge('Stack层叠布局进阶', MoreStack()),
  Knowledge('卡片式布局', NewCardLayout()),
  Knowledge('导航控制器', NavigationBody()),
  Knowledge(
      '页面传值',
      Productlist(
        products: List.generate(
          20,
          (i) => Product('商品 $i', '这是一个商品详情，编号为：$i'),
        ),
      )),
  Knowledge('页面间传值回调', FirstPage()),
  Knowledge('本地图片加载', ImageLoadView()),
  Knowledge('路由动画', StartPage()),
  Knowledge('毛玻璃效果', FrostedGlass()),
  Knowledge('保持页面状态', KeepPageAlive()),
  Knowledge('保持页面状态', KeepButtonAlive()),
  Knowledge('搜索功能', YQSearchBar()),
  Knowledge('流布局', YQWrap()),
  Knowledge('展开闭合案例', YQExpansionTile()),
  Knowledge('展开闭合列表案例', YQExpansionPanelist()),
  Knowledge('贝塞尔曲线切割', YQClipPath()),
  Knowledge('波浪形式的贝塞尔曲线', YQWaveClipPath()),
//  Knowledge('侧滑返回案例', YQLateralSpreads()),
  Knowledge('ToolTip控件', YQToolTip()),
  Knowledge('Draggable控件实例', YQDraggable()),
  Knowledge('带轮播图的上下拉刷新', SwiperRefreshPage()),
  Knowledge('flutter_tableview 列表标题栏悬停效果', TableViewPage()),
  Knowledge('Flutter主动调用iOS的原生方法', FlutterActiveiOS()),
];

//主函数的入口
void main() => runApp(MyApp());

//声明MyApp类
class MyApp extends StatelessWidget {
  // This widget is the root of your application. 重写build方法
  @override
  Widget build(BuildContext context) {

    //返回一个Material风格的组件
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false, //曲调DEBUG图标
      home: FlutterDirectory(
        Knowledges: titlelist,
      ),

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
