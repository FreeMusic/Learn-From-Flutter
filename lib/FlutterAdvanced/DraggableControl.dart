import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
Draggable拖拽控件实例：


Draggable 控件负责拖拽功能，父类层使用了Draggable，它的子元素就是可以拖动的，
子元素可以是容器，也可以是图片。用起来非常的灵活
参数说明：
1.data：是需要传递的参数，在DragTarget里，会接受到这个参数。当然要在拖拽控件拖拽到DragTarget
的时候。
2.child：在这里放置你要拖拽的元素，可以是元素可以使容器，也可以是图片和文字。
3.feedback：常用于设置拖拽元素时候的样子，在案例中当拖拽的时候，我们可以把它的颜色透明度变成了50%，
当然你可以改变它的大小，
4.onDraggableCancled：是当松开时的响应事件，经常用来改变拖拽时到达的位置，改变时用setState来进行

DragTarget是用来接受拖拽事件的控件，当把Draggable放到DragTarget里时，
他会接收Draggable传递过来的值，然后用生成器改变组件状态。
1.onAccept：当拖拽到控件里时触发，经常在这里得到传过来的的值。
2.builder：构造器，里面进行修改child的值。

*/

class YQDraggable extends StatefulWidget {
  @override
  YQDraggableState createState() => YQDraggableState();
}

class YQDraggableState extends State<YQDraggable> {
  Color draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          YQDraggableWidget(
            offset: Offset(180.0, 180.0),
            widgetColor: Colors.tealAccent,
          ),
          YQDraggableWidget(
            offset: Offset(180.0, 180.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(
              onAccept: (Color color) {
                draggableColor = color;
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: draggableColor,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class YQDraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;
  const YQDraggableWidget({Key key, this.offset, this.widgetColor})
      : super(key: key);
  YQDraggableWidgetState createState() => YQDraggableWidgetState();
}

class YQDraggableWidgetState extends State<YQDraggableWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
        child: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor,
        ),
        feedback: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}
