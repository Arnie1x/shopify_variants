class Product {
  late int id;
  late String name;
  late Map<String, Map<int, String>>? options;

  Product({required this.id, required this.name, this.options});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    options = json['options'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['options'] = options;
    return data;
  }
}
