class CustomerOrderModel {
  int? id;
  int? driverId;
  String? driverNameAr;
  String? driverNameEn;
  int? customerId;
  String? customerNameAr;
  String? customerNameEn;
  int? townId;
  String? townNameAr;
  String? townNameEn;
  int? districtId;
  String? districtNameAr;
  String? districtNameEn;
  int? sereptaId;
  String? sereptaNameAr;
  String? sereptaNameEn;
  String? srptaPriceLira;
  String? srptaPriceDollar;
  String? createdAt;
  String? updatedAt;

  CustomerOrderModel(
      {this.id,
      this.driverId,
      this.driverNameAr,
      this.driverNameEn,
      this.customerId,
      this.customerNameAr,
      this.customerNameEn,
      this.townId,
      this.townNameAr,
      this.townNameEn,
      this.districtId,
      this.districtNameAr,
      this.districtNameEn,
      this.sereptaId,
      this.sereptaNameAr,
      this.sereptaNameEn,
      this.srptaPriceLira,
      this.srptaPriceDollar,
      this.createdAt,
      this.updatedAt});

  CustomerOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
    driverNameAr = json['driver_name_ar'];
    driverNameEn = json['driver_name_en'];
    customerId = json['customer_id'];
    customerNameAr = json['customer_name_ar'];
    customerNameEn = json['customer_name_en'];
    townId = json['town_id'];
    townNameAr = json['town_name_ar'];
    townNameEn = json['town_name_en'];
    districtId = json['district_id'];
    districtNameAr = json['district_name_ar'];
    districtNameEn = json['district_name_en'];
    sereptaId = json['serepta_id'];
    sereptaNameAr = json['serepta_name_ar'];
    sereptaNameEn = json['serepta_name_en'];
    srptaPriceLira = json['srpta_price_Lira'];
    srptaPriceDollar = json['srpta_price_Dollar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver_id'] = this.driverId;
    data['driver_name_ar'] = this.driverNameAr;
    data['driver_name_en'] = this.driverNameEn;
    data['customer_id'] = this.customerId;
    data['customer_name_ar'] = this.customerNameAr;
    data['customer_name_en'] = this.customerNameEn;
    data['town_id'] = this.townId;
    data['town_name_ar'] = this.townNameAr;
    data['town_name_en'] = this.townNameEn;
    data['district_id'] = this.districtId;
    data['district_name_ar'] = this.districtNameAr;
    data['district_name_en'] = this.districtNameEn;
    data['serepta_id'] = this.sereptaId;
    data['serepta_name_ar'] = this.sereptaNameAr;
    data['serepta_name_en'] = this.sereptaNameEn;
    data['srpta_price_Lira'] = this.srptaPriceLira;
    data['srpta_price_Dollar'] = this.srptaPriceDollar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}