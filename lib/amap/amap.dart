import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
class AmapWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AmapState();
  }

}
class _AmapState extends State<AmapWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
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
  }

}