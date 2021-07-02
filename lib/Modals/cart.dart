import 'package:chat_app_example/Modals/Catalog.dart';
import 'package:chat_app_example/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModal {
//singalton
// static final  cartModal=CartModal._internal();
// CartModal._internal();
// factory CartModal() => cartModal;

  CatalogModal _catalog;

  final List<int> _itemsid = [];
  // get Catalog

  CatalogModal get catalog => _catalog;

  set catalog(CatalogModal newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }
  //get Cart Items

  List<Item> get item => _itemsid.map((id) => _catalog.getbyid(id)).toList();

//get Total Price

  num get totalprice => item.fold(0, (total, current) => total + current.price);

  //add item

  void additem(Item item) {
    _itemsid.add(item.id);
  }

  //remove item
  void removeitem(Item item) {
    _itemsid.remove(item.id);
  }
}
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemsid.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemsid.remove(item.id);
  }
}
