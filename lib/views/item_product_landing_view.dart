import 'package:flutter/material.dart';

class ItemProductLandingView extends StatelessWidget {
  final dynamic image;
  
  final dynamic title;
  
  final dynamic subtitle;
  
  final dynamic price;

  const ItemProductLandingView({this.image, this.title, this.subtitle, this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:  SlantedCornerClipper(),
      child: Container(
        width: 160,
        height: 260,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF313A4E), Color(0xFF222834)]),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "/bike_product");
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  // width: 100,
                  height: 100,
                  child: Center(
                    child: Image(image: AssetImage(image), fit: BoxFit.cover,),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFFA7AAB0),
                    fontSize: 14,
                    fontWeight: FontWeight.w300
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Color(0xFFA7AAB0),
                    fontSize: 14,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlantedCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 50);
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(0, size.height - 10, 20, size.height - 15);
    path.lineTo(size.width - 20, size.height - 40);
    path.quadraticBezierTo(size.width, size.height - 50, size.width, size.height - 70);
    path.lineTo(size.width, 30);
    path.quadraticBezierTo(size.width, 0, size.width - 40, 10);
    path.lineTo(20, 30);
    path.quadraticBezierTo(0, 30, 0, 60);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}