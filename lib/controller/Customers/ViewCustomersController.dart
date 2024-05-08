import 'package:get/get.dart';
import 'package:jar_waters/core/class/statusRequest.dart';
import 'package:jar_waters/core/functions/handlingDataController.dart';
import 'package:jar_waters/core/functions/sqldb.dart';
import 'package:jar_waters/data/datasource/remote/customers_data.dart';
import 'package:jar_waters/data/model/customersModel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sqflite/sqflite.dart';

class ViewCustomersController extends GetxController{
 
  SqlDb sqlDb = SqlDb();
  List<CustomersModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  CustomersModel? customersModel;
  CustomersData customersData = CustomersData(Get.find());






  //    getData() async {

  //     data.clear(); //insert بس إعمل  update بمحي المعلومات القديه وبعمل 
    
  //    statusRequest = StatusRequest.loading;  // 1- loading (badda wa2et)

  //    update(); //insert بس إعمل  update بمحي المعلومات القديه وبعمل 



  //    var response = await sereptaData.getData(); //loading هون خلص 

  //    print("***************##############************* Controler $response ");
  //    statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

  //    if(StatusRequest.success == statusRequest)
  //    {
  //     if(response['status'] == "success")
  //     {
       
  //      //  data.addAll(response['data']);
  //      List datalist = response['data'];
  //      data.addAll(datalist.map((e) => SereptaModel.fromJson(e)));
        
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
    List<Map<String, dynamic>> offlineData = await sqlDb.getAllData('customers');
    if (offlineData.isNotEmpty) {
       data.clear();
      data.addAll(offlineData.map((e) => CustomersModel.fromJson(e)));
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

  var response = await customersData.getData();
  statusRequest = handlingData(response);

  if (StatusRequest.success == statusRequest) {
if (response['status'] == "success") {
  List datalist = response['data'];
  List<CustomersModel> customersList = datalist.map((e) => CustomersModel.fromJson(e as Map<String, dynamic>)).toList();
  data.addAll(customersList);
  update();

  // Iterate over the data and insert into the SQLite database
  await sqlDb.syncData('customers', customersList.map((e) => e.toJson()).toList(), ConflictAlgorithm.replace);
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