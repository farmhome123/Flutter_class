import 'package:flutter/material.dart';
import 'package:flutter_class/bodyGps.dart';
import 'package:flutter_class/constants.dart';
import 'bodyGps.dart';


class Show_class extends StatefulWidget {

  final String  showidclass;
Show_class({Key key, this.showidclass}):super(key: key);

  @override
  _Show_classState createState() => _Show_classState();
}

class _Show_classState extends State<Show_class> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
     drawer: Drawer(),
      appBar: buildAppBar,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 400,
          color: Colors.blueAccent,
          width: 300,
          child: Text('ID class = ${widget.showidclass}',style: TextStyle(color: Colors.white,fontSize: 30,),),
        )
      ),
    );
  }

   AppBar get buildAppBar {
    return AppBar(
      title: Text('ID class = ${widget.showidclass}'.toString()),
      elevation: 0,
    );
  }
}
