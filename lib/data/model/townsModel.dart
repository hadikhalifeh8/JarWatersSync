class TownsModel {
  int? id;
  Name? name;
  String? createdAt;
  String? updatedAt;

  TownsModel({this.id, this.name, this.createdAt, this.updatedAt});

  // TownsModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'] != null ? new Name.fromJson(json['name']) : null;
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  // }

  TownsModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  
  if (json['name'] is Map<String, dynamic>) {
    name = Name.fromJson(json['name']);
  } else {
    // Handle the case where 'name' is a String
    name = Name(en: json['name'], ar: ''); // You might need to handle 'ar' differently
  }

  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
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