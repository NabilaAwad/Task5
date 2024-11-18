import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../views/responsiveWidgets.dart';

class MainScreenController extends GetxController{

  final box = GetStorage();

  final List<Product> products = [
    Product('Wireless Charger', 'Fast wireless charger compatible with iPhone and Android devices.', 19.99, 'images/th.jpg'),
    Product('Wireless Headphones', 'High-quality wireless Bluetooth headphones with noise-cancelling feature.', 99.99, 'images/R (1).jpg'),
    Product('Smart Watch', 'Fitness tracking smartwatch with heart rate monitor and GPS.', 149.99, 'images/9.jpg'),
    Product('Laptop Stand', 'Adjustable ergonomic laptop stand made of aluminum alloy.', 29.99, 'images/10.jpg'),
  ];
  final RxList<Product> favorite = <Product>[].obs;
  final RxList<Product> myCart = <Product>[].obs;


  @override
  void onInit() {
    saveFavoraite();
    saveProducts();

    print('Favorites: $favorite');
    print('Cart: $myCart');
    super.onInit();
  }

  void saveFavoraite(){
    final savedFavorites = box.read<List>('favorites') ?? [];
    favorite.assignAll(savedFavorites.map((e) => Product.fromJson(e)).toList());
  }
  void saveProducts(){
    final savedProducts = box.read<List>('Products') ?? [];
    myCart.assignAll(savedProducts.map((e) => Product.fromJson(e)).toList());
  }

  void deleteFavorite(Product product){
    favorite.remove(product);
    box.write('favorites', favorite.map((e) => e.toJson()).toList());
  }
  void deleteCart(Product product){
    myCart.remove(product);
    box.write('Products', myCart.map((e) => e.toJson()).toList());
  }

  void toggleFavorite(Product product) {
    if (favorite.contains(product)) {
     favorite.remove(product);
    }
     else{
       favorite.add(product);
    }
    box.write('favorites', favorite.map((e) => e.toJson()).toList());
  }

  void addToCart(Product product) {
    if (!myCart.contains(product)) {
      myCart.add(product);
    }
    box.write('Products', myCart.map((e) => e.toJson()).toList());
  }
}

  @override
  void onClose() {

  }
  @override
  void onReady() {

  }
