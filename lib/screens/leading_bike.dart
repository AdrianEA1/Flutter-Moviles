import 'package:app/views/item_product_landing_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class LeadingBike extends StatefulWidget {
  const LeadingBike({super.key});

  @override
  State<LeadingBike> createState() => _LeadingBikeState();
}

class _LeadingBikeState extends State<LeadingBike> {


  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF242C3B),
        title: Text("Choose Your Bike"),
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 25,
          fontWeight: FontWeight.w600
          ),
        actions: [
          Container(
            height: 40,
            width: 40,
            
            margin: EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color.fromARGB(207, 55, 183, 233)),
            child: Icon(Icons.search_rounded, size: 30, color: Color.fromARGB(255, 255, 255, 255),),
          )
        ],
      ),
      
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: const Color(0xFF242C3B),
          // image: DecorationImage(image: AssetImage("assets/Rectangle.png"), fit: BoxFit.cover),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            ClipPath(
              clipper: SlantedCornerClipper(),
              child: Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(54, 196, 196, 196),
                  // color: Color.fromARGB(143, 177, 21, 21),
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    topEnd: Radius.circular(20),
                    ),
                    
                ),
                child: ListTile(

                  title: Image(image: AssetImage("assets/ElectricBicycle2.png"),),
                  subtitle: Text("30% Off", style: TextStyle(color: Color.fromARGB(195, 162, 165, 170), fontSize: 30, fontWeight: FontWeight.w600),),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Stack(
                // fit: StackFit.expand,
                // alignment: Alignment.center,
                children: [
                  Positioned(
                  top: 50,
                  left: 10,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF313A4E),Color(0xFF222834)]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text("All",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                    )
                    )
                  ),
                  Positioned(
                  top: 40,
                  left: 80,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF313A4E),Color(0xFF222834)]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(Icons.battery_charging_full_sharp, size: 20, color: Colors.white,)
                    )
                    )
                  ),
                  Positioned(
                  top: 30,
                  left: 150,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF313A4E),Color(0xFF222834)]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(Icons.streetview, size: 20, color: Colors.white,)
                    )
                    )
                  ),
                  Positioned(
                  top: 20,
                  left: 220,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF313A4E),Color(0xFF222834)]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(Icons.add_reaction_rounded, size: 20, color: Colors.white,)
                    )
                    )
                  ),
                  Positioned(
                  top: 10,
                  left: 285,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF313A4E),Color(0xFF222834)]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(Icons.headset_mic_outlined, size: 20, color: Colors.white,)
                    )
                    )
                  ),
                ]
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    child: ItemProductLandingView(
                      image: "assets/bici_model2.png",
                      title: "Road bike",
                      subtitle: "PEUGEOT - LR01",
                      price: "\$1,999.99",
                    )
                  ),
                  Positioned(
                    top: 0,
                    left: 180,
                    child: ItemProductLandingView(
                      image: "assets/casco.png",
                      title: "Road helmet",
                      subtitle: "SMITH - Trade",
                      price: "\$120.00",
                    )
                  ),
                  Positioned(
                    top: 270,
                    child: ItemProductLandingView(
                      image: "assets/bici_negra.png",
                      title: "Road bike",
                      subtitle: "Bici negra",
                      price: "\$0.00",
                    )
                  ),
                  Positioned(
                    top: 240,
                    left: 180,
                    child: ItemProductLandingView(
                      image: "assets/ElectricBicycle2.png",
                      title: "Road bike",
                      subtitle: "PEUGEOT - R2",
                      price: "\$1,299.99",
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: const Color(0xFF222834),
        backgroundColor: const Color(0xFF242C3B),
        buttonBackgroundColor: Color(0xFF37B6E9),
        index: 0,
        animationDuration: Duration(milliseconds: 200),
        items: <Widget>[
          Icon(Icons.pedal_bike, size: 25, color: Color.fromARGB(193, 230, 227, 227)),
          Icon(Icons.map_sharp, size: 25, color: Color.fromARGB(193, 230, 227, 227)),
          Icon(Icons.shopping_cart, size: 25, color: Color.fromARGB(193, 230, 227, 227)),
          Icon(Icons.person, size: 25, color: Color.fromARGB(193, 230, 227, 227)),
          Icon(Icons.edit_document, size: 25, color: Color.fromARGB(193, 230, 227, 227)),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}


class SlantedCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height - 30);
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 80);
    path.quadraticBezierTo(size.width, size.height - 50, size.width - 30, size.height - 40);
    path.lineTo( 20, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 30);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
