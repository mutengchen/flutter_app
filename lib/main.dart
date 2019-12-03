import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/main/homepage.dart';
import 'package:flutter_app/splash/splash.dart';

import 'listView.dart';
void main(){
runApp(MyApp());
if(Platform.isAndroid){
  var style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(style);
}
} 
class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}
class MyApp extends StatefulWidget{
  List<String> _abs = ['A', 'B', 'S'];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
  
 
}
 class _MyAppState extends State<MyApp>{
    int _selectIndex = 0;
   final itemNames = [
    _Item('首页', 'assets/images/ic_tab_home_active.png',
        'assets/images/ic_tab_home_normal.png'),
    _Item('书影音', 'assets/images/ic_tab_subject_active.png',
        'assets/images/ic_tab_subject_normal.png'),
    _Item('小组', 'assets/images/ic_tab_group_active.png',
        'assets/images/ic_tab_group_normal.png'),
    _Item('市集', 'assets/images/ic_tab_shiji_active.png',
        'assets/images/ic_tab_shiji_normal.png'),
    _Item('我的', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];
 void initBottomNavBar(){
    //初始化底部栏的
       if(itemList == null){
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
          icon: Image.asset(
            item.normalIcon,
            width: 30.0,
            height: 30.0,
          ),
          title: Text(
            item.name,
            style: TextStyle(fontSize: 10.0),
          ),
          activeIcon:
          Image.asset(item.activeIcon, width: 30.0, height: 30.0)))
          .toList();
    }
  }
  List<BottomNavigationBarItem> itemList;
  @override
  Widget build(BuildContext context) {
    initBottomNavBar();
    // TODO: implement build
    return MaterialApp(

      home:Scaffold(
        // body: HomePage()
        // appBar: AppBar(
        //   title: new Text('TEST DEMO'),
        // ),
        body: HomePage(),
        bottomNavigationBar: BottomNavigationBar(
          items: itemList,
          onTap: (int index){
            setState((){
              _selectIndex = index;
            });
          },
          iconSize: 24,
        //当前选中的索引
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Color.fromARGB(255, 255, 255, 255),
        type: BottomNavigationBarType.fixed,
        ),
      )
    );;
  }
    
  }

 
