import 'package:flutter/material.dart';
import 'package:flutter_app/UtilClass/MethodNameClass.dart';
import 'package:flutter_tableview/flutter_tableview.dart';

/*
* flutter_tableview 列表标题栏悬停效果
* */
class TableViewPage extends StatefulWidget {
  TableViewPageState createState() => TableViewPageState();
}

class TableViewPageState extends State<TableViewPage> {
  int sectionCount = 3;

  int _rowCountAtSection(int section) {
    if (section == 0) {
      return 5;
    } else if (section == 1) {
      return 10;
    } else {
      return 20;
    }
  }

  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    return InkWell(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0),
        color: Color.fromRGBO(220, 220, 220, 1),
        height: 100,
        child: Text('I am section header -> section:$section'),
      ),
    );
  }

  // cell item widget builder.
  Widget _cellBuilder(BuildContext context, int section, int row) {
    return InkWell(
      onTap: () {
        print('click cell item. -> section:$section row:$row');
      },
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Color.fromRGBO(240, 240, 240, 1),
        ))),
//        height: 50.0,
        child: Text('I am cell -> section:$section  row$row'),
      ),
    );
  }

  // Each section header height;
  double _sectionHeaderHeight(BuildContext context, int section) {
    return 50.0;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    return 50.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //FlutterTableView
      child: FlutterTableView(
        sectionCount: sectionCount,
        rowCountAtSection: _rowCountAtSection,
        sectionHeaderBuilder: _sectionHeaderBuilder,
        cellBuilder: _cellBuilder,
        sectionHeaderHeight: _sectionHeaderHeight,
        cellHeight: _cellHeight,
      ),
    );
  }
}

/*Flutter主动调用iOS的原生方法*/
class FlutterActiveiOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        /*按钮的垂直布局*/
        child: ButtonColumn(),
      ),
    );
  }

  /*按钮的垂直布局*/
  ButtonColumn() {
    return Column(
      children: <Widget>[
        new RaisedButton(
          onPressed: () {
            CalliOSMethodClass.getInstans().callMethodWithName(MethondName.calliOSAlert);
          },
          child: Text('调用iOS提示框'),
        ),
        new RaisedButton(
            onPressed: (){
              CalliOSMethodClass.getInstans().callMethodWithName(MethondName.pushNewViewController);
            },
          child: Text('跳转iOS原生页面'),
        ),
      ],
    );
  }

}