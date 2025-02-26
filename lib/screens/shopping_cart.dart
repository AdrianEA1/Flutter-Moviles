import 'package:app/views/item_product_view.dart';
import 'package:flutter/material.dart';
import 'package:sliding_action_button/sliding_action_button.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  var txtUser = TextFormField(
    decoration: InputDecoration(
        focusColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF1C232F), width: 2)),
        hintText: "Introduce un cupón",
        suffixIcon: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF37B7E9), Color(0xFF466EEF)]),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Color(0xFF37B7E9),
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter)),
          child: TextButton(
              onPressed: () {},
              child: Text(
                "Apply",
                style: TextStyle(color: Colors.white, fontSize: 14),
              )),
        )),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 80,
        // leadingWidth: 60,
        // titleSpacing: 40,
        backgroundColor: Color(0xFF222834),
        title: Text(
          "My Shopping Cart",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
        ),
        leading: Container(
            margin: EdgeInsets.only(left: 15),
            // width: 40,
            // height: 10,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF37B7E9), Color(0xFF466EEF)]),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Color(0xFF37B7E9),
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter)),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xFF222834)),
          child: Column(
            children: [
              ItemProductView(
                title: "PEUGEOT - LR01",
                price: "1,999.99",
                image: "assets/bici_model2.png",
              ),
              SizedBox(
                height: 10,
              ),
              ItemProductView(
                title: "PILOT - CHROMOLY 520",
                price: "3,999.99",
                image: "assets/bici_negra.png",
              ),
              SizedBox(
                height: 10,
              ),
              ItemProductView(
                title: "SMITH - Trade",
                price: "120.00",
                image: "assets/casco.png",
              ),
              SizedBox(
                height: 10,
              ),
              txtUser,
              Text(
                "Your bag qualifies for free shipping",
                style: TextStyle(
                    color: Color(0xFFA7ABB1),
                    fontSize: 16,
                    fontWeight: FontWeight.w200),
              ),
              SizedBox(height: 10,),
              Container(  
                width: MediaQuery.of(context).size.width,
                child: Column(
                  spacing: 15,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal:",
                          style: TextStyle(
                            color: Color(0xFFE3E4E6),
                            fontSize: 15
                          ),
                        ),
                        Text(
                          "\$6,199.99",
                          style: TextStyle(
                            color: Color(0xFFA7ABB1),
                            fontSize: 15
                          ),
                        )
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Fee:",
                          style: TextStyle(
                            color: Color(0xFFE3E4E6),
                            fontSize: 15
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            color: Color(0xFFE3E4E6),
                            fontSize: 15
                          ),
                        )
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount:",
                          style: TextStyle(
                            color: Color(0xFFE3E4E6),
                            fontSize: 15
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            color: Color(0xFFE3E4E6),
                            fontSize: 15
                          ),
                        )
                    ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(
                            color: Color(0xFFE3E4E6),
                            fontSize: 15
                          ),
                        ),
                        Text(
                          "\$6,199.99",
                          style: TextStyle(
                            color: Color(0xFF38B8EA),
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                          ),
                        )
                    ],),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              SquareSlideToActionButton(
                  width: 250,
                  parentBoxRadiusValue: 15,
                  initialSlidingActionLabel: 'Checkout',
                  finalSlidingActionLabel: 'Loading...',
                  squareSlidingButtonSize: 50,
                  squareSlidingButtonIcon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                  squareSlidingButtonBackgroundColor:  Color(0xFF447BEE),
                  parentBoxBackgroundColor: Color(0xFF212935),
                  parentBoxDisableBackgroundColor: Colors.grey,
                  leftEdgeSpacing: 2,
                  rightEdgeSpacing: 4,
                  slideActionButtonType:
                      SlideActionButtonType.slideActionWithLoaderButton,
                  onSlideActionCompleted: () {
                    print("Sliding action completed");
                  },
                  onSlideActionCanceled: () {
                    print("Sliding action cancelled");
                  },
                ),
              // CircleSlideToActionButton(
              //     width: 250,
              //     parentBoxRadiusValue: 27,
              //     circleSlidingButtonSize: 47,
              //     leftEdgeSpacing: 3,
              //     initialSlidingActionLabel: 'Add To Basket',
              //     finalSlidingActionLabel: 'Added To Basket',
              //     circleSlidingButtonIcon: const Icon(
              //       Icons.arrow_forward_ios_rounded,
              //       color: Colors.white,
              //     ),
              //     parentBoxBackgroundColor: Color(0xFF212935),
              //     parentBoxDisableBackgroundColor: Colors.grey,
              //     circleSlidingButtonBackgroundColor: Color(0xFF447BEE),
              //     isEnable: true,
              //     slideActionButtonType:
              //         SlideActionButtonType.slideActionWithLoaderButton,
              //     onSlideActionCompleted: () {
              //       print("Sliding action completed");
              //     },
              //     onSlideActionCanceled: () {
              //       print("Sliding action cancelled");
              //     },
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
