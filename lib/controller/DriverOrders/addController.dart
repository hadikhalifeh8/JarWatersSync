import 'package:dartz/dartz.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/DriverOrders/viewController.dart';
import 'package:jar_waters/core/class/statusRequest.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/core/functions/handlingDataController.dart';
import 'package:jar_waters/core/functions/sqldb.dart';
import 'package:jar_waters/core/functions/translateDatabase.dart';
import 'package:jar_waters/core/services/services.dart';
import 'package:jar_waters/data/model/CustomerOrders.dart';
import 'package:jar_waters/data/model/SereptaModels.dart';
import 'package:jar_waters/data/model/customersModel.dart';
import 'package:jar_waters/data/model/districtsModel.dart';
import 'package:jar_waters/data/model/driversModel.dart';
import 'package:jar_waters/data/model/ordersModel.dart';
import 'package:jar_waters/data/model/townsModel.dart';


class AddOrderController extends GetxController {

 SqlDb sqlDb = SqlDb();
  Myservices myservices = Get.find();

//  List<DaysModel> day = [];
//  DaysModel? daysModel;
//    String? dayid;

// List<DriversModel> drivers = [];
//  DriversModel? driversModel;
//     String? driverid;


//  TextEditingController qtyOfBottels_ = TextEditingController(text: "0");
//  TextEditingController pricePerBottel_ = TextEditingController(text: "0");
//  String? totalPriceOfBottels_= "0";

 String? qtyOfJarIn_= "0";
 String? qtyOfJarOut_= "0";
 String? taltalQtyOfJars_= "0";
 String? pricePerJar_= "0";
 String? totalPriceOfJars_= "0";

 






  GlobalKey<FormState> formState = GlobalKey<FormState>();

  List<OrdersModel> orders = [];

  // List<CustomersModel> customers = [];
  // CustomersModel? customersModel;

    List<CustomerOrderModel> customerOrders = [];
  CustomerOrderModel? customerOrderModel;


  // List<TownsModel> towns = [];

  // List<DistrictsModel> districts = [];


  // List<SereptaModel> jar = [];
  // SereptaModel? sereptaModel;

  // List<BottelsModel> bottels = [];
  //  BottelsModel? bottelsModel;
  

  List<SelectedListItem> dropdownListOFCustomers = [];
   List<SelectedListItem> dropdownListOFTowns = [];
  List<SelectedListItem> dropdownListOFDistricts = [];


 
  List<SelectedListItem> dropdownListOFCompanies = [];
  // List<SelectedListItem> dropdownListOFBottels = [];



  StatusRequest statusRequest = StatusRequest.none;







  TextEditingController dropdownCustomersName = TextEditingController();
  TextEditingController dropdownCustomersId = TextEditingController();

  // TextEditingController dropdownTownsName = TextEditingController();
  // TextEditingController dropdownTownsId = TextEditingController();


  // TextEditingController dropdownDistrictsName = TextEditingController();
  // TextEditingController dropdownDistrictsId = TextEditingController();



  // TextEditingController dropdownCompaniesName = TextEditingController();
  // TextEditingController dropdownCompaniesId = TextEditingController();

  // TextEditingController dropdownBottelsName = TextEditingController();
  // TextEditingController dropdownBottelsId = TextEditingController();

  TextEditingController driverName = TextEditingController();  
  TextEditingController driverId = TextEditingController();

  TextEditingController customerName = TextEditingController();  
  TextEditingController customerId = TextEditingController();

  TextEditingController townId = TextEditingController();  
  TextEditingController townName = TextEditingController();


  TextEditingController districtId = TextEditingController();  
  TextEditingController districtName = TextEditingController();


  TextEditingController jarsName = TextEditingController();
  TextEditingController jarsId = TextEditingController();

  // TextEditingController  bottelsName = TextEditingController();
  // TextEditingController  bottelsId = TextEditingController();



  // TextEditingController qtyOfBottles = TextEditingController();
  // TextEditingController pricePerBottel = TextEditingController();
  // TextEditingController totalPriceBottel = TextEditingController();

  TextEditingController sumJarIn = TextEditingController();



  TextEditingController jarIn = TextEditingController();
  TextEditingController jarOut = TextEditingController();
  TextEditingController qtyPreviousOFJars = TextEditingController();

  TextEditingController totalJars = TextEditingController();

  TextEditingController pricePerJar = TextEditingController();
  TextEditingController totalPriceJars = TextEditingController();

    TextEditingController oldDebt = TextEditingController();
    TextEditingController newDebt = TextEditingController();

  TextEditingController paid = TextEditingController();

  TextEditingController totalPrice = TextEditingController();







//  bool showContainerA = false;
//  bool showContainerB = false;

//   void toggleContainers(bool showA, bool showB) {
   
//       showContainerA = showA;
//       showContainerB = showB;
//       update();
   
//   }




 // get Customers Data
 Future getCustomersData() async{


       List<Map> response = await sqlDb.readData('''
       SELECT
        customers_orders.id,
        customers_orders.driver_id,
        customers_orders.driver_name_ar,
        customers_orders.driver_name_en,
        customers_orders.customer_id,
        customers_orders.customer_name_ar,
        customers_orders.customer_name_en,
        customers_orders.town_id,
        customers_orders.town_name_ar,
        customers_orders.town_name_en,
        customers_orders.district_id,
        customers_orders.district_name_ar,
        customers_orders.district_name_en,
        customers_orders.serepta_id,
        customers_orders.serepta_name_ar,
        customers_orders.serepta_name_en,
        customers_orders.srpta_price_Lira,
        customers_orders.srpta_price_Dollar 
         FROM customers_orders
           JOIN drivers ON customers_orders.driver_id = drivers.id
           WHERE customers_orders.driver_id = "${myservices.sharedPreferences.getString("id").toString()}"
         
''');


                        
                        

      print("***************##############************* Customers Controler $response ");

       statusRequest = handlingData(response); 

             if(StatusRequest.success == statusRequest)
     {       
            if(response.length > 0)
            {
              // to not get duplicate data for gettownsdata & getdistrictsdata
              customerOrders.clear(); // Clear the list before adding district data

              List listCustomers = response;
            customerOrders.addAll(listCustomers.map((e) => CustomerOrderModel.fromJson(e)));  
            update();

             for(int i = 0; i < listCustomers.length; i++)
       {
          dropdownListOFCustomers.add(SelectedListItem(
                                            // name: customers[i].name.toString(),
                           name: translateDateBase(
                                           customerOrders[i].customerNameAr.toString(),
                                           customerOrders[i].customerNameEn.toString(),
                                ),
                                            value: customerOrders[i].customerId.toString(),
                                            )  
                                            );


                                            
       }
     


       
  if (listCustomers.isNotEmpty) {
        int selectedIndex = dropdownListOFCustomers.indexWhere(
            (element) => element.value == customerId.text);

        if (selectedIndex != -1) {
          townId.text = customerOrders[selectedIndex].townId.toString();
          // townName.text = customers[selectedIndex].townName.toString();
        
          townName.text = translateDateBase(
                      customerOrders[selectedIndex].townNameAr.toString(), 
                     customerOrders[selectedIndex].townNameEn.toString(), );

          districtId.text = customerOrders[selectedIndex].districtId.toString();
         // districtName.text = customers[selectedIndex].districtName.toString();

          districtName.text = translateDateBase(
                      customerOrders[selectedIndex].districtNameAr.toString(), 
                     customerOrders[selectedIndex].districtNameEn.toString(), );

          driverName.text = translateDateBase(
                      customerOrders[selectedIndex].driverNameAr.toString(), 
                     customerOrders[selectedIndex].driverNameEn.toString(), );


          jarsId.text = customerOrders[selectedIndex].sereptaId.toString();
          
          jarsName.text = translateDateBase(
                      customerOrders[selectedIndex].sereptaNameAr.toString(), 
                     customerOrders[selectedIndex].sereptaNameEn.toString(), );

          pricePerJar.text = customerOrders[selectedIndex].srptaPriceLira.toString();   
        


        }
      }
       print("townsId is = ${townId.text}, &&  the districtId is = ${districtId.text}");
       
       update();

            print("yes has customers data");
            return response;
            }
     }
     else{
        print("No data");
        update();
    return  statusRequest = StatusRequest.failure; 
     }
     update();
     print("======= = =fails");
      return  statusRequest = StatusRequest.failure;
  }




    // Add this function to update districts based on the selected town
   onCustomerChanged( String? customerId) async {
    
    
    
    if (customerId != null && customerId.isNotEmpty) {
      dropdownListOFCustomers.clear(); // Clear existing districts
      // resetCustomerDropDown();
      update(); // Update the UI
      // Call getDistrictsData with the selected townId
      // await getTownsData();
      // await getDistrictsData();
      await getCustomersData();
      
      
    }
  }









 //get Bottels Data
//  Future getBottelsData() async{



//             List<Map> response = await sqlDb.readData('''

// SELECT * FROM bottels
//                         ''');
//                         // print("company_id is = ${companiesId.text}");
                        

//       print("***************##############************* Companies Controler $response ");

//        statusRequest = handlingData(response); 

//              if(StatusRequest.success == statusRequest)
//      {       
//             if(response.length > 0)
//             {
//               // to not get duplicate data for gettownsdata & getdistrictsdata
//               bottels.clear(); // Clear the list before adding district data

//               List listBottels = response;
//             bottels.addAll(listBottels.map((e) => BottelsModel.fromJson(e)));  
//             update();

//              for(int i = 0; i < bottels.length; i++)
//        {
//           dropdownListOFBottels.add(SelectedListItem(
//                                             name: bottels[i].name.toString(),
//                                             value: bottels[i].id.toString(),
//                                             )  
//                                             );
//        }
       
//        update();

//             print("yes has bottels data");
//             return response;
//             }
//      }
//      else{
//         print("No data");
//         update();
//     return  statusRequest = StatusRequest.failure; 
//      }
//      update();
//      print("======= = =fails");
//       return  statusRequest = StatusRequest.failure;
//   }


  // Insert Order Data
   insertData() async {

        if (customerId.text.isEmpty) {
  return Get.snackbar("warning", "select a customer",backgroundColor: Colors.red, colorText: Colors.white);
}

//      if (bottelsId.text.isEmpty && jarsId.text.isEmpty) {
//   return Get.snackbar("warning", "choose bottles OR jars",backgroundColor: Colors.red, colorText: Colors.white);
// }

  if (formState.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();



   List<Map> existingrecords = await sqlDb.readData ('''
           SELECT * FROM orders WHERE customer_name = "${customerName.text}" 
                            ''');
          if(existingrecords.isNotEmpty) {
             statusRequest = StatusRequest.failure;
        Get.defaultDialog(title: "Warning".tr, middleText: "name_already_exists".tr);
          }else{






 
 int response = await sqlDb.insertData(''' INSERT INTO orders (
         'driver_id', 'driver_name',
          'customer_id', 'customer_name',
           'town_id', 'town_name',
            'district_id', 'district_name',
            'serepta_id', 'serepta_name',
        'qty_jar_in', 'qty_jar_out', 'qty_previous_jars', 'total_jar',
         'srpta_price_Lira',
          'total_price_jars', 'old_debt', 'new_debt', 'paid', 'total_price')
          VALUES("${myservices.sharedPreferences.getString("id").toString()}", "${driverName.text}",
          "${customerId.text}", "${customerName.text}",
           "${townId.text}", "${townName.text}",
            "${districtId.text}", "${districtName.text}",
             "${jarsId.text}", "${jarsName.text}",
           "${jarIn.text}", "${jarOut.text}", "${qtyPreviousOFJars.text}", "${totalJars.text}",
           "${pricePerJar.text}", "${totalPriceJars.text}", "${oldDebt.text}", "${newDebt.text}", 
           "${paid.text}","${totalPrice.text}"
          )
        ''');

        statusRequest = handlingData("// $response //"); 

        if (StatusRequest.success == statusRequest) {
          if (response > 0) {
           
            ViewOrdersController controller = Get.put(ViewOrdersController());
            print("*---------=== success + $response");
            controller.readData();
            // Get.offAllNamed(AppRoute.ordersHomePage);
            Get.offAllNamed(AppRoute.ordersViewBydriverid);


          //   // Calculate the sum of jarIn
          // // int sumOfJars = int.parse(jarIn.text) + int.parse(sumJarIn.text);

          //   int jarIn_ = int.parse(jarIn.text);
          //   int sumOfJars_ = int.parse(sumJarIn.text) ;
          
          // int sumJarIn_ = jarIn_ + sumOfJars_;
          // sumJarIn.text = sumJarIn_.toString();


          // print("the sumOfJars is ${sumJarIn.text}");


            //  Get.back();


            Get.rawSnackbar(
              titleText:  Text("Success".tr, style:const TextStyle(color: Colors.white)),
              messageText:  Text("Data_added_Successfully".tr, style:const TextStyle(color: Colors.white)),
              backgroundColor: Colors.green.shade400,
            );
          } else {
            print("Status.FAILED");
            statusRequest = StatusRequest.failure;
            Get.defaultDialog(title: "Warning", middleText: "An error occurred while adding data");
          }
        }
      
      update();
    } 
    update(); 
        }
        

     print("------------- failed");
  
}


//**************************************START FOR BOTTELS CALCULATIONS*********************************** */

//   void resetBottelPerPrice() {
// //      if(pricePerBottel.text.isEmpty || bottelsId.text.isEmpty)
// //  {
// // pricePerBottel.text = "0";
// //  }else{
// //   pricePerBottel.text = pricePerBottel.text;
// //  }
// pricePerBottel.text = "0";

// }
//   void resetTotalPriceANDQTYOFBottels() {

//  if(qtyOfBottles.text.isEmpty && totalPriceBottel.text.isEmpty && bottelsId.text.isEmpty)
//  {
//     qtyOfBottles.text = "0";
//     totalPriceBottel.text = "0";
//  }else{
//   qtyOfBottles.text = qtyOfBottles.text;
//   totalPriceBottel.text = totalPriceBottel.text;
//  }

// }



  onBottlesChanged(String? bottelsId) async {
    
  if (bottelsId != null && bottelsId.isNotEmpty) {

   // resetTotalPriceANDQTYOFBottels();
    // getPricePerBottelData();
    // getTotalPriceOfBottelData();
    getTotalPriceOrder();
    // getDebtValue();
     

    update();
  }
}



// Future getPricePerBottelData() async {
//   update();
//     List<Map> response = await sqlDb.readData('''
//       SELECT * FROM bottels
         
//          WHERE bottels.id = ${bottelsId.text} 
//       ''');

//   if (response.length>0) {
//     bottels.clear();

//     List listbottels = response;
//     bottels.addAll(listbottels.map((e) => BottelsModel.fromJson(e)));
  
       
//          for(int i = 0; i < bottels.length ; i++)
//          {
//           pricePerBottel.text =bottels[i].price.toString();
//             print("yehoooo has bottels prices");
//          }
//       update();
//       }else{
//         print("noooo hasn't bottels prices");
//         pricePerBottel.text ="0";
//       }
    

// update();
//      return response;

//   }



//       Future getTotalPriceOfBottelData() async {
//   update();
//     List<Map> response = await sqlDb.readData('''
//       SELECT * FROM bottels
                 
//          WHERE bottels.id = ${bottelsId.text}
//       ''');

//   if (response.length>0) {
//     bottels.clear();

//     List listbottels = response;
//     bottels.addAll(listbottels.map((e) => BottelsModel.fromJson(e)));
  
       
//          for(int i = 0; i < bottels.length ; i++)
//          {

//       //  totalPriceBottel.text = (int.parse(qtyOfBottles.text) * double.parse(pricePerBottel.text)).toString();
//       //       print("yesssss has bottels totalPriceBottel");

//       if (qtyOfBottles.text != null && qtyOfBottles.text.isNotEmpty) {
//   int quantity = int.parse(qtyOfBottles.text);
//   if (quantity != null) {
//     double price = double.parse(pricePerBottel.text);
//     if (price != null) {
//       totalPriceBottel.text = (quantity * price).toStringAsFixed(2);
//     } 
//   } 
// } 

// //  }




//          }
//       update();
//       }else{
//         print("noooo hasn't bottels totalPriceBottel");
//         totalPriceBottel.text ="0";
//       }
    

// update();
//      return response;

//   }


//**************************************END FOR BOTTELS CALCULATIONS************************************* */




//**************************************START FOR JARS CALCULATIONS************************************** */



  // Future getJarsData() async {
  //   jar.clear();
  //   update();
  //   statusRequest =StatusRequest.loading;
     

  //   List<Map> response = await sqlDb.readData("SELECT * FROM serepta");
       

  //     print("***************##############************* Controler $response ");
    
  //    statusRequest = handlingData(response); 


  //    if(StatusRequest.success == statusRequest)
  //    {
       
  //           if(response.length > 0)

  //      {
  //           List listJars = response;
  //   jar.addAll(listJars.map((e) => SereptaModel.fromJson(e)));
  //    update();
  // print("yes has jars data");
  //   return response;
    
        
  //      }else{
  //       print("No data for jars");
  //       update();
  //   return  statusRequest = StatusRequest.failure;
  

  //    }
     
  //    }
  //    print("=======nos datas");
  // update();

   
  // }








  void resetTotalPriceANDQTYSOFJARS() {

 if(jarIn.text.isEmpty && jarOut.text.isEmpty && qtyPreviousOFJars.text.isEmpty)

 {
    jarIn.text = "0";
    jarOut.text = "0";
    qtyPreviousOFJars.text = "0";

   // totalPriceJars.text = "0";
    
 }else{

      jarIn.text = jarIn.text;
      jarOut.text = jarOut.text;
      qtyPreviousOFJars.text = qtyPreviousOFJars.text ;

    //  totalPriceJars.text =totalPriceJars.text;
     }

    
  }




//   void resetJarPerPrice() {
// pricePerJar.text = "0";

// }



    // Add this function to update the price based on the selected bottle
    onBottlesFORJARChanged(String jarid) async {

    if (jarid != null && jarid.isNotEmpty) {

      
    //  resetBottelPerPrice();
      resetTotalPriceANDQTYSOFJARS();
      // getPricePerJarData();
      
      getTotalQTYOFJARSSData();
      getTotalPriceOfJARData();
      getTotalPriceOrder();
     getDebtValue();
     
    // getJarsData();
       update(); // Update the UI
      
     }
  }




//     Future getPricePerJarData() async {
//   update();
//     List<Map> response = await sqlDb.readData('''
//       SELECT * FROM jars
      
         
//       ''');
//       // WHERE bottels.id = ${bottelsId.text} 

//   if (response.isNotEmpty) {
//     jar.clear();

//     List listJars = response;
//     jar.addAll(listJars.map((e) => SereptaModel.fromJson(e)));
  
       
//          for(int i = 0; i < jar.length ; i++)
//          {
//            jarsId.text =jar[i].id.toString();

//           pricePerJar.text =jar[i].priceLira.toString();

//              print("the JarId.text is = ${jarsId.text}");

//             print("the pricePerJar.text is = ${pricePerJar.text}");

//          }
     
//       }else{
//         print("noooo hasn't jar prices");
//        // pricePerBottel.text ="0";
//       }
    

// update();
//      return response;

//   }




  Future getTotalPriceOfJARData() async {
    update();
    List<Map> response = await sqlDb.readData('''
      SELECT * FROM customers_orders
        
      ''');

      // WHERE bottels.id = ${bottelsId.text}

  if (response.isNotEmpty) {
    customerOrders.clear();

    List listJars = response;
    customerOrders.addAll(listJars.map((e) => CustomerOrderModel.fromJson(e)));
  
       
         for(int i = 0; i < customerOrders.length ; i++)
         {
          jarsId.text =customerOrders[i].sereptaId.toString();
          jarsName.text = translateDateBase(
                               customerOrders[i].sereptaNameAr.toString(),
                                customerOrders[i].sereptaNameEn.toString(),
                                );
                   
    //  totalPriceJars.text = (int.parse(jarIn.text) * double.parse(pricePerJar.text)).toString();
    //         print("yesssss has jars totalPriceJar");


      if (jarIn.text.isNotEmpty && pricePerJar.text.isNotEmpty) {
      
      int jrIns_ = int.parse(jarIn.text);

     double pricePerJarS_ = double.parse(pricePerJar.text);

     totalPriceJars.text = (jrIns_ * pricePerJarS_).toStringAsFixed(2);
  


     print("the totalPriceJars.text is = ${totalPriceJars.text}");
 
         } 

         }
      update();
      }else{
        print("noooo hasn't totalPriceJar");
        totalPriceJars.text ="044";
      }
    

update();
     return response;

  }




   Future getTotalQTYOFJARSSData() async {
    update();
    List<Map> response = await sqlDb.readData('''
      SELECT * FROM customers_orders

      ''');
      
        //  WHERE bottels.id = ${bottelsId.text}

  if (response.length>0) {
    customerOrders.clear();

    List listJars = response;
    customerOrders.addAll(listJars.map((e) => CustomerOrderModel.fromJson(e)));
  
       
         for(int i = 0; i < customerOrders.length ; i++)
         {
        //  pricePerBottel.text =jar[i].price.toString();

    //  totalJars.text = (int.parse(jarIn.text) + int.parse(qtyPreviousOFJars.text)- int.parse(jarOut.text)).toString();
    //         print("yesssss has jars totalJars");

  if (jarIn.text.isNotEmpty && jarOut.text.isNotEmpty && qtyPreviousOFJars.text.isNotEmpty) {
     
      int jrIns = int.parse(jarIn.text);

      int jrOuts = int.parse(jarOut.text);

      int prevJars = int.parse(qtyPreviousOFJars.text);

      totalJars.text = (jrIns - jrOuts + prevJars).toString();


        
          } 

         }
      update();
      }
      else{
        print("noooo hasn't jars totalJars");
        totalPriceJars.text ="0";
      }
    

update();
     return response;

  } 





     Future getTotalPriceOrder() async {
    update();
    List<Map> response = await sqlDb.readData('''
      SELECT * FROM customers_orders      
         
      ''');
        //  WHERE bottels.id = ${bottelsId.text} 
        //  WHERE bottels.id = "${bottelsId.text}" AND jars.id = "${jarsId.text}"

  if (response.length>0) {
    customerOrders.clear();

    List listJars = response;
    customerOrders.addAll(listJars.map((e) => CustomerOrderModel.fromJson(e)));
  
       
        //  for(int i = 0; i < listJars.length ; i++)
        //  {
        //  pricePerBottel.text =bottels[i].price.toString();

    //  totalPrice.text = (double.parse(totalPriceBottel.text) + double.parse(totalPriceJars.text)).toString();
    //         print("yesssss has jars totalJars");
// if (totalPriceBottel.text.isNotEmpty && totalPriceJars.text.isNotEmpty) {
if (totalPriceJars.text.isNotEmpty) {

   // double totalPriceBottels_ = double.parse(totalPriceBottel.text);
    double totalPriceJars_ = double.parse(totalPriceJars.text);

    // totalPrice.text = (totalPriceBottels_ + totalPriceJars_).toStringAsFixed(2);
    totalPrice.text = (totalPriceJars_).toStringAsFixed(2);

    print("the totalPrice.text is = ${totalPrice.text}");
    update();

} else if (totalPriceJars.text.isNotEmpty) {
    double totalPriceJars_ = double.parse(totalPriceJars.text);
    totalPrice.text = (totalPriceJars_).toStringAsFixed(2);
    update();

} 
// else if (totalPriceBottel.text.isNotEmpty) {
//     double totalPriceBottels_ = double.parse(totalPriceBottel.text);
//     totalPrice.text = (totalPriceBottels_).toStringAsFixed(2);
//     update();
// }
      // update();
      }else{
        print("noooo Total Price");
        totalPrice.text ="0";
      }
    

    update();
     return response;

  } 
//**************************************End FOR JARS CALCULATIONS************************************** */



 Future getDebtValue() async{
 //debt.text = "78";

    update();
    List<Map> response = await sqlDb.readData('''
     SELECT * FROM customers_orders
      
         
      ''');
      
//  if (response.isNotEmpty) {

    orders.clear();

    List listOrders = response;
    orders.addAll(listOrders.map((e) => OrdersModel.fromJson(e)));

    

    if (totalPrice.text.isNotEmpty && paid.text.isNotEmpty) {

       double totalPrice_ = double.parse(totalPrice.text);
       double paid_= double.parse(paid.text);

       oldDebt.text = (totalPrice_ - paid_).toStringAsFixed(2);
       print("the debt is = ${oldDebt.text}");
       update();

        } 
        else if(totalPrice.text.isNotEmpty) {

          double totalPrice_ = double.parse(totalPrice.text);
          // debt.text = (totalPrice_ - totalPrice_).toString();
          // update();

        }
        else if(paid.text.isNotEmpty) {
           
          double paid_= double.parse(paid.text);
          // debt.text = (paid_ - paid_).toString();
          // update();

        }


//  }else{
//    print("noooo hasnt debt");
//       //  debt.text ="0";

//  }
 update();
 return response;
 }


 






  // removeData() async {
  

  //       int response = await sqlDb.deleteData
  //                ('''
  //                   DELETE * FROM orders 
                   
  //               ''');
  //            if(response > 0) {

             
             
  //           //  update();


  //          //   print("========***** DELETED $response + $id_");
  //          //    readData();
              
              
  //             Get.snackbar("success", "Data Deleted", backgroundColor: Colors.red,colorText: Colors.white);
           
  //             return response; 
            
  //            }else{
            

  //            } 
  
  // //  update();
  // //    return  statusRequest = StatusRequest.failure;

            
             
  //  }
  


  logout()
  {
    
       // String userid = myservices.sharedPreferences.getString("id").toString();

//     FirebaseMessaging.instance.unsubscribeFromTopic("users"); // لكل المستخدمين
//     FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}"); // خاص Topic إلو  user  كل // firebase topic for specific user
// print("{Logoout User id is : $userid}");

   myservices.sharedPreferences.clear(); // null 
   Get.offAllNamed(AppRoute.driverLogin);
  }



  @override
  void onInit() {
  //  daysModel = Get.arguments['daysModel_'];


   // customersModel = Get.arguments['customersModel_']; // From View Customer

   getCustomersData();
  //  getCompaniesData();
  //  getBottelsData();
    // getJarsData();


   
  //  removeData();

  




    // qtyOfBottles= TextEditingController();
    // pricePerBottel = TextEditingController();
    // totalPriceBottel = TextEditingController();


    jarIn= TextEditingController();
    jarOut = TextEditingController();
    // qtyPreviousOFJars = TextEditingController();

    // totalJars= TextEditingController();
      if (qtyPreviousOFJars.text.isNotEmpty) {
      qtyPreviousOFJars = TextEditingController();
    } else {
      qtyPreviousOFJars = TextEditingController(text: '0');
    }


 //   qtyPreviousOFJars = qtyPreviousOFJars.text.isNotEmpty ?  TextEditingController() : '0';

  //  totalJars.text.isNotEmpty ? TextEditingController() : 0;
    if (totalJars.text.isNotEmpty) {
      totalJars = TextEditingController();
    } else {
      totalJars = TextEditingController(text: '0');
    }

    pricePerJar= TextEditingController();
    totalPriceJars = TextEditingController();





    townId = TextEditingController(); 
    townName = TextEditingController();

    districtId = TextEditingController(); 
    districtName = TextEditingController();

    driverName = TextEditingController(); 
    driverId = TextEditingController();

    customerName = TextEditingController(); 
    customerId = TextEditingController();




    // dropdownTownsId = TextEditingController();
    // dropdownTownsName = TextEditingController();

    // dropdownDistrictsId = TextEditingController();
    // dropdownDistrictsName = TextEditingController();

    dropdownCustomersName = TextEditingController();
    dropdownCustomersId = TextEditingController();

    // dropdownCompaniesName = TextEditingController();
    // dropdownCompaniesId = TextEditingController();

    jarsName= TextEditingController();
    jarsId= TextEditingController();

    // dropdownBottelsName = TextEditingController();
    // dropdownBottelsId = TextEditingController();

    // bottelsName= TextEditingController();
    // bottelsId= TextEditingController();



    oldDebt = TextEditingController();

    if (newDebt.text.isNotEmpty) {
      newDebt = TextEditingController();
    } else {
      newDebt = TextEditingController(text: '0');
    }


    paid= TextEditingController();



    totalPrice = TextEditingController();

    
          sumJarIn.text = "0";

    super.onInit();
  }



  @override
  void dispose() {
    // qtyOfBottles.dispose();
    // pricePerBottel.dispose();
    // totalPriceBottel.dispose();


    jarIn.dispose();
    jarOut.dispose();



    qtyPreviousOFJars.dispose();
totalJars.dispose();
pricePerJar.dispose();
    totalPriceJars.dispose();





    townId.dispose();
    townName.dispose();

    districtId.dispose();
    districtName.dispose();

    driverName.dispose();
    driverId.dispose();

    customerName.dispose();
    customerId.dispose();

dropdownCustomersName.dispose();
    dropdownCustomersId.dispose();
jarsName.dispose();
    jarsId.dispose();

    // dropdownBottelsName.dispose();
    // dropdownBottelsId.dispose();

    // bottelsName.dispose();
    // bottelsId.dispose();

    oldDebt.dispose();
    newDebt.dispose();
    
    paid.dispose();



    totalPrice.dispose();





    super.dispose();
  }

}