import 'dart:convert';
import 'package:chat_app_example/Modals/Catalog.dart';
import 'package:chat_app_example/Modals/cart.dart';
import 'package:chat_app_example/Pages/home_detail_page.dart';
import 'package:chat_app_example/Utils/Routes.dart';
import 'package:chat_app_example/core/store.dart';
import 'package:chat_app_example/widget/add_to_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var result = await rootBundle.loadString("assets/files/cartalog.json");

    var decodedData = jsonDecode(result);
    var productsData = decodedData["products"];
    CatalogModal.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, _, name) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartPage);
          },
          child: const Icon(CupertinoIcons.cart, color: Colors.white),
          backgroundColor: context.theme.buttonColor,
        ).badge(
          color: Vx.red500,
          size: 20,
          count: _cart.item.length,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 15, left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              const SizedBox(height: 20),
              CatalogModal.items == null
                  ? const Center(child: CircularProgressIndicator()).expand()
                  : const CalalogList().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class CalalogList extends StatelessWidget {
  const CalalogList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shrinkWrap: true,
        itemCount: CatalogModal.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModal.items[index];
          return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeDetailPage(item: catalog)));
              },
              child: CatalogItems(item: catalog));
        });
  }
}

class CatalogItems extends StatelessWidget {
  final Item item;
  const CatalogItems({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: item.id.toString(),
            child: ProductsImage(
              image: item.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                item.name.text.size(20).color(context.accentColor).bold.make(),
                item.desc.text.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${item.price.toString()}"
                        .text
                        .textStyle(context.captionStyle)
                        .size(20)
                        .make(),
                    AddToCart(item: item),
                  ],
                ),
              ],
            ).py12(),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py12();
  }
}

class ProductsImage extends StatelessWidget {
  final String image;
  const ProductsImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p12
        .rounded
        .color(context.canvasColor)
        .make()
        .p12()
        .w40(context);
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App"
              .text
              .xl4
              .semiBold
              .color(context.theme.buttonColor)
              .make(),
          const SizedBox(height: 10),
          "Trending Products".text.make(),
        ],
      ),
    );
  }
}
