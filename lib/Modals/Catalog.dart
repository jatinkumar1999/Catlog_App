import 'dart:convert';

class CatalogModal {

//singalton
//   static final  catalogModal=CatalogModal._internal();
// CatalogModal._internal();
// factory CatalogModal() => catalogModal;

  static List<Item> items;

//get item by id

   Item getbyid(int id) =>
      items.firstWhere((element) => element.id == id);
  //get items by index

   Item getbyposition(int pos) => items[pos];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;

  Item({
    this.id,
    this.name,
    this.desc,
    this.color,
    this.image,
    this.price,
  });

  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(
  //     id: map["id"],
  //     name: map["name"],
  //     desc: map["desc"],
  //     color: map["color"],
  //     image: map["image"],
  //     price: map["price"],
  //   );
  // }
  // toMap() => {
  //       "id": id,
  //       "name": name,
  //       "desc": desc,
  //       "color": color,
  //       "image": image,
  //       "price": price,
  //     };

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'color': color,
      'image': image,
      'price': price,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      color: map['color'],
      image: map['image'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, color: $color, image: $image, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.color == color &&
        other.image == image &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        color.hashCode ^
        image.hashCode ^
        price.hashCode;
  }
}
