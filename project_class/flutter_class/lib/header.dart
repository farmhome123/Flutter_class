import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: size.height * 0.2,
      child: Stack(

        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 120, top: 90),
            height: size.height * 0.2,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Application for Rmutl\n (Jedlin) Navagation',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(

            bottom: 70,
            left: 165,
            child: Row(
              children: [
                Image.asset(
                  "images/tek.png",
                  fit: BoxFit.fill,
                  height: 90,
                  width: 90,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
