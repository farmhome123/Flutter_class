import 'package:flutter/material.dart';
import 'package:flutter_class/homepage.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Class',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        textTheme: Theme
            .of(context)
            .textTheme
            .apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homepage(),
    );
  }
}
