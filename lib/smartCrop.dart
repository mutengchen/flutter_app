import 'package:flutter/material.dart';

class SmartCropWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SmartState();
  }

}
class _SmartState extends State<SmartCropWidget>{
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

  Future startScan() async {
    //     var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    // String file = imageFile.path;
    // RectPoint rectPoint = await FlutterSmartCropper.detectImageRect(file);
  }
}