import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*自定义listView*/
class MyHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            width: 180,
            color: Colors.black54,
          ),
          new Container(
            width: 180,
            color: Colors.lightGreen,
          ),
          new Container(
            width: 180,
            color: Colors.deepOrange,
          ),
          new Container(
            width: 180,
            color: Colors.deepOrangeAccent,
          ),
          new Container(
            width: 180,
            color: Colors.deepOrange,
          )
        ],
      ),
    );
  }
}

class MyVerticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(
        child: ListView(
      scrollDirection: Axis.vertical,

      //设置滚动方向
      physics: const BouncingScrollPhysics(),
      //设置滚动方式
      //滑动偏移量的监听
      controller: ScrollController(
        keepScrollOffset: true,
      ),
      shrinkWrap: true,
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.access_time),
          title: new Text('非洲黑汉'),
        ),
        new ListTile(
          leading: new Icon(Icons.account_balance),
          title: new Text('抠脚大汉'),
        ),
        new Image.network(
            'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1800234590,1071832890&fm=173&app=25&f=JPEG?w=598&h=904&s=4C10759B268D49ED2FFCADF3030090B3'),
        new Image.network(
            'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1800234590,1071832890&fm=173&app=25&f=JPEG?w=598&h=904&s=4C10759B268D49ED2FFCADF3030090B3'),
        new Image.network(
            'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1800234590,1071832890&fm=173&app=25&f=JPEG?w=598&h=904&s=4C10759B268D49ED2FFCADF3030090B3'),
        new Image.network(
            'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1800234590,1071832890&fm=173&app=25&f=JPEG?w=598&h=904&s=4C10759B268D49ED2FFCADF3030090B3'),
        new Image.network(
            'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1800234590,1071832890&fm=173&app=25&f=JPEG?w=598&h=904&s=4C10759B268D49ED2FFCADF3030090B3'),
      ],
    ));
  }
}

//list类型的使用
//var mylist = List():非固定长度的声明
//var mylist = List(2):固定长度的声明
//var mylist = List<String>():固定类型的声明方式
//var mylist = [1, 2, 3]:对List直接赋值

//水平布局Row的使用:Flutter的row控件是水平控件，它可以让row里面的子元素进行水平排列。
//row控件可以分为灵活排列和非灵活排列两种
/*非灵活性布局*/
class UnFlexibleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      //水平轴的布局方式
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //文本方向
      textDirection: TextDirection.ltr,
      children: <Widget>[
        new RaisedButton(
          onPressed: () {
            print('红色按钮的点击事件');
          },
          color: Colors.redAccent,
          child: new Text('红色按钮'),
        ),
        new RaisedButton(
          onPressed: () {
            print('黄色按钮的点击事件');
            debugPrint('黄色按钮的点击事件');
          },
          color: Colors.orangeAccent,
          child: new Text('黄色按钮'),
        ),
        new RaisedButton(
          onPressed: () {
            print('粉色按钮的点击事件');
          },
          color: Colors.pinkAccent,
          child: new Text('粉色'),
        ),
      ],
    );
  }
}

/*灵活性布局*/
class FlexibleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
          child: new RaisedButton(
            onPressed: () {
              print('水平灵活布局：红色按钮点击');
            },
            color: Colors.redAccent,
            child: new Text('红色按钮'),
          ),
        ),
        Expanded(
          child: new RaisedButton(
            onPressed: () {
              print('水平灵活布局：黄色按钮点击');
            },
            color: Colors.orangeAccent,
            child: new Text('黄色'),
          ),
        ),
        Expanded(
          child: new RaisedButton(
            onPressed: () {
              print('水平灵活布局：粉色按钮点击');
            },
            color: Colors.pinkAccent,
            child: new Text('粉'),
          ),
        ),
      ],
    );
  }
}

/*灵活和非灵活的水平布局混搭*/
class MixFlexibleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: () {},
          color: Colors.redAccent,
          child: new Text('红色按钮'),
        ),
        Expanded(
            child: new RaisedButton(
          onPressed: () {},
          color: Colors.orangeAccent,
          child: new Text('黄色按钮'),
        )),
        new RaisedButton(
          onPressed: () {},
          color: Colors.pinkAccent,
          child: new Text('粉色按钮'),
        ),
      ],
    );
  }
}

/*图片网格列表*/
class NewGridleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.7),
      children: ChildrenGridViewList(),
    ));
  }

  ChildrenGridViewList() {
    final List<Widget> imagelist = [];
    for (int i = 0; i < 20; i++) {
      imagelist.add(new Image.network(
        'http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg',
        fit: BoxFit.cover,
      ));
    }

    return imagelist;
  }
}
