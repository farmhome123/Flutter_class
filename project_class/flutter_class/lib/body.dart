import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_class/constants.dart';
import 'package:flutter_class/homegps.dart';
import 'header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(size: size),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => {
              print('กดระบบนำทางภายในมหาวิทยาลัย'),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homegps(),
                ),
              ),
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.yellow[400],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.13),
                  ),
                ],
              ),
              child: Text(
                'ระบบนำทางภายในมหาวิทยาลัย',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              alignment: Alignment.center,
            ),
          ),
          Container(
            height: 40,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ข่าวสาร",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 7,
                  color: kPrimaryColor.withOpacity(0.2),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                NewsCard(
                  size: size,
                  image: "images/tek.png",
                  titel: "ข่าว1",
                  titelhead: "ข่าว1",
                ),
                NewsCard(
                  size: size,
                  image: "images/tek.png",
                  titel: "ข่าว2",
                  titelhead: "ข่าว2",
                ),
                NewsCard(
                  size: size,
                  image: "images/tek.png",
                  titel: "ข่าว3",
                  titelhead: "ข่าว3",
                ),
                NewsCard(
                  size: size,
                  image: "images/tek.png",
                  titel: "ข่าว4",
                  titelhead: "ข่าว4",
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "กิจกรรมที่น่าสนใจ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 7,
                  color: kPrimaryColor.withOpacity(0.2),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                NewsCard(
                  size: size,
                  image: "images/tek.png",
                  titel: "กิจกรรมที่น่าสนใจ1",
                  titelhead: "กิจกรรมที่น่าสนใจ1",
                ),
                NewsCard(
                  size: size,
                  image: "images/tek.png",
                  titel: "กิจกรรมที่น่าสนใจ2",
                  titelhead: "กิจกรรมที่น่าสนใจ2",
                ),
                NewsCard(
                  size: size,
                  image: "images/tek.png",
                  titel: "กิจกรรมที่น่าสนใจ3",
                  titelhead: "กิจกรรมที่น่าสนใจ3",
                ),
                NewsCard(
                  size: size,
                  image: "images/tek.png",
                  titel: "กิจกรรมที่น่าสนใจ4",
                  titelhead: "กิจกรรมที่น่าสนใจ4",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
    @required this.size,
    this.image,
    this.titel,
    this.titelhead,
  }) : super(key: key);

  final Size size;
  final String image, titel, titelhead;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 4,
          bottom: kDefaultPadding * 2.5),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
          ),
          GestureDetector(
            onTap: () {
              print('กดข่าว');
            },
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23))
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$titelhead\n".toUpperCase(),
                          style: TextStyle(color: kPrimaryColor, fontSize: 13),
                        ),
                        TextSpan(
                          text: "$titel".toUpperCase(),
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
