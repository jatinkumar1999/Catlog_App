import 'package:chat_app_example/Modals/Catalog.dart';

import 'package:chat_app_example/widget/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item item;
  const HomeDetailPage({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${item.price.toString()}"
              .text
              .textStyle(context.captionStyle)
              .size(25)
              .make(),
          AddToCart(item: item),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: item.id.toString(),
                    child: Image.network(item.image).h40(context))
                .p32(),
            Expanded(
              child: VxArc(
                height: 30,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      item.name.text
                          .size(40)
                          .color(context.accentColor)
                          .bold
                          .make(),
                      item.desc.text
                          .size(25)
                          .textStyle(context.captionStyle)
                          .make(),
                    ],
                  ).p32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
