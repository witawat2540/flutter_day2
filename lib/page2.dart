import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<String> litems = ["1", "2", "Third", "4"];
  double lat, long;
  Address first;
  TextEditingController _adress = TextEditingController();

  Future<Null> get_address_now() async {
    final coordinates = new Coordinates(lat, long);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      first = addresses.first;
    });
    print(first.runtimeType);
    print("${first.featureName} : ${first.addressLine}");
  }
  Future<void> get_Address_find()async{
    final query = "มหาสารคาม";
    var addresses = await Geocoder.local.findAddressesFromQuery(_adress.text);
    setState(() {
      first = addresses.first;
    });
    print("${first.featureName} : ${first.coordinates}");
  }

  Future<Null> getlatlug() async {
    LocationData locationData = await getlocation();
    setState(() {
      lat = locationData.latitude;
      long = locationData.longitude;
    });
    print('$lat,$long');
    get_address_now();
  }

  Future<LocationData> getlocation() {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    getlatlug();
    //get_address_now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: TextFormField(
                    controller: _adress,
                    decoration: InputDecoration(
                      labelText: 'กรอกที่อยู่',
                      filled: true,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () {
                    //get_address_now();
                    get_Address_find();
                  },
                  child: Text('ค้นหา'),
                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              first == null
                  ? Text('ที่อยู่ปัจุบันของคุณคือ : ')
                  : Text('ที่อยู่ปัจุบันของคุณคือ : ' + 'ตำบล : '+first.locality),
            ],
          ),
//          ' อำเภอ : '+first.subAdminArea
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              first == null
                  ? Text('ที่อยู่ปัจุบันของคุณคือ : ')
                  : Text(' อำเภอ : '+first.subAdminArea),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              first == null
                  ? Text('ที่อยู่ปัจุบันของคุณคือ : ')
                  : Text(first.adminArea),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                lat = first.coordinates.latitude;
                long = first.coordinates.longitude;
              });
              MapsLauncher.launchCoordinates(
                  lat, long, 'Google Headquarters are here');
            //print('${first.coordinates}');
            },
            color: Colors.deepPurpleAccent,
            textColor: Colors.white,
            child: Text('ไปกันเลย'),
          ),
        ],
      ),
    );
  }
}
