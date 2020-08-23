import 'package:flutter/material.dart';
import 'package:flutter_day2/page3.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50,
            width: 60,
            color: Colors.indigo,
          ),
          RaisedButton(
            child: Text("Click"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Page3()));
            },
          ),
//          SizedBox(width: 10,),
          Container(
            height: 50,
            width: 60,
            color: Colors.indigo,
          ),
//          SizedBox(width: 10,),
          Container(
            height: 50,
            width: 60,
            color: Colors.indigo,
          ),
//          SizedBox(width: 10,),
          Container(
            height: 50,
            width: 60,
            color: Colors.indigo,
          ),
//          SizedBox(width: 10,),
          Container(
            height: 50,
            width: 60,
            color: Colors.indigo,
          ),
        ],
      ),
//      body: ListView(
//        children: [
//          for (int i = 0; i < 20; i++)
//            Card(
//              child: ListTile(
//                onTap: () {},
//                title: Text("index : $i"),
//                subtitle: Text("Name : Mr $i"),
//                leading: Icon(
//                  Icons.list,
//                  color: Colors.indigo,
//                ),
//                trailing: Icon(
//                  Icons.delete,
//                  color: Colors.red,
//                ),
//              ),
//            )
//        ],
//      ),
    );
  }
}
