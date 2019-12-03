import 'package:flutter/material.dart';
class MainPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }

}
class _MainPageState extends State<MainPageWidget>{
  
  List<Widget> pages; //页面列表
  final defaultItemColors = Color.fromARGB(255, 125, 125, 125);//定义tab标签的颜色
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
  ]; //底部导航栏

  List<BottomNavigationBarItem> itemList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(pages==null){
      // pages
      //这里添加吧五个模块的添加进去
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ;
  }

  Widget _getPagesWidget(int index){
      return new Scaffold(

      )
  }

}
class _Item{
  String name, activeIcon,normalIcon;
  _Item(this.name,this.activeIcon,this.normalIcon);
}