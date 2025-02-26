import 'package:flutter/material.dart';

class ItemProductView extends StatelessWidget {
  final dynamic title;
  final dynamic price;
  final dynamic image;

  const ItemProductView({this.title, this.price, this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Container(
          width: 120,
          height: 120,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Color(0xFF49536B), Color(0xFF384053)]),
              border: Border.all(color: Color(0xFF2E3645), width: 2)),
          child: Image(image: AssetImage(image)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          spacing: 40,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              spacing: 60,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "\$$price",
                  style: TextStyle(
                    color: Color(0xFF3C9EEA),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  spacing: 15,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF37B7E9), Color(0xFF466EEF)]),
                        borderRadius: BorderRadius.circular(5),
                        // border: Border.all(color: Color(0xFF37B7E9),width: 1, strokeAlign: BorderSide.strokeAlignCenter)
                      ),
                      child: MaterialButton(
                        height: 0,
                        minWidth: 0,
                        padding: EdgeInsets.only(top: 0, bottom: 0),
                        onPressed: () {},
                        child: Icon(Icons.add, size: 20),
                      ),
                    ),
                    Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Color(0xFF353F54),
                        borderRadius: BorderRadius.circular(5),
                        // border: Border.all(color: Color(0xFF37B7E9),width: 1, strokeAlign: BorderSide.strokeAlignCenter)
                      ),
                      child: MaterialButton(
                        height: 0,
                        minWidth: 0,
                        padding: EdgeInsets.only(top: 0, bottom: 0),
                        onPressed: () {},
                        child: Icon(Icons.remove, size: 20),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
