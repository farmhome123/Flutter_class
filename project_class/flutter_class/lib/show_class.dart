import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_class/constants.dart';
import 'package:flutter_class/service/config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'bodyGps.dart';
import 'header.dart';

class Show_class extends StatefulWidget {
  final String showidbuilding;
  final String shownamebuilding;

  Show_class({Key key, this.showidbuilding, this.shownamebuilding}) : super(key: key);

  @override
  _Show_classState createState() => _Show_classState();
}
class _Show_classState extends State<Show_class> {
  List<dynamic> row = [];
 
     Future<void> getdata() async {
  
        var res = await connect().get('showclass/${widget.showidbuilding}');
    setState(() {
      row = jsonDecode(res.body);
      print(row);
      print('id class  =  ${widget.showidbuilding}');
    });

  }
@override
  void initState() {
        getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: buildAppBar,
      body: Column(
        children: <Widget>[
          Header(size: size),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.yellow[300],
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
              'นำทางไปยังอาคาร : ${widget.shownamebuilding}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 10,
          ),
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
              'Building : ${widget.shownamebuilding}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 10,
          ),
          //  showMap(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 20,
              children: List.generate(row.length, (index) {
                return Center(
                  child: buildingCard(
                      name_class: row[index]["name_class"],
                      latitude: row[index]["latitude"],
                      longitude: row[index]["longitude"],
                      ontab: () {
                         print("ID class :" + row[index]["id"].toString());
                        // MaterialPageRoute materialPageRoute = MaterialPageRoute(
                        //     builder: (context) => Show_class(
                        //           showidclass: row[index]["id"].toString(),
                        //         ));
                        // Navigator.of(context).push(materialPageRoute);
                      }),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Container showMap() {
    LatLng latLng = LatLng(18.78968247473588, 98.98531398384652);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 15.0,
    );
    return Container(
      height: 300.0,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(18.810294583005945,
              98.9526081495841), //กำหนดพิกัดเริ่มต้นบนแผนที่
          zoom: 15, //กำหนดระยะการซูม สามารถกำหนดค่าได้ 0-20
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      title: Text('ID class = ${widget.showidbuilding}'.toString()),
      elevation: 0,
    );
  }
}


class _controller {
  static void complete(GoogleMapController controller) {}
}
// child: Container(
//           alignment: Alignment.center,
//           height: 400,
//           color: Colors.blueAccent,
//           width: 300,
//           child: Text('ID class = ${widget.showidclass}',style: TextStyle(color: Colors.white,fontSize: 30,),),
//         )
