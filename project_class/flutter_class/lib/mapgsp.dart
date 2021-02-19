import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_class/header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'constants.dart';

class gpsMap extends StatefulWidget {
  final String showname;
  final double latitude;
  final double longitude;

  const gpsMap({Key key, this.showname, this.latitude, this.longitude})
      : super(key: key);
  @override
  _gpsMapState createState() => _gpsMapState();
}

class _gpsMapState extends State<gpsMap> {

  
  List<LatLng> polylineCoordinates = [];



  Completer<GoogleMapController> _controller = Completer();
  double lat, lng;
  double lat1, lng1;
  CameraPosition position;
  var _cerrentLocation = 0;

  @override
  void initState() {
    findLatLng();
    super.initState();
  }

  Future<Null> findLatLng() async {
    LocationData locationData = await findLocation();
    lat = locationData.latitude;
    lng = locationData.longitude;
    lat1 = widget.latitude;
    lng1 = widget.longitude;
    print('lat = $lat , lag = $lng');
    print('latitude1 = $lat1, logitude1 = $lng1');
  }

  Future<LocationData> findLocation() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(size: size),
            Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 50),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Text(
                'ระบบนำทางไปยังอาคาร  : ${widget.showname}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 15,
            ),
            lat == null ? showProgress() : showMap(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.backspace),
            title: Text('ย้อนกลับ'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('จังหวัดเชียงใหม่'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('ที่อยู่มหาลัย'),
          ),
        ],
        currentIndex: _cerrentLocation,
        onTap: (i) {
          setState(() {
            _cerrentLocation = i;
            print(i);
          });
          switch (i) {
            case 0:
              Navigator.of(context).pop();

              break;
            case 1:
              _go(_chiangmai);
              break;
            case 2:
              _go(_rmutl);
              break;
          }
        },
      ),
    );
  }

  Marker userMarker() {
    return Marker(
      markerId: MarkerId('userMarker'),
      position: LatLng(lat, lng),
      icon: BitmapDescriptor.defaultMarkerWithHue(230.0),
      infoWindow: InfoWindow(title: 'คุณอยู่ที่นี้'),
    );
  }

  Marker buiildingMarker() {
    return Marker(
      markerId: MarkerId('buildingMarker'),
      position: LatLng(lat1, lng1),
      icon: BitmapDescriptor.defaultMarkerWithHue(11.0),
      infoWindow: InfoWindow(title: 'อาคารอยู่ที่นี้'),
    );
  }

  Set<Marker> myMarkers() {
    return <Marker>[userMarker(), buiildingMarker()].toSet();
  }



  Future<void> _go(CameraPosition cameraPosition) async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition _rmutl = CameraPosition(
      target: LatLng(18.810319887178238, 98.95263501109405), zoom: 16.0);
  static final CameraPosition _chiangmai = CameraPosition(
      target: LatLng(18.791632620302327, 98.98462733836791), zoom: 16.0);

  Container showMap() {
    LatLng latLng = LatLng(lat, lng);
    print('latnew = $lat , lagnew = $lng');
    print('latnew1 = $lat1 , lagnew1 = $lng1');

    position = CameraPosition(
      target: latLng,
      zoom: 15.0,
    );
    var container = Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 1,
      ),
      height: 430,
      child: GoogleMap(
        polylines: {
          Polyline(
              polylineId: PolylineId("p1"),
              color: Colors.red[300],
              points: [
                LatLng(lat1, lng1),
                LatLng(18.810348, 98.956982),
                LatLng(18.809669, 98.957019),
                LatLng(18.809590, 98.956298),
                LatLng(18.809579, 98.955959),
                LatLng(18.809919, 98.955476),
                LatLng(18.810163, 98.955202),
                LatLng(18.810731, 98.955410),
                LatLng(18.810851, 98.955699),         
                LatLng(lat, lng),
              ])
        },
        initialCameraPosition: position,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: myMarkers(),
      ),
    );

    return container;
  }

  Widget showProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> _goMaps() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_rmutl));
  }
}

class _controller {
  static void complete(GoogleMapController controller) {}
}
