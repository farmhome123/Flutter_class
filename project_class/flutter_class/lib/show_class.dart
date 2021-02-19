import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_class/constants.dart';
import 'package:flutter_class/mapgsp.dart';
import 'package:flutter_class/service/config.dart';
import 'package:flutter_class/showdetailclass.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'header.dart';

class Show_class extends StatefulWidget {
  final String showidbuilding;
  final String shownamebuilding;
  final double showlatitude;
  final double showlongitude;


  Show_class({Key key, this.showidbuilding, this.shownamebuilding, this.showlatitude, this.showlongitude})
      : super(key: key);

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
          GestureDetector(
             onTap: () => {
              print('กดระบบนำทางภายในมหาวิทยาลัย'),
              print('latitude = ${widget.showlatitude} ,logitude  = ${widget.showlongitude}'),
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => gpsMap(showname : '${widget.shownamebuilding}',latitude : widget.showlatitude,longitude : widget.showlongitude),
                ),
              ),
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red[400],
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
                'กดเพื่อนำทางไปยังอาคาร : ${widget.shownamebuilding}',
    
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              alignment: Alignment.center,
            ),
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
              'ข้อมูลห้องภายในอาคาร : ${widget.shownamebuilding}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 20,
              children: List.generate(row.length, (index) {
                return Center(
                  child: classCard(
                      name_class: row[index]["name_class"],
                      floor: row[index]["floor"],
                      phone: row[index]["phone"],
                    
                      ontab: () {
                        print("ID class :" + row[index]["id_c"].toString());
                        print('name_class :'+row[index]['name_class'].toString());
                        MaterialPageRoute materialPageRoute = MaterialPageRoute(
                            builder: (context) => ShowDetailclass(
                                 name_class: row[index]["name_class"], showidclass: row[index]["id_c"],phone: row[index]["phone"],detail:row[index]["detail"],floor: row[index]["floor"].toString(),
                                ));
                        Navigator.of(context).push(materialPageRoute);
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
      elevation: 0,
    );
  }
}

class _controller {
  static void complete(GoogleMapController controller) {}
}

class classCard extends StatelessWidget {
  final String textname;
  final double latitude;
  final double longitude;
  final Function ontab;
  final String name_class;
  final String detail;
  final int floor;
  final String phone;

  const classCard({
    Key key,
    this.textname,
    this.latitude,
    this.longitude,
    this.name_class,
    this.ontab,
    showidclass,
    this.detail,
    this.floor,
    this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 17,
                spreadRadius: -10,
                color: kPrimaryColor,
              )
            ]),
        child: Column(
          children: <Widget>[
            Image.asset("images/tc.jpg"),
            Text(
              "${name_class}",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('ชั้น:${floor}'.toString(), style: TextStyle(fontSize: 12)),
            Text('เบอร์โทรติดต่อ:\n${phone}'.toString(),
                style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
