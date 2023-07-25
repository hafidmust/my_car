class Car {
  int? id;
  String? name;
  String? description;
  String? price;
  String? year;

  Car({this.id, this.name, this.description, this.price, this.year});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['year'] = year;

    return map;
  }

  Car.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.description = map['description'];
    this.price = map['price'];
    this.year = map['year'];
  }
}
