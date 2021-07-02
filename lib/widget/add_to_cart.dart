import 'package:chat_app_example/core/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:chat_app_example/Modals/Catalog.dart';
import 'package:chat_app_example/Modals/cart.dart';

class AddToCart extends StatelessWidget {
  final Item item;
  AddToCart({
    Key key,
    this.item,
  }) : super(key: key);
  // final _cart = CartModal();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);

    CartModal _cart = (VxState.store as MyStore).cart;
    // CatalogModal _catalog = (VxState.store as MyStore).catalog;
    bool isAdded = _cart.item.contains(item) ?? false;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
      ),
      onPressed: () {
        if (!isAdded) {
          AddMutation(item);
          // isAdded = !isAdded;

          // _cart.catalog = _catalog;

          // _cart.additem(item);
          // setState(() {});
        }
      },
      child: isAdded
          ? const Icon(Icons.done)
          : const Icon(Icons.add_shopping_cart),
    );
  }
}
