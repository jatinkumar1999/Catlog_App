import 'package:chat_app_example/Modals/Catalog.dart';
import 'package:chat_app_example/Modals/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModal catalog;
  CartModal cart;
  MyStore() {
    catalog = CatalogModal();
    cart = CartModal();
    cart.catalog=catalog;
    
  }
}
