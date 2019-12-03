import 'package:flutter/material.dart';
class MyListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: Scaffold(
      body: Container(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context,int position){
              return MItem();
            },
          )
      ) 
      ),
    );
  }
}
//这是一个listview的 item
class MItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
  margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          //clipRRect 为左边的图片
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              "http://cdn2.jianshu.io/assets/default_avatar/8-a356878e44b45ab268a3b0bbaaadeeb7.jpg",
              width: 100.0, height: 150.0,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8.0),
              height: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text('nimasile',maxLines: 1,style: TextStyle(color: Colors.red,fontSize: 20.0),),
                   Text('hahah',maxLines: 1,),
                   Text('电影名称',maxLines: 1,),
                  Text('电影名称',maxLines: 1,)
                 ],
              ),
            ),
          )
          ]
));
  }
}