import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task5/app/modules/home/views/Cart.dart';
import 'package:task5/app/modules/home/views/product_detailes.dart';
import 'package:task5/app/modules/home/views/responsiveWidgets.dart';

class Mainscreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      'Wireless Charger',
      'Fast wireless charger compatible with iPhone and Android devices.',
      19.99,
      'images/th.jpg',
    ),
    Product(
      'Wireless Headphones',
      'High-quality wireless Bluetooth headphones with noise-cancelling feature.',
      99.99,
      'images/R (1).jpg',
    ),
    Product(
      'Smart Watch',
      'Fitness tracking smartwatch with heart rate monitor and GPS.',
      149.99,
      'images/9.jpg',
    ),
    Product(
      'Laptop Stand',
      'Adjustable ergonomic laptop stand made of aluminum alloy.',
      29.99,
      'images/10.jpg',
    ),
    Product(
      'Laptop Stand',
      'Adjustable ergonomic laptop stand made of aluminum alloy.',
      29.99,
      'images/10.jpg',
    ),
    Product(
      'Laptop Stand',
      'Adjustable ergonomic laptop stand made of aluminum alloy.',
      29.99,
      'images/10.jpg',
    ),
    Product(
      'Laptop Stand',
      'Adjustable ergonomic laptop stand made of aluminum alloy.',
      29.99,
      'images/10.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 15,
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "Welcome to Shopy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Main Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){Get.to(()=>Mainscreen());},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              onTap: (){Get.to(()=>MyCart());},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Theme'),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailScreen(product: products[index]));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.asset(
                        products[index].imageUrl,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            products[index].description,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$${products[index].price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            onPressed: () {},
                            child: Text('Add to Cart'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
