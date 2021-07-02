

import 'package:chat_app_example/Modals/cart.dart';
import 'package:chat_app_example/core/store.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          CartItemList().p32().expand(),
          const Divider(),
          const CartTotal(),
        ],
      ),
    );
  }
}

class CartItemList extends StatelessWidget {

  // final _cart = CartModal();
  @override
  Widget build(BuildContext context) {
    CartModal _cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.item.isEmpty
        ? "Nothing to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.item.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                onPressed: () {
                  RemoveMutation(_cart.item[index]);
                  // setState(() {});
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              title: _cart.item[index].name.text.make(),
            ),
          );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _cart = CartModal();
    CartModal _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxConsumer(
            builder: (BuildContext context,_,Dart_CObject){
              return "\$ ${_cart.totalprice}"
                  .text
                  .xl4
                  .color(context.accentColor)
                  .make();
            },
            mutations: const { RemoveMutation},
            notifications:const  {},
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              onSurface: context.theme.buttonColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying Not supportd yet".text.make(),
              ));
            },
            child: "Buy".text.white.make(),
          ).w24(context),
        ],
      ).p32(),
    );
  }
}
