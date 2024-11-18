import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/mainScreenController.dart';

class MyFavoraite extends StatelessWidget {
  final MainScreenController controller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favoraite"),
      ),
      body: Obx(() {
        if (controller.favorite.isEmpty) {
          return Center(child: Text("No favorite is found."));
        }
        return ListView.builder(
          itemCount: controller.favorite.length,
          itemBuilder: (context, index) {
            final product = controller.favorite[index];
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
