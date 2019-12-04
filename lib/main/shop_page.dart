import 'package:flutter/material.dart';

class ShopPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShopState();
  }

}
class _ShopState extends State<ShopPageWidget>{
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Text("shop pages"),
    );
  }

}