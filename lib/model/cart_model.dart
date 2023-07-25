class CartModel {
  int? id;
  String? name;

  int? price;
  int? quantity;
  bool? isExist;
  String? time;
  String? img;

  CartModel(
      {this.id,
      this.img,
      this.name,
      this.price,
      this.quantity,
      this.time,
      this.isExist});
  CartModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    img = json["img"];
    quantity = json["quantity"];
    time = json["time"];
    isExist = json["isExist"];
  }
}
