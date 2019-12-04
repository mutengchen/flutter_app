import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/bean/subject_bean.dart';
import 'package:flutter_app/common/const.dart';
import 'package:flutter_app/home/home_app_bar.dart' as myapp;
import 'package:flutter_app/main/book_video.dart';
import 'package:flutter_app/main/group_page.dart';
import 'package:flutter_app/main/person_center.dart';
import 'package:flutter_app/main/shop_page.dart';
import 'package:flutter_app/widgets/image/radius_img.dart';
import 'package:flutter_app/widgets/search_text_field_widget.dart';

import '../router.dart';
//首页，tab页面，显示动态和推荐tab
 var _tabs = ['动态','推荐','AR',"VR"];
class HomePage extends StatefulWidget{
 
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getWidget();
  }

  DefaultTabController _getWidget(){
    return new DefaultTabController(
      
      initialIndex: 0,
      length: _tabs.length,
      //nestedScollView跟SliverAppBar的配合交互，实现滑动影藏appBar的效果,nestScrollView需要headSliverBuild和body
      child: NestedScrollView(
        //外部滚动时显示的布局
        headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
          return <Widget>[
            SliverOverlapAbsorber(
              
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: myapp.SliverAppBar(
                //appbar上滑的时候是否显示
                // pinned: true,
                // floating: true,
                // snap: true,
                
                pinned: true,
                //扩展高度R
                expandedHeight: 120.0,
                primary: true,
                titleSpacing: 0.0,
                backgroundColor: Colors.white,
                //设置appbar背景
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      color: Colors.green,
                      child: SearchTextFieldWidget(
                        hintText: "为国接盘",
                        margin: const EdgeInsets.only(right:15.0,left:15.0),
                        onTab: (){
                          //TODO 跳转到搜索页
                        },
                      ),
                      alignment: Alignment(0.0, 0.0),
                    ),
                ),
                bottomTextString: _tabs,
                bottom: TabBar(
                  tabs: _tabs.map((String name)=>Container(
                    child: Text(name),padding: const EdgeInsets.only(bottom: 5.0),
                  )).toList()
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          children: _tabs.map((String name) {
          return SliverContainer(
            name: name,
          );
        }).toList(),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

  
}
class _HomePageState extends State<HomePage>{
  List<Widget> pages;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }

} 

class SliverContainer extends StatefulWidget {
  final String name;

  SliverContainer({Key key, @required this.name}) : super(key: key);

  @override
  _SliverContainerState createState() => _SliverContainerState();
}

class _SliverContainerState extends State<SliverContainer> {
  @override
  void initState() {
    super.initState();
    print('init state${widget.name}');

    ///请求动态数据
    if (list == null || list.isEmpty) {
      if (_tabs[0] == widget.name) {
        requestAPI();
      } else {
        ///请求推荐数据
        requestAPI();
      }
    }
  }

  List<Subject> list;

  void requestAPI() async {
//    var _request = HttpRequest(API.BASE_URL);
//    int start = math.Random().nextInt(220);
//    final Map result = await _request.get(API.TOP_250 + '?start=$start&count=30');
//    var resultList = result['subjects'];

    // var _request = MockRequest();
    // var result = await _request.get(API.TOP_250);
    // var resultList = result['subjects'];
    // list = resultList.map<Subject>((item) => Subject.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return getContentSliver(context, list);
  }

  getContentSliver(BuildContext context, List<Subject> list) {
    if (widget.name == _tabs[0]) {
      return _loginContainer(context);
    }

    print('getContentSliver');
    if (list == null || list.length == 0) {
      return Text('暂无数据');
    }
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        // This Builder is needed to provide a BuildContext that is "inside"
        // the NestedScrollView, so that sliverOverlapAbsorberHandleFor() can
        // find the NestedScrollView.
        builder: (BuildContext context) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            // The "controller" and "primary" members should be left
            // unset, so that the NestedScrollView can control this
            // inner scroll view.
            // If the "controller" property is set, then this scroll
            // view will not be associated with the NestedScrollView.
            // The PageStorageKey should be unique to this ScrollView;
            // it allows the list to remember its scroll position when
            // the tab view is not on the screen.
            key: PageStorageKey<String>(widget.name),
            slivers: <Widget>[
              SliverOverlapInjector(
                // This is the flip side of the SliverOverlapAbsorber above.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      ((BuildContext context, int index) {
                return getCommonItem(list, index);
              }), childCount: list.length)),
            ],
          );
        },
      ),
    );
  }

  double singleLineImgHeight = 180.0;
  double contentVideoHeight = 350.0;

  ///列表的普通单个item
  getCommonItem(List<Subject> items, int index) {
    Subject item = items[index];
    bool showVideo = index == 1 || index == 3;
    return Container(
      height: showVideo ? contentVideoHeight : singleLineImgHeight,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.only(
          left: Constant.MARGIN_LEFT,
          right: Constant.MARGIN_RIGHT,
          top: Constant.MARGIN_RIGHT,
          bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(item.casts[0].avatars.medium),
                backgroundColor: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(item.title),
              ),
              Expanded(
                child: Align(
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                    size: 18.0,
                  ),
                  alignment: Alignment.centerRight,
                ),
              )
            ],
          ),
          Expanded(
              child: Container(
            child: showVideo ? getContentVideo(index) : getItemCenterImg(item),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  Constant.ASSETS_IMG + 'ic_vote.png',
                  width: 25.0,
                  height: 25.0,
                ),
                Image.asset(
                  Constant.ASSETS_IMG +
                      'ic_notification_tv_calendar_comments.png',
                  width: 20.0,
                  height: 20.0,
                ),
                Image.asset(
                  Constant.ASSETS_IMG + 'ic_status_detail_reshare_icon.png',
                  width: 25.0,
                  height: 25.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getItemCenterImg(Subject item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: RadiusImg.get(item.images.large, null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0)),
              )),
        ),
        Expanded(
          child: RadiusImg.get(item.casts[1].avatars.medium, null, radius: 0.0),
        ),
        Expanded(
          child: RadiusImg.get(item.casts[2].avatars.medium, null,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0)))),
        )
      ],
    );
  }

  getContentVideo(int index) {
    if(!mounted){
      return Container();
    }
    // return VideoWidget(
    //   index == 1 ? Constant.URL_MP4_DEMO_0 :  Constant.URL_MP4_DEMO_1,
    //   showProgressBar: false,
    // );
  }
}
///动态TAB
_loginContainer(BuildContext context) {
  return Align(
    alignment: Alignment(0.0, 0.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          Constant.ASSETS_IMG + 'ic_new_empty_view_default.png',
          width: 120.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
          child: Text(
            '登录后查看关注人动态',
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
        ),
        GestureDetector(
          child: Container(
            child: Text(
              '去登录',
              style: TextStyle(fontSize: 16.0, color: Colors.green),
            ),
            padding: const EdgeInsets.only(
                left: 35.0, right: 35.0, top: 8.0, bottom: 8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: const BorderRadius.all(Radius.circular(6.0))),
          ),
          onTap: () {
            Router.push(context, Router.searchPage, '搜索笨啦灯');
          },
        )
      ],
    ),
  );
}
