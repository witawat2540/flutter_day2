import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day2/page2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "Noto"),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {'/pages2': (context) => Page2()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(color: Colors.black87,height: 100,width: MediaQuery.of(context).size.width,),
            SizedBox(height: 20,),
            Container(color: Colors.indigoAccent,height: 100,width: MediaQuery.of(context).size.width,),
            SizedBox(height: 20,),
            Container(color: Colors.blue,height: 100,width: MediaQuery.of(context).size.width,),
            SizedBox(height: 20,),
            Container(color: Colors.indigo,height: 100,width: MediaQuery.of(context).size.width,),
            SizedBox(height: 20,),
            Container(color: Colors.indigo,height: 100,width: MediaQuery.of(context).size.width,),
            SizedBox(height: 20,),
            Container(color: Colors.blueGrey,height: 100,width: MediaQuery.of(context).size.width,),
            SizedBox(height: 20,),
            Container(color: Colors.lightBlue,height: 100,width: MediaQuery.of(context).size.width,),
            SizedBox(height: 20,),
            Container(color: Colors.deepPurple,height: 100,width: MediaQuery.of(context).size.width,),
            SizedBox(height: 20,),
            Container(color: Colors.black87,height: 100,width: MediaQuery.of(context).size.width,),
          ],
        ),
      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            RaisedButton(
//              onPressed: () {
////                Navigator.push(
////                    context, MaterialPageRoute(builder: (context) => Page2()));
//              Navigator.pushNamed(context, "/pages2");
//
//              },
//              child: Text("Click Me"),
//            ),
//            SizedBox(height: 20,),
//            Text("I'am Programmer",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
//                fontFamily: "Noto"),)
////            Card(
////              elevation: 20.0,
////              margin: EdgeInsets.all(20),
////              color: Colors.red,
////              child: Container(height: 200,width: MediaQuery.of(context).size.width,),
////            )
////            DataTable(
////              columns: const <DataColumn>[
////                DataColumn(
////                  label: Text(
////                    'Name',
////
////                  ),
////                ),
////                DataColumn(
////                  label: Text(
////                    'Age',
////
////                  ),
////                ),
////                DataColumn(
////                  label: Text(
////                    'Role',
////
////                  ),
////                ),
////              ],
////              rows: <DataRow>[
////                for(int i = 0 ;i<5;i++)
////                  DataRow(
////                    cells: <DataCell>[
////                      DataCell(Text('Sarah')),
////                      DataCell(Text('19')),
////                      DataCell(Text('Student')),
////
////                    ],
////                  ),
////              ],
////            )
//          ],
//        ),
//      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          Navigator.pushAndRemoveUntil(
//              context,
//              MaterialPageRoute(builder: (context) => Page2()),
//              (route) => false);
          Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page2()));
              Navigator.pushNamed(context, "/pages2");
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
