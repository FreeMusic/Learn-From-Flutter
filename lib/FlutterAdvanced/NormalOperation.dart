import 'package:flutter/material.dart';

/*
保持页面状态
with关键字的使用：混入的意思，可以将一个或者多个类的
功能添加到自己的类无虚继承，避免多重继承导致的问题
 */

class KeepPageAlive extends StatefulWidget {
  KeepPageAliveState createState() => KeepPageAliveState();
}

/*
TabBar 是切换组件，他要设置两个属性
controller:控制器，后面跟的多是TabController组件
tabs:具体切换项，是一个数组，里面主要放的是Tab Widget
* */
class KeepPageAliveState extends State<KeepPageAlive>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  //重写被释放的方法，只释放TabController
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('保持页面的活跃性'),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Text('第一个'),
          Text('第二个'),
          Text('第三个'),
        ],
      ),
    );
  }
}

/*保持状态页面2的效果 一个按钮点击加一*/
class KeepButtonAlive extends StatefulWidget {
  @override
  KeepButtonAliveState createState() => KeepButtonAliveState();
}

class KeepButtonAliveState extends State<KeepButtonAlive>
    with AutomaticKeepAliveClientMixin {
  int counter = 0;
  //重写keepAlive为true，就是可以有记忆功能了
  @override
  bool get wantKeepAlive => true;
  //声明一个内部方法，用来点击按钮后增加数量
  void inCrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点一下加一，点一下加一：'),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),

      //增加一个悬浮按钮，点击时触发inCrementCounter方法
      floatingActionButton: FloatingActionButton(
        onPressed: inCrementCounter,
        tooltip: 'InCrement',
        child: Icon(Icons.add),
      ),
    );
  }
}

/*
流式布局，模拟添加照片的效果：
使用meidaQuery媒体查询：可以得到屏幕的宽和高

final kScreenWidth = MediaQuery.of(context).size.width;
final kScreenHeight = MediaQuery.of(context).size.height;

Wrap流式布局：Flutter中流式布局大概有三种常用的方法，Flow，Wrap。Wrap更多的形式上
跟Row和Column更像（横、竖、横竖兼备）。
从效率上讲，Flow比Wrap高，但是Wrap灵活

GestureDetector手势操作
*/

class YQWrap extends StatefulWidget {
  YQWrapState createState()=> YQWrapState();
}

class YQWrapState extends State<YQWrap> {

  List<Widget> list;//声明一个list数组

  @override
  //初始化一个状态，给list添加值，这时候调用了一个自定义方法'buildAddButton'
  void initState(){
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    //屏幕的宽高
    final kScreenWidth = MediaQuery.of(context).size.width;
    final kScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Opacity(
        opacity: 0.8,
        child: Container(
          width: kScreenWidth,
          height: kScreenHeight/2,
          color: Colors.grey,
          child: Wrap(//流式布局
            children: list,
            spacing: 26,//设置间距
          ),
        ),
      ),
    );
  }

  Widget buildAddButton(){
    //返回一个手势Widget，只用于显示事件
    return GestureDetector(
      onTap: (){
        if(list.length<9){
          setState(() {
            list.insert(list.length-1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 80,
          height: 80,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto(){

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 80,
        height: 80,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );

  }

}

/*
闭合展开案例
手机屏幕本身就小，合理利用空间，把主要元素展现出来，
ExpansionTile组件的使用

ExpansionTile Widget就是一个可以展开闭合的组件，常用的属性：
1.title 闭合时显示的标题，这个部分经常用Text Widget。
2.leading 标题左侧图标，多是用来修饰
3.backgroundcolor 展开时的背景颜色，有过度动画
4.children 子元素 是一个数组 可以放入多个元素
5.trailing 右侧的箭头，你可以自行替换
6.initiallyExpanded 初始状态是否展开，true展开 false不展开
*/
class YQExpansionTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ExpansionTile(
          title:Text('闭合展开案例'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          children: <Widget>[
            ListTile(
              title: Text('list tile'),
              subtitle: Text('subtitle'),
            )],
        initiallyExpanded: true,
        ),
      ),
    );
  }
}

/*
展开闭合列表案例
ExpansionPanelList 常用属性：
expansionCallback:点击和交互的回调事件，两个参数，一个是出发动作的索引，
另一个是布尔类型的触发值
*/
//自定义扩展状态类
class YQExpandStateBoolean {
  var isOpen;
  var index;
  YQExpandStateBoolean(this.index, this.isOpen);
}

class YQExpansionPanelist extends StatefulWidget{
  YQExpansionPanelistState createState()=>YQExpansionPanelistState();
}

class YQExpansionPanelistState extends State<YQExpansionPanelist>{

  var currentPanelIndex = -1;
  List<int> mList;//组成一个int类型的数组，用来控制索引
  List<YQExpandStateBoolean> expandStateList;//点开展开的状态列表
  //构造方法 调用这个类的时候自动执行
  YQExpansionPanelistState(){
    mList = new List();
    expandStateList = new List();
    //遍历为两个list赋值
    for(int i = 0; i < 10; i++) {
        mList.add(i);
        expandStateList.add(YQExpandStateBoolean(i, false));
    }
  }

  //修改展开与闭合的内部方法
  _setCurrentIndex(int index, isExpand){
    setState(() {
      //遍历可展开状态列表
      expandStateList.forEach((item){

        item.isOpen = (item.index == index) ? !isExpand : item.isOpen;

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //加入可滚动组件
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          //交互回调属性，里面是匿名函数
          expansionCallback: (index, bool){
            //调用内部方法
            _setCurrentIndex(index, bool);
          },
          children: mList.map((index){
            return ExpansionPanel(
              headerBuilder: (context, isExpanded){
                return ListTile(
                  title: Text('This is No.$index'),
                );
              },
              body: ListTile(
                title: Text('expansion no.$index'),
              ),

              isExpanded: expandStateList[index].isOpen
            );
          }).toList(),

        ),
      ),
    );
  }
}

