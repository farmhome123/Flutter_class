import 'package:flutter/material.dart';

import 'body.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: buildAppBar,
      body: Body(),
    );
  }
  AppBar get buildAppBar {
    return AppBar(
      elevation: 0,
    );
  }
}
