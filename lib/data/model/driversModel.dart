import 'dart:convert';

class DriversModel {
  int? id;
   Map<String, String>? name; // Change type to Map<String, String>
  String? phone;
  String? password;
  String? createdAt;
  String? updatedAt;

  DriversModel(
      {this.id,
      this.name,
      this.phone,
      this.password,
      this.createdAt,
      this.updatedAt});

  DriversModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    
      // Parse the 'name' field from string to Map<String, String>
  if (json['name'] is String) {
    // If 'name' is a string, parse it as JSON
    name = Map<String, String>.from(jsonDecode(json['name']));
  } else {
    // If 'name' is already a map, directly assign it
    name = Map<String, String>.from(json['name']);
  }
  
    phone = json['phone'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['name'] = this.name;

    data['phone'] = this.phone;
    data['password'] = this.password;
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