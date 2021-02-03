import 'package:flutter/material.dart';
import 'bodyGps.dart';
import 'header.dart';

class Show_class extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
     drawer: Drawer(),
      appBar: buildAppBar,
      body: Column(
        
      ),
    );
  }

   AppBar get buildAppBar {
    return AppBar(
      elevation: 0,
    );
  }
}
