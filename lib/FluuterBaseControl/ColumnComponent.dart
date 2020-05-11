import 'package:flutter/material.dart';

/*
垂直布局

主轴和副轴的辨识：
mainAxisAlignment属性：主轴的对称方式。
~mian轴：如果你用Column组件，那垂直就是主轴，如果你用Row组，那水平就是主轴。
~cross轴：cross轴我们称为幅轴，是和主轴垂直的方向。Row组件垂直就是幅轴，Column组件水平就是幅轴

*/
class ColumnLayout extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      //CrossAxisAlignment.star：居左对齐。
      //CrossAxisAlignment.end：居右对齐。
      //CrossAxisAlignment.center：居中对齐。
      crossAxisAlignment: CrossAxisAlignment.center,//副轴（水平方向）左对齐
      mainAxisAlignment: MainAxisAlignment.start,//主轴(垂直方向)居中对齐
      mainAxisSize: MainAxisSize.max,
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
/*
Stack层叠布局：适用于放入一个图片，图片上再写一写文字或者放入容器。

层叠布局的alignment属性是控制层叠位置的，建议两个内容进行层叠时使用。
它有两个值X轴距离和Y轴距离，值是从0到1的，都是从上层容器的左上角开始算起的。

CircleAvatar组件的使用：CircleAvatar这个经常用来作头像的，组件里面有个radius的值
可以设置图片的弧度。

Stack的Positioned属性（层叠定位组件）
Positioned组件的属性：
bottom：距离层叠组件下边的距离
left：距离层叠组件左边的距离
top：距离层叠组件上边的距离
right：距离层叠组件右边的距离
width：层叠定位组件的宽度
height：层叠定位组件的高度
*/
class MyStack extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: const FractionalOffset(0.5, 0.8),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589092390390&di=4546445aafe1ac79511e4f8d28f2439a&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F94o3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2Fa8ec8a13632762d00f79bcc4a7ec08fa513dc602.jpg'),
          radius: 100,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.lightBlue,
          ),
          padding: EdgeInsets.all(5),
          child: new Text('故乡'),
        )
      ],
    );
  }
}

class MoreStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Stack(
//        alignment: AlignmentDirectional.center,
        children: <Widget>[

          new CircleAvatar(
            backgroundImage: new NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589092390390&di=4546445aafe1ac79511e4f8d28f2439a&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F94o3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2Fa8ec8a13632762d00f79bcc4a7ec08fa513dc602.jpg'),
            radius: 100,
          ),
          new Positioned(
            child: new Text('我是少司命', style: TextStyle(color: Colors.red),),
            top: 10,
            right: 50,
          ),
          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('我是少司命', style: TextStyle(color: Colors.red),),
            ],
          ),
          new Positioned(
            child: RaisedButton(onPressed: (){},
              child: Text('秦时明月'),
              color: Colors.green,
            ),

            bottom: 20,
            right: 50,
          ),
        ],
      ),
    );
  }
}
/*
卡片式布局：类似ViewList
*/
class NewCardLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('浙江温州江南皮革厂', style: TextStyle(fontWeight: FontWeight.w500),),
            subtitle: new Text('非洲黑汉：13245678900'),
            leading: new Icon(Icons.account_box, color: Colors.lightBlue,),
          ),
          new Divider(),
          ListTile(
            title: Text('俄罗斯大本营', style: TextStyle(fontWeight: FontWeight.w500),),
            subtitle: new Text('东欧巨炮：13838384382'),
            leading: new Icon(Icons.account_box, color: Colors.lightBlue,),
          ),
          new Divider(),//线
          ListTile(
            title: Text('美国白宫', style: TextStyle(fontWeight: FontWeight.w500),),
            subtitle: new Text('特朗普：15245687987'),
            leading: new Icon(Icons.account_box, color: Colors.lightBlue,),
          ),
          new Divider(),
        ],
      ),
    );
  }
}