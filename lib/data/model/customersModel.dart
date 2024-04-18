import 'dart:convert';

class CustomersModel {
  int? id;
  Map<String, String>? name; // Change type to Map<String, String>
  String? phone;
  int? townId;
  String? townNameAr;
  String? townNameEn;
  int? districtId;
  String? districtNameAr;
  String? districtNameEn;
  int? driverId;
  String? driverNameAr;
  String? driverNameEn;
  String? createdAt;
  String? updatedAt;

  CustomersModel(
      {this.id,
      this.name,
      this.phone,
      this.townId,
      this.townNameAr,
      this.townNameEn,
      this.districtId,
      this.districtNameAr,
      this.districtNameEn,
      this.driverId,
      this.driverNameAr,
      this.driverNameEn,
      this.createdAt,
      this.updatedAt});

  CustomersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // name = json['name'] != null ? new Name.fromJson(json['name']) : null;

      // Parse the 'name' field from string to Map<String, String>
  if (json['name'] is String) {
    // If 'name' is a string, parse it as JSON
    name = Map<String, String>.from(jsonDecode(json['name']));
  } else {
    // If 'name' is already a map, directly assign it
    name = Map<String, String>.from(json['name']);
  }



    phone = json['phone'];
    townId = json['town_id'];
    townNameAr = json['town_name_ar'];
    townNameEn = json['town_name_en'];
    districtId = json['district_id'];
    districtNameAr = json['district_name_ar'];
    districtNameEn = json['district_name_en'];
    driverId = json['driver_id'];
    driverNameAr = json['driver_name_ar'];
    driverNameEn = json['driver_name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    
    data['name'] = this.name;

    data['phone'] = this.phone;
    data['town_id'] = this.townId;
    data['town_name_ar'] = this.townNameAr;
    data['town_name_en'] = this.townNameEn;
    data['district_id'] = this.districtId;
    data['district_name_ar'] = this.districtNameAr;
    data['district_name_en'] = this.districtNameEn;
    data['driver_id'] = this.driverId;
    data['driver_name_ar'] = this.driverNameAr;
    data['driver_name_en'] = this.driverNameEn;
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