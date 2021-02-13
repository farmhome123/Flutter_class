import 'package:flutter/material.dart';
import 'package:flutter_class/header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class gpsMap extends StatefulWidget {
  @override
  _gpsMapState createState() => _gpsMapState();
}

class _gpsMapState extends State<gpsMap> {
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
            SizedBox(
              height: 15,
            ),
            showMap()
          ],
        ),
      ),
    );
  }
}

Container showMap() {
  LatLng latLng = LatLng(18.78968247473588, 98.98531398384652);
  CameraPosition cameraPosition = CameraPosition(
    target: latLng,
    zoom: 15.0,
  );
  return Container(
    height: 350.0,
    child: GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(
            18.810294583005945, 98.9526081495841), //กำหนดพิกัดเริ่มต้นบนแผนที่
        zoom: 18, //กำหนดระยะการซูม สามารถกำหนดค่าได้ 0-20
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ),
  );
}

class _controller {
  static void complete(GoogleMapController controller) {}
}
