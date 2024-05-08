import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/DriverOrders/addController.dart';
import 'package:jar_waters/core/class/statusRequest.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/core/functions/handlingDataController.dart';
import 'package:jar_waters/core/functions/sqldb.dart';
import 'package:jar_waters/core/services/services.dart';
import 'package:jar_waters/data/datasource/remote/driverOrders_data.dart';
import 'package:jar_waters/data/model/driversModel.dart';
import 'package:jar_waters/data/model/ordersModel.dart';


class ViewOrdersController extends GetxController {

  DriversOrdersData driversOrdersData = DriversOrdersData(Get.find());


  SqlDb sqlDb = SqlDb();
  Myservices myservices = Get.find();


List<OrdersModel> orders = [];
 OrdersModel? ordersModel;

 List<DriversModel> drivers = [];
 DriversModel? driversModel;


StatusRequest statusRequest = StatusRequest.none;


bool isSearch = false;
TextEditingController search = TextEditingController();
//String searchText ="";
FocusNode focusNode = FocusNode();



 TextEditingController numberOfJarsLoad = TextEditingController();
 TextEditingController returnedjars = TextEditingController();
// TextEditingController jarsOut = TextEditingController();




//search بس يضغط على زر ال 
onSearchFunc() {
  isSearch = !isSearch;
  search.clear();
  readData();
  print("isSearch = $isSearch");

  update();
}



onSearchChanged(String value) {
  search.text = value.toLowerCase(); // Ensure consistency in case
  print("Search text: ${search.text}");

  if (search.text.isEmpty) {
    // If search text is empty, reset the list to its original state
    orders.clear();
    readData(); // Assuming originalOrders contains the full list
  } else {
    // Perform filtering based on the search text
    myFilterOrders();
  }
  update();
}


myFilterOrders() {
  if (search.text.isEmpty) {
    // If search text is empty, show all orders
    orders = List.from(orders);
  } else {
    List<OrdersModel> filteredOrders = orders
        .where((order) =>
            order.customerName!
                .toString()
                .toLowerCase()
                .contains(search.text.toLowerCase()))
        .toList();

    if (filteredOrders.isEmpty && isSearch) {
      update();
      // If no matching orders found, show all orders
     orders.clear();
    print("nooooo data+++++++++++++++++");

    // return  statusRequest = StatusRequest.failure;
  

     readData();
    } else {
      orders = filteredOrders;
    }
    //update();
   // orders.clear();
    orders = List.from(filteredOrders);
    
    print("yess has  data +++++++++++++++++");

  }
  update();
}




  Future readData() async{
    orders.clear(); // for delete refresh
    statusRequest = StatusRequest.loading;
     update();

   

    // List<Map> response = await sqlDb.readData("SELECT * FROM district WHERE id = ");
    List<Map> response = await sqlDb.readData(''' 
       SELECT
        orders.id,
        orders.driver_id,
        orders.driver_name,
        orders.totalJars,

        
        orders.customer_id,
        orders.customer_name,
        
        orders.town_id,
        orders.town_name,
       
        orders.district_id,
        orders.district_name,
        
        orders.serepta_id,
        orders.serepta_name,

        
       
        orders.srpta_price_Lira,
        orders.srpta_price_Dollar,


      

        orders.qty_jar_in, orders.qty_jar_out, orders.qty_previous_jars, orders.total_jar,
        orders.price_per_jar, orders.total_price_jars,
        orders.old_debt, orders.new_debt,
        orders.paid, orders.total_price

 
         FROM orders
           JOIN drivers ON orders.driver_id = drivers.id
           WHERE orders.driver_id = "${myservices.sharedPreferences.getString("id").toString()}" 
        ''');


      print("***************##############************* Controler $response ");


           statusRequest = handlingData(response);
           if(StatusRequest.success == statusRequest)
           {
             if(response.isNotEmpty)
             {
                    List listOrders  = response;
            
            orders.addAll(listOrders.map((e) => OrdersModel.fromJson(e)));

        //            for(int i = 0; i < orders.length ; i++)
        //  {
        //   numberOfJarsLoad.text =orders[i].totalJars.toString();

        //  }
                      
                     
                   update();   
                   Get.toNamed(AppRoute.ordersViewBydriverid).toString();
                   search.clear();
                isSearch;
                  
 
                      print("yes has data  =====90");
                        return response;
             }else{
               print("No data =====90");
              //  update();  
  //  Get.toNamed(AppRoute.ordersViewBydriverid);
      // statusRequest = StatusRequest.failure;
 //  Get.defaultDialog(title: "Warning", middleText: "An error occurred while adding data");

    
    

             }
            
           }
            print("=======nos datas");
           update();
            

  }

  

    logout()
  {
   myservices.sharedPreferences.clear(); // null 
   Get.offAllNamed(AppRoute.homeOrdersPagess);
  }

  //   removeData() async {
  

  //       int response = await sqlDb.deleteData
  //                ('''
  //                   DELETE  FROM orders WHERE id = 10
                   
  //               ''');
  //            if(response > 0) {

             
             
  //           //  update();


  //          //   print("========***** DELETED $response + $id_");
  //            //  readData();
              
              
  //             Get.snackbar("success", "Data Deleted", backgroundColor: Colors.red,colorText: Colors.white);
           
  //             return response; 
            
  //            }else{
            

  //            } 
  
  // //  update();
  // //    return  statusRequest = StatusRequest.failure;

            
             
  // }


    goToaddPage()
  {
    Get.toNamed(AppRoute.orderadd);
    
  }

      goToadminPage()
  {
    Get.toNamed(AppRoute.homeAdminPagess);
    
  }


        goToDriversJarsCalcualtePage(OrdersModel ordersModel)
  {
    Get.toNamed(AppRoute.driversCalculateJarss, arguments: {'ordersModels_' : ordersModel});
    
  }



   goToEditOrderPage(OrdersModel ordersModel)
  {
    Get.toNamed(AppRoute.orderedits,
          
             arguments: {
              'ordersModel_' : ordersModel
    });
           
  }











  //////////////////////////SYNDATA FROM OFFLINE TO ON LINE/////////////////////////////
  
      // Sync Data from sqflite to mysql Database
      syncData() async {
       

          for(int i = 0; i < orders.length ; i++)
          {
            Map datas ={
                   "id" : orders[i].id.toString(),

                   "driver_id" :orders[i].driverId.toString(),
                   "driver_name" : orders[i].driverName.toString(),

                   "customer_id" : orders[i].customerId.toString(),
                   "customer_name" :orders[i].customerName.toString(),

                   "town_id" : orders[i].townId.toString(),
                   "town_name" :orders[i].townName.toString(),

                   "district_id" : orders[i].districtId.toString(),
                   "district_name" :orders[i].districtName.toString(),

                   "serepta_id" : orders[i].sereptaId.toString(),
                   "serepta_name" :orders[i].sereptaName.toString(),

                    "srpta_price_Lira" : orders[i].pricePerJar.toString(),

                   "qty_jar_in" :orders[i].qtyJarIn.toString(),
                   "qty_jar_out" :orders[i].qtyJarOut.toString(),
                   "qty_previous_jars" :orders[i].qtyPreviousJars.toString(),
                   "total_jar" :orders[i].totalJar.toString(),
                   "total_price_jars" :orders[i].totalpriceOfJars.toString(),
                   
                   "old_debt" :orders[i].oldDebt.toString(),
                   "new_debt" :orders[i].newDebt.toString(),

                   "paid" :orders[i].paid.toString(),
                   "total_price" :orders[i].totalPrice.toString(),

          };

              

        
        print("-*************** $datas");
      //  await readData();
       var response =  await driversOrdersData.syncronizeData(datas);
     
       print("***************##############************* Controler $response ");

     statusRequest = handlingData(response); // get data / or stausRquest (success /serverfailure / connection  failed ... /) 

     if(StatusRequest.success == statusRequest){
         
            if(response['status'] == "success")
      {
        
         Get.snackbar("success", "DATA SYNCED SUCCESSFULLY", backgroundColor: Colors.green,colorText: Colors.white);
    print("Sync successful");
   
     // note.remove(response);

    //to refresh directly when insert data

      }}
      else{
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
     Get.defaultDialog(title: "Warning", middleText: "SYNCED FAILED");

             print("Sync failed");
      }
     }
      }
  

  //////////////////////////SYNDATA FROM OFFLINE TO ON LINE/////////////////////////////










 @override
  void onClose() {
    // Reset isSearch to false when the controller is closed
    isSearch = false;
    super.onClose();
  }



//***************************************RETURNED FILL JARS ********************************************** */

    Future getTotalJarsIN() async {
  update();
    List<Map> response = await sqlDb.readData('''
      SELECT SUM(qty_jar_in) as qty_jar_in
      
       FROM orders

       WHERE 
       driver_id = ${myservices.sharedPreferences.getString("id").toString()}
       AND
       created_at = CURRENT_DATE
       OR
       updated_at = CURRENT_DATE
      
         
      ''');
      // WHERE bottels.id = ${bottelsId.text} 

  if (response.isNotEmpty) {
    orders.clear();

    List listJars = response;
    orders.addAll(listJars.map((e) => OrdersModel.fromJson(e)));
  
       
         for(int i = 0; i < orders.length ; i++)
         {

          AddOrderController controller = Get.put(AddOrderController());


            controller.jarIn.text =orders[i].qtyJarIn.toString();
        //  int jrIns = int.parse(controller.jarIn.text);

        //  int returnedjars_ = int.parse(returnedjars.text);

          returnedjars.text =controller.jarIn.text;

             print("the returnedjars.text is = ${returnedjars.text}");

          //  print("the pricePerJar.text is = ${pricePerJar.text}");

         }
     
      }else{
        print("noooo hasn't jar prices");
       // pricePerBottel.text ="0";
      }
    

update();
     return response;

  }
 



//***************************************RETURNED FILL JARS *********************************** */






   //********************************************************************************* */
   @override
  void onInit() {





   numberOfJarsLoad.text = myservices.sharedPreferences.getString("totalJars").toString();
     print("iiiiiiiiiiiiiiiiii ${numberOfJarsLoad.text}");


         if (returnedjars.text.isNotEmpty) {
      returnedjars = TextEditingController();
    } else {
      returnedjars = TextEditingController(text: '0');
    }



     readData();


    //  getTotalJarsIN();
    //  removeData();
    
    super.onInit();
  }





}