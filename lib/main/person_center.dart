import 'package:flutter/material.dart';

class PersonCenterWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonCenterState();
  }

}
class _PersonCenterState extends State<PersonCenterWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: Text("person info"),
    );
  }

}