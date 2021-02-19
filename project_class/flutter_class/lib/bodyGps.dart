import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/show_class.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';
import 'header.dart';
import 'service/config.dart';

class BodyGps extends StatefulWidget {
  @override
  _BodyGpsState createState() => _BodyGpsState();
}

class _BodyGpsState extends State<BodyGps> {
  int counter = 0;

  List<dynamic> showidbuilding;
  List<double> showlatitude;
  List<double> showlongitude;
  
  List<dynamic> row = [];

  Future<void> getdata() async {
    var res = await connect().get('showbuilding');
    setState(() {
      row = jsonDecode(res.body);
      print(row);
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
    return Column(
      children: [
        Header(size: size),
        Container(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue[300],
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
              'อาคารทั้งหมด',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            alignment: Alignment.center,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                )
              ]),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: "ค้นหาอาคาร",
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    // suffixIcon: Icon(Icons.screen_search_desktop),
                  ),
                ),
              ),
              Icon(Icons.search_sharp),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 20,
            children: List.generate(row.length, (index) {
              return Center(
                child: buildingCard(
                    textname: row[index]["name"],
                    latitude: row[index]["latitude"],
                    longitude: row[index]["longitude"],
                    ontab: () {
                      print("ID class :" + row[index]["id"].toString());
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (context) => Show_class(
                                showidbuilding: row[index]["id"].toString(),shownamebuilding: row[index]["name"],showlatitude:row[index]["latitude"], showlongitude:row[index]["longitude"],
                              ));
                      Navigator.of(context).push(materialPageRoute);
                    }),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class Showidclass {}

class buildingCard extends StatelessWidget {
  final String textname;
  final double latitude;
  final double longitude;
  final Function ontab;
  final String name_class;
  final String detail; 
  final int floor;
  final String phone;
  

  const buildingCard({
    Key key,
    this.textname,
    this.latitude,
    this.longitude,
    this.name_class,
    this.ontab,
    this.detail, this.floor, this.phone,
  
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
              "${textname}",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Latitude:${latitude}", style: TextStyle(fontSize: 14)),
            Text("Longitude:${longitude}", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
