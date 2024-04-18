import 'dart:convert';

class DistrictsModel {
  int? id;
   Map<String, String>? name; // Change type to Map<String, String>
  int? townId;
  String? townNameAr;
  String? townNameEn;
  String? createdAt;
  String? updatedAt;

  DistrictsModel(
      {this.id,
      this.name,
      this.townId,
      this.townNameAr,
      this.townNameEn,
      this.createdAt,
      this.updatedAt});

  DistrictsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
     // Parse the 'name' field from string to Map<String, String>
  if (json['name'] is String) {
    // If 'name' is a string, parse it as JSON
    name = Map<String, String>.from(jsonDecode(json['name']));
  } else {
    // If 'name' is already a map, directly assign it
    name = Map<String, String>.from(json['name']);
  }
    townId = json['town_id'];
    townNameAr = json['town_name_ar'];
    townNameEn = json['town_name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
     data['name'] = this.name;
    data['town_id'] = this.townId;
    data['town_name_ar'] = this.townNameAr;
    data['town_name_en'] = this.townNameEn;
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