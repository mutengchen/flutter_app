import 'package:flutter/material.dart';
import 'package:flutter_app/main/book_video.dart';
import 'package:flutter_app/main/group_page.dart';
import 'package:flutter_app/main/person_center.dart';
import 'package:flutter_app/main/shop_page.dart';
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

@override
Widget build(BuildContext context) {
  return  MaterialApp(
    
    home: Scaffold(
      appBar: AppBar(title: Text("Demo"),),
      body: new Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
          _getPagesWidget(4),
        ],
      ),

      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          setState(() {
            _selectIndex = index;
            //这个是用来控制比较特别的shopPage中WebView不能动态隐藏的问题
            // shopPageWidget.setShowState(pages.indexOf(shopPageWidget) == _selectIndex);
          });
        },
        //图标大小
        iconSize: 24,
        //当前选中的索引
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        type: BottomNavigationBarType.fixed,
      ),
    ),
  );
  
}
  List<BottomNavigationBarItem> itemList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(pages==null){
      // pages
      //这里添加吧五个模块的添加进去
        if(pages==null){
        pages =[
          BookVideoWidget(),
          GroupPageWidget(),
          PersonCenterWidget(),
          ShopPageWidget(),
          BookVideoWidget()
        ];
    }
    }
    //设定底部导航栏的选中或者未选中
    if(itemList==null){
      itemList = itemNames.map((items) =>BottomNavigationBarItem(
        icon: Image.asset(
          items.normalIcon,
          width: 30.0,
          height: 30.0
        ),
        title: Text(
          items.name,
          style: TextStyle(fontSize: 10.0),
        ),
        activeIcon: Image.asset(items.activeIcon,width:30.0,height:30.0))
        ).toList();
    }
  }

 int _selectIndex = 0;
  Widget _getPagesWidget(int index){
       return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

}
class _Item{
  String name, activeIcon,normalIcon;
  _Item(this.name,this.activeIcon,this.normalIcon);
}