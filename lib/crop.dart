import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:permission_handler/permission_handler.dart';
class MeCrop extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _meCrop();
  }
}
class _meCrop extends State<MeCrop>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //请求权限
    requestPermission();
    //开始扫描矩形
    openCrop();

  }
  Future requestPermission() async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.camera,PermissionGroup.storage]);
    // 申请结果
    PermissionStatus permission =
    await PermissionHandler().checkPermissionStatus(PermissionGroup.location);

    if (permission == PermissionStatus.granted) {
      //权限申请成功
      // preLogin();
    } else {
      //权限申请被拒绝
      log("亲！必须开启位置权限才能进入主程序~");
      // 申请权限
      //    只有当用户同时点选了拒绝开启权限和不再提醒后才会true
      bool isSHow = await PermissionHandler()
          .shouldShowRequestPermissionRationale(PermissionGroup.camera);
      if(!isSHow){
        log("当前已被您禁用申请权限，请在设置中手动开启后退出重新进入程序");
        await PermissionHandler().openAppSettings();
      }else{
        PermissionStatus ps =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
        if(ps == PermissionStatus.granted){
          // preLogin();
        }else{
          requestPermission();
        }
      }

    }

  }

  Future openCrop() async {
     String imagePath = await EdgeDetection.detectEdge;

  }
}