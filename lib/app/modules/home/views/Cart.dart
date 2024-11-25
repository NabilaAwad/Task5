import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/mainScreenController.dart';

class MyCart extends StatelessWidget {
  final MainScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Obx(() {
        if (controller.myCart.isEmpty) {
          return Center(child: Text("Your cart is empty."));
        }
        return ListView.builder(
          itemCount: controller.myCart.length,
          itemBuilder: (context, index) {
            final product = controller.myCart[index];
            return ListTile(
              leading: Image.asset(product.imageUrl, width: 50),
              title: Text(product.name),
              subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  controller.deleteFavorite(product);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
