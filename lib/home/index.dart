import 'package:flutter/material.dart';
import 'news.dart';
import 'video.dart';
import 'user.dart';

import 'navigation_icon_view.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _IndexState();
  }
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 0; //当前页面的索引值
  List<NavigationBottomBar> _bottomBars; //用来存放底部BottomBar
  List<StatefulWidget> _pageList; //用来存放首页的几个页面
  StatefulWidget _currentPage; //当前页面

  //定义一个空的设置状态值的方法
  void _rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    //初始化导航栏按钮
    _bottomBars = <NavigationBottomBar>[
      new NavigationBottomBar(
          icon: new Image.asset('resource/images/ic_bottombar_news_selected.png'),
          title: new Text("新闻"),
          provider: this),
      new NavigationBottomBar(
          icon: new Image.asset('resource/images/ic_bottombar_video_unselect.png'),
          title: new Text("视频"),
          provider: this),
      new NavigationBottomBar(
          icon: new Image.asset('resource/image/ic_bottombar_user_unselect.png'),
          title: new Text("我的"),
          provider: this)
    ];

    //给每个按钮添加点击事件
    for (NavigationBottomBar view in _bottomBars) {
      view.controller.addListener(_rebuild);
    }

// 将我们 bottomBar 上面的按钮图标对应的页面存放起来，方便我们在点击的时候
    _pageList = <StatefulWidget>[
      new NewsPage(),
      new VideoPage(),
      new UserPage()
    ];

    _currentPage = _pageList[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _bottomBars
          .map((NavigationBottomBar navigationIconView) =>
      navigationIconView.barItem)
          .toList(), //添加icon按钮
      currentIndex: _currentIndex, //当前点击的索引值

      type: BottomNavigationBarType.fixed, // 设置底部导航工具栏的类型：fixed 固定

      onTap: (int index) {
        // 添加点击事件
        setState(() {
          // 点击之后，需要触发的逻辑事件
          _bottomBars[_currentIndex].controller.reverse();
          _currentIndex = index;
          _bottomBars[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      },
    );

    return new MaterialApp(
      home: new Scaffold(

        body: new Center(
          child: _currentPage,
        ),
        bottomNavigationBar: bottomNavigationBar,


      ),
      theme: new ThemeData(primarySwatch: Colors.cyan),
    );
  }
}
