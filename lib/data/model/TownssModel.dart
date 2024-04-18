import 'dart:convert';


class TownssModel {
  int? id;
  Map<String, String>? name; // Change type to Map<String, String>

  String? createdAt;
  String? updatedAt;

  TownssModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });




TownssModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  
  // Parse the 'name' field from string to Map<String, String>
  if (json['name'] is String) {
    // If 'name' is a string, parse it as JSON
    name = Map<String, String>.from(jsonDecode(json['name']));
  } else {
    // If 'name' is already a map, directly assign it
    name = Map<String, String>.from(json['name']);
  }

  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
}








  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}