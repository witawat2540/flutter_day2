import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page3"),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Center(
            child: AnimatedContainer(
              width: selected ? 200.0 : 100.0,
              height: selected ? 100.0 : 200.0,
              color: selected ? Colors.red : Colors.blue,
              alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: FlutterLogo(size: 75),
            ),
          ),
        )
    );
  }
}
//GridView.count(
//crossAxisCount: 2,
//children: List.generate(100, (index) {
//return Container(
//color: Colors.indigo,
//margin: EdgeInsets.all(5.0),
//child: Center(
//child: Text(
//'Item ${index + 1}',
//style: TextStyle(fontSize: 20,color: Colors.white)
//),
//),
//);
//}),
//),
