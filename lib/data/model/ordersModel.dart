class OrdersModel {
  int? id;
  // int? dayId;
  // String? dayName;
  int? driverId;
  String? driverName;
  String? totalJars;

  int? customerId;
  String? customerName;

  int? townId;
  String? townName;

  int? districtId;
  String? districtName;

  int? sereptaId;
  String? sereptaName;

  // int? bottelId;
  // String? bottelName;
  // int? qtyOfBottels;
  // double? pricePerBottel;
  // double? totalpriceOfBottels;
  int? qtyJarIn;
  int? qtyJarOut;
  int? qtyPreviousJars;
  int? totalJar; // كميه الجرائر المعبئه بالفان يوميا
  double? pricePerJar;
  double? totalpriceOfJars;

  String? status;

  double? oldDebt; // ==> ديون سابقه
  double? newDebt; // ==> ديون سابقه


  double? paid; // ==>أدي دفع
  double? totalPrice; // ==> المجموع


  String? createdAt;
  String? updatedAt;


  OrdersModel(
      {this.id,
      // this.dayId,
      // this.dayName,
      this.driverId,
      this.driverName,
      this.totalJars,

      this.customerId,
      this.customerName,

      this.townId,
      this.townName,

      this.districtId,
      this.districtName,

      this.sereptaId,
      this.sereptaName,

      // this.bottelId,
      // this.bottelName,
      // this.pricePerBottel,
      // this.qtyOfBottels,
      // this.totalpriceOfBottels,
      this.qtyJarIn,
      this.qtyJarOut,
      this.qtyPreviousJars,

      this.totalJar,
      this.pricePerJar,
      this.totalpriceOfJars,

      this.status,


      this.oldDebt,
      this.newDebt,

      this.paid,
      this.totalPrice,




      this.createdAt,
      this.updatedAt,
      });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // dayId = json['day_id'];
    // dayName = json['day_name'];
    driverId = json['driver_id'];
    driverName = json['driver_name'];

    totalJars = json['totalJars'];


    customerId = json['customer_id'];
    customerName = json['customer_name'];
    
    townId = json['town_id'];
    townName = json['town_name'];

    districtId = json['district_id'];
    districtName = json['district_name'];

    sereptaId = json['serepta_id'];
    sereptaName = json['serepta_name'];


    // bottelId = json['bottle_id'] != null ? int.tryParse(json['bottle_id'].toString()) : null;
    // // bottelId = json['bottle_id'];
    // bottelName = json['bottle_name'];

    
    // pricePerBottel = json['price_per_bottel'] != null ? double.tryParse(json['price_per_bottel'].toString()) : null;
    // qtyOfBottels =  json['qty_of_bottles'] != null ? int.tryParse(json['qty_of_bottles'].toString()) : null;
    // totalpriceOfBottels = json['tolal_price_bottel'] != null ? double.tryParse(json['tolal_price_bottel'].toString()) : null;

    qtyJarIn = json['qty_jar_in'] != null ? int.tryParse(json['qty_jar_in'].toString()) : null;
    qtyJarOut = json['qty_jar_out'] != null ? int.tryParse(json['qty_jar_out'].toString()) : null;
    qtyPreviousJars = json['qty_previous_jars'] != null ? int.tryParse(json['qty_previous_jars'].toString()) : null;

    totalJar = json['total_jar'] != null ? int.tryParse(json['total_jar'].toString()) : null;
    pricePerJar = json['srpta_price_Lira'] != null ? double.tryParse(json['srpta_price_Lira'].toString()) : null;
    totalpriceOfJars = json['total_price_jars'] != null ? double.tryParse(json['total_price_jars'].toString()) : null;


    
    oldDebt = json['old_debt'] != null ? double.tryParse(json['old_debt'].toString()) : null;
    newDebt = json['new_debt'] != null ? double.tryParse(json['new_debt'].toString()) : null;

    paid = json['paid'] != null ? double.tryParse(json['paid'].toString()) : null;
    totalPrice = json['total_price'] != null ? double.tryParse(json['total_price'].toString()) : null;
   




    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // data['day_id'] = this.dayId;
    data['driver_id'] = this.driverId;
    data['driver_name'] = this.driverName;

    data['totalJars'] = this.totalJars;


    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;

    data['town_id'] = this.townId;
    data['town_name'] = this.townName;

    data['district_id'] = this.districtId;
    data['district_name'] = this.districtName;

    data['serepta_id'] = this.sereptaId;
    data['serepta_name'] = this.sereptaName;

    // data['bottle_id'] = this.bottelId;
    // data['price_per_bottel'] = this.pricePerBottel;
    // data['qty_of_bottles'] = this.qtyOfBottels;
    // data['tolal_price_bottel'] = this.totalpriceOfBottels;
    data['qty_jar_in'] = this.qtyJarIn;
    data['qty_jar_out'] = this.qtyJarOut;
    data['qty_previous_jars'] = this.qtyPreviousJars;
    data['total_jar'] = this.totalJar;
    data['srpta_price_Lira'] = this.pricePerJar;
    data['total_price_jars'] = this.totalpriceOfJars;

    data['status'] = this.status;


    data['old_debt'] = this.oldDebt;
    data['new_debt'] = this.newDebt;

    data['paid'] = this.paid;
    data['total_price'] = this.totalPrice;



    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    
    return data;
  }
}








