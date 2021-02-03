import 'package:flutter/material.dart';
import 'bodyGps.dart';

class Homegps extends StatefulWidget {
  @override
  _HomegpsState createState() => _HomegpsState();
}

class _HomegpsState extends State<Homegps> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: buildAppBar,
      body: BodyGps(),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      elevation: 0,
    );
  }
}
