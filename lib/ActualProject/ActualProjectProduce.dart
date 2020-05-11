/*
* 实际真实的项目中用的开发点
* Dio 网络请求框架，支持Restful API，FormData、拦截器、请求取消等操作。
* Swiper：Swiper滑动插件的使用，使用Swiper插件图片的效果
* 路由Fluro：Flutter的路由机制很繁琐，如果是小型应用还勉强，
* 但是真实开发我们都会使用企业级的路由机制，让路由清晰可用。
* 使用Fluro进行路由配置.Fluro也是目前最好的企业级Flutter路由。
* 屏幕适配
* 上下拉刷新
* 本地文件存储
* 复杂页面的布局
*
*
* 组件化开发：
* Flutter环境配置，项目代码结构的优化，dart文件的组件、路由的学习配置、项目代码的初始化。
*
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/*上下拉刷新 带轮播图*/
class SwiperRefreshPage extends StatefulWidget {
  @override
  SwiperRefreshPageState createState() {
    return SwiperRefreshPageState();
  }
}

class SwiperRefreshPageState extends State<SwiperRefreshPage> {
  List<int> list = [1, 11, 1, 1, 1, 1, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.builder(
        builder: (context, physics, header, footer) {
          return CustomScrollView(
            physics: physics,
            slivers: <Widget>[
              header,
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
//                    width: 300,
                    height: 210.0,
                    child: ScrollNotificationInterceptor(
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return SampleListItem(direction: Axis.horizontal);
                        },
                        itemCount: 5,
                        viewportFraction: 1,
                        scale: 1,
                        autoplay: true,
                      ),
                    ),
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return SampleListItem(
                    title: list[index].toString(),
                  );
                }, childCount: list.length),
              ),
              footer,
            ],
          );
        },
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
//              _count = 20;
              list = [1, 11, 1, 1, 1, 1, 1];
            });
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              for (int i = 0; i < 10; i++) {
                list.add(i);
              }
            });
          });
        },
      ),
    );
  }
}

/// 简单列表项
class SampleListItem extends StatelessWidget {
  /// 方向
  final Axis direction;

  /// 宽度
  final double width;

  final String title;

  const SampleListItem(
      {Key key,
      this.direction = Axis.vertical,
      this.width = double.infinity,
      this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return direction == Axis.vertical
        ? Card(
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        color: Colors.grey[200],
                        child: Text(title),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.all(
                          10.0,
                        ),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 120.0,
                                      height: 15.0,
                                      color: Colors.grey[200],
                                    ),
                                    Container(
                                      width: 60.0,
                                      height: 10.0,
                                      margin: EdgeInsets.only(top: 8.0),
                                      color: Colors.grey[200],
                                    ),
                                  ],
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.grey[200],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 10.0,
                                  color: Colors.grey[200],
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Container(
                                  height: 10.0,
                                  color: Colors.grey[200],
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Container(
                                  height: 10.0,
                                  width: 150.0,
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )
        : Card(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: width,
                    color: Colors.grey[200],
                  ),
                  Container(
                    width: width,
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 80.0,
                                  height: 15.0,
                                  color: Colors.grey[200],
                                ),
                                Container(
                                  width: 60.0,
                                  height: 10.0,
                                  margin: EdgeInsets.only(top: 8.0),
                                  color: Colors.grey[200],
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey[200],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 10.0,
                              color: Colors.grey[200],
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Container(
                              height: 10.0,
                              color: Colors.grey[200],
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Container(
                              height: 10.0,
                              width: 100.0,
                              color: Colors.grey[200],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
