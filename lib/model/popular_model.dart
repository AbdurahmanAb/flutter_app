class PopularModel {
  int? _total_size;
  int? _type_id;
  int? _offset;

  List<Products>? products;
  PopularModel.fromJson(Map<String, dynamic> json) {
    _total_size = json["total_size"];
    _type_id = json["type_id"];
    _offset = json["offset"];
    if (json["products"] != null) {
      products = <Products>[];
      (json["products"] as List).forEach((element) {
        products!.add(Products.fromJson(element));
      });
    }
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  int? price;
  int? star;
  String? img;
  String? location;
  int? _type_id;

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    star = json["stars"];
    img = json["img"];
    location = json["location"];
    _type_id = json["type_id"];
  }
}
