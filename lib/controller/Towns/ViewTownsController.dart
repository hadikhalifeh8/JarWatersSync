import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/core/class/statusRequest.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/core/functions/handlingDataController.dart';
import 'package:jar_waters/core/functions/sqldb.dart';
import 'package:jar_waters/data/datasource/remote/towns_data.dart';
import 'package:jar_waters/data/model/TownssModel.dart';
import 'package:jar_waters/data/model/townsModel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sqflite/sqflite.dart';

class ViewTownssController extends GetxController{
 
  SqlDb sqlDb = SqlDb();
  List<TownssModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  TownssModel? townsModel;
  TownsData townsData = TownsData(Get.find());



  //    getData() async {

  //     data.clear(); //insert بس إعمل  update بمحي المعلومات القديه وبعمل 
    
  //    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)

  //    update(); //insert بس إعمل  update بمحي المعلومات القديه وبعمل 



  //    var response = await townsData.getData(); //loading هون خلص 

  //    print("***************##############************* Controler $response ");
  //    statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

  //    if(StatusRequest.success == statusRequest)
  //    {
  //     if(response['status'] == "success")
  //     {
       
  //      //  data.addAll(response['data']);
  //      List datalist = response['data'];
  //      data.addAll(datalist.map((e) => TownssModel.fromJson(e)));
        
  //     }
  //     else{
  //       statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
  //     }
  //    }
     
  //     update(); // Refresh 
  //  }






getDataFromOnlineToOffLine() async {
  data.clear(); // Clear the list before fetching data
  statusRequest = StatusRequest.loading;
  update();

  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    // No internet connection, retrieve data from Sqflite
    List<Map<String, dynamic>> offlineData = await sqlDb.getAllData('towns');
    if (offlineData.isNotEmpty) {
       data.clear();
      data.addAll(offlineData.map((e) => TownssModel.fromJson(e)));
      statusRequest = StatusRequest.success;
      print("Success has a data offline");
       print({{"$offlineData"}});
    } else {
      statusRequest = StatusRequest.failure; // Handle case when there's no data offline
      print("There is no data offline");
    }
    update();
    return;
  }

  var response = await townsData.getData();
  statusRequest = handlingData(response);

  if (StatusRequest.success == statusRequest) {
if (response['status'] == "success") {
  List datalist = response['data'];
  List<TownssModel> townssList = datalist.map((e) => TownssModel.fromJson(e as Map<String, dynamic>)).toList();
  data.addAll(townssList);

  // Iterate over the data and insert into the SQLite database
  await sqlDb.syncData('towns', townssList.map((e) => e.toJson()).toList(), ConflictAlgorithm.replace);
} else {
  statusRequest = StatusRequest.failure;
}
  }

  update();
}









  @override
  void onInit() {
   //getData();
   getDataFromOnlineToOffLine();
    super.onInit();
  }
}