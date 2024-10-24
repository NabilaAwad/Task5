import 'package:flutter/material.dart';

Widget onBoardingPage ({
  required Color color,
  required String title,
  required String description,
  required String img,

}){
return Container(
  color: color,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(img),
        SizedBox(height: 20,),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20,),
        Text(
          description,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),
          textAlign: TextAlign.center,
        )
      ],
    ),
  ),
);
}
Widget Animated_tran({
  required int index,
  required int currentPage
}){
  return AnimatedContainer(
    duration:Duration(microseconds: 200),
    margin: EdgeInsets.symmetric(horizontal: 5),
    height: 10,
    width: currentPage == index ? 20 : 10,
    decoration: BoxDecoration(
      color: currentPage == index ? Colors.white : Colors.grey,
      borderRadius: BorderRadius.circular(5),
    ),
  );

}

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product(this.name, this.description, this.price, this.imageUrl);
}
class CartItem {
  final String name;
  final double price;

  CartItem(this.name, this.price);
}
