import 'dart:convert';

class SereptaModel {
  int? id;
   Map<String, String>? name; // Change type to Map<String, String>
  String? priceLira;
  String? priceDollar;
  String? createdAt;
  String? updatedAt;

  SereptaModel(
      {this.id,
      this.name,
      this.priceLira,
      this.priceDollar,
      this.createdAt,
      this.updatedAt});

  SereptaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

      // Parse the 'name' field from string to Map<String, String>
  if (json['name'] is String) {
    // If 'name' is a string, parse it as JSON
    name = Map<String, String>.from(jsonDecode(json['name']));
  } else {
    // If 'name' is already a map, directly assign it
    name = Map<String, String>.from(json['name']);
  }

    priceLira = json['price_Lira'];
    priceDollar = json['price_Dollar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.name;

    data['price_Lira'] = this.priceLira;
    data['price_Dollar'] = this.priceDollar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Name {
  String? en;
  String? ar;

  Name({this.en, this.ar});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}