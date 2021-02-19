import 'package:flutter/material.dart';

class ShowDetailclass extends StatelessWidget {
  final showidclass;
  final String name_class;
  final String floor;
  final String phone;
  final String detail;


  ShowDetailclass({
    Key key,
    this.showidclass, this.name_class, this.floor, this.phone, this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Headerdetail(size: size),
            ContentDetail(
              size: size,
             name_class:name_class,
             phone: phone,
              detail: detail,
              floor: floor,
            ),
          ],
        ),
      ),
    );
  }
}

class ContentDetail extends StatelessWidget {
  const ContentDetail({
    Key key,
    @required this.size, this.name_class, this.floor, this.phone, this.detail,
  }) : super(key: key);
  final String name_class;
  final String floor;
  final String phone;
  final String detail;
  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${name_class}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.06,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 13,
                  color: Colors.green,
                ),
                SizedBox(width: 5),
                Text(
                  'เบอร์โทรศัทพ์ติดต่อ:${phone}',
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Text(
            "ข้อมูลห้องเรียน",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.05,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '${detail}',
            style: TextStyle(
              fontSize: size.width * 0.04,
              color: Colors.black.withOpacity(0.6),
              height: 1.3,
            ),
          ),
          SizedBox(height: 25),
          Row(
            children: <Widget>[
              Text(
                "ชั้นที่ ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                  color: Colors.green[700].withOpacity(0.8),
                ),
              ),
              SizedBox(width: 5),
              Text(
                '${floor}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                  color: Colors.green[700].withOpacity(0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Headerdetail extends StatelessWidget {
  const Headerdetail({
    Key key,
    @required this.size, this.nameClass, this.floor, this.phone, this.detail,
  }) : super(key: key);

  final Size size;
  final String nameClass;
  final String floor;
  final String phone;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height / 2,
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ClipPath(
            clipper: RoundedClipper(),
            child: Image.asset(
              'images/classroom.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 25,
            left: 3,
            child: Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: FlatButton(
                splashColor: Colors.green.withOpacity(0.3),
                padding: EdgeInsets.all(10),
                onPressed: () => {Navigator.pop(context)},
                child: Icon(Icons.arrow_back, size: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 1.5, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
