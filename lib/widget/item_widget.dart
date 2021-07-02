import 'package:chat_app_example/Modals/Catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item items;
  const ItemWidget({Key key, @required this.items})
      : assert(items != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(items.name),
        subtitle: Text(
          items.desc,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Image.network(items.image),
        trailing: Text(
          "\$ ${items.price}",
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}
