import 'package:flutter/material.dart';
import 'package:flutter_day2/page3.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<String> litems = ["1", "2", "Third", "4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            child: Text("Click"),
            onPressed: () {
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>Page3()));
              showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                        title: new Text("ทดสอบแจ้งเตือน"),
                        content: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "กรุณากรอกข้อความ",
                                  labelText: "name",
                                  filled: true,
                                  prefixIcon:
                                      Icon(Icons.supervised_user_circle),
                              suffixIcon: Icon(Icons.map)),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "กรุณากรอกข้อความ",
                                  labelText: "Phone",
                                  filled: true,
                                  prefixIcon:
                                  Icon(Icons.supervised_user_circle),
                                  suffixIcon: Icon(Icons.map)),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "กรุณากรอกข้อความ",
                                  labelText: "Address",
                                  filled: true,
                                  prefixIcon:
                                  Icon(Icons.supervised_user_circle),
                                  suffixIcon: Icon(Icons.map)),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          RaisedButton(
                            child: Text('Ok'),
                            color: Colors.indigo,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          RaisedButton(
                            child: Text('Close'),
                            color: Colors.red,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ));
            },
          ),
    DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Name',

                  ),
                ),
                DataColumn(
                  label: Text(
                    'Age',

                  ),
                ),
                DataColumn(
                  label: Text(
                    'Role',

                  ),
                ),
              ],
              rows: <DataRow>[
                for(int i = 0 ;i<5;i++)
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Sarah')),
                      DataCell(Text('19')),
                      DataCell(Text('Student')),

                    ],
                  ),
              ],
            )
          ],
      ),
//        body: ListView.builder(
//          itemCount: 10,
//          scrollDirection: Axis.horizontal,
//          itemBuilder: (BuildContext context, int index) {
//            return Row(
//              children: [
//                Container(
//                  height: 50,
//                  width: 50,
//                  color: Colors.indigo,
//                )
//              ],
//            );
//          },
//        ));
    );
  }
}
