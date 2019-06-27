import 'package:flutter/material.dart';

//底部导航栏
class NavigationBottomBar {
  // 创建两个属性，一个是 用来展示 icon， 一个是动画处理
  final BottomNavigationBarItem barItem;
  final AnimationController controller;


  // 创建 NavigationIconView 需要传入三个参数， icon 图标，title 标题， TickerProvider
  NavigationBottomBar({Widget icon, Widget title, TickerProvider provider})
      :
        barItem=new BottomNavigationBarItem(
            icon: icon,
            title: title
        ),
        controller=new AnimationController(
            vsync: provider, //默认属性
            duration: kThemeAnimationDuration) ;//设置动画持续时间


}