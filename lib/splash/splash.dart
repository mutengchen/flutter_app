import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Api.dart';
import 'package:flutter_app/apiRq.dart';
import 'package:flutter_app/common/const.dart';
import 'package:flutter_app/util/screen_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MsplashWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashState();
  }
  
}

class _SplashState extends State<MsplashWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: new Container(
            decoration: BoxDecoration(
              color: Colors.cyan,
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: CircleAvatar(
              radius: ScreenUtils.screenW(context) / 3,
              backgroundImage: AssetImage('assets/images/home.png'),
            ))
        )
    
      ],
    );

    // TODO: implement build
    // return AmapView(
    //   onMapCreated: (controller) async{
    //     await controller.getLocation();
    //     await controller.showMyLocation(true);
    //     await controller.setCenterCoordinate(22.3, 113.5);
    //     await controller.showLocateControl(true);
    //     await controller.setMapClickListener((onMapClick){
    //           print("mapClick_lati"+onMapClick.latitude.toString());
    //           print("mapClick_longti"+onMapClick.longitude.toString());
    //     });
    //     // await controller.setMapClickListener(true);
    //   },
    // );
    //调用接口
  

  }

  Future getTestApi() async {
    String url = Api.music;
    print("我将要去请求了"+url);
    var jsonstr = await httpUtil.get(url);
    print("请求的结果："+jsonstr);
     
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTestApi();
  }
}

class CountTimerWidget extends StatefulWidget {
  final onCountDownFinishCallback;
  var timer = 10;
  CountTimerWidget({Key key, @required this.onCountDownFinishCallback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CountTimerState();
  }
}

class _CountTimerState extends State<CountTimerWidget> {
  var _sceond = 9; //默认是倒计时九秒
  Timer _time; //计数器

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text(
          '$_sceond',
          style: new TextStyle(fontSize: 17.0, color: Colors.black),
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _time = Timer.periodic(Duration(seconds: 1), (time) {
      setState(() {});
      if (_sceond <= 1) {
        //通知splash倒计时结束了
        widget.onCountDownFinishCallback(true);
        _endTimer();
        return;
      }
      _sceond--;
    });
  }

  void _endTimer() {
    _time?.cancel();
  }
}
