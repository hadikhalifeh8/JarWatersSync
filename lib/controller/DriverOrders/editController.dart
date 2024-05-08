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
import 'package:jar_waters/data/model/ordersModel.dart';


class EditOrderController extends GetxController {

 SqlDb sqlDb = SqlDb();
  Myservices myservices = Get.find();

//  List<DaysModel> day = [];
//   DaysModel? daysModel;


// List<DriversModel> drivers = [];
//  DriversModel? driversModel;

  String? id;
   



  GlobalKey<FormState> formState = GlobalKey<FormState>();

  List<OrdersModel> orders = [];
  OrdersModel? ordersModel;

  // List<CustomersModel> customers = [];
  // CustomersModel? customersModel;


  // List<TownsModel> towns = [];

  // List<DistrictsModel> districts = [];


  // List<JarModels> jar = [];
  // JarModels? jarModels;

  // List<BottelsModel> bottels = [];
  //  BottelsModel? bottelsModel;
  

  // List<SelectedListItem> dropdownListOFCustomers = [];
  //  List<SelectedListItem> dropdownListOFTowns = [];
  // List<SelectedListItem> dropdownListOFDistricts = [];


  // List<SelectedListItem> dropdownListOFBottels = [];



  StatusRequest statusRequest = StatusRequest.none;




  // TextEditingController dropdownCustomersName = TextEditingController();
  // TextEditingController dropdownCustomersId = TextEditingController();

  //   TextEditingController dayId = TextEditingController();  
  // TextEditingController dayName = TextEditingController();
  



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




  // Update Order Data
   updateData(id) async {

  if (formState.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();

 
 int response = await sqlDb.updateData('''
 UPDATE orders SET 
                  
                  driver_id = "${driverId.text}",
                  driver_name = "${driverName.text}",

                  customer_id = "${customerId.text}",
                  customer_name = "${customerName.text}",

                  town_id = "${townId.text}",
                  town_name = "${townName.text}",

                  district_id = "${districtId.text}",
                  district_name = "${districtName.text}",

                  serepta_id = "${jarsId.text}",
                  serepta_name = "${jarsName.text}",


                 
                  qty_jar_in =  "${jarIn.text}",
                  qty_jar_out = "${jarOut.text}",
                  qty_previous_jars = "${qtyPreviousOFJars.text}",
                  total_jar = "${totalJars.text}",

                  srpta_price_Lira = "${pricePerJar.text}",
                  total_price_jars = "${totalPriceJars.text}",
                  old_debt = "${oldDebt.text}",
                  new_debt = "${newDebt.text}",

                  paid = "${paid.text}",
                  total_price = "${totalPrice.text}"
                  
                  WHERE id = ${id.toString()}
          
        ''');

        statusRequest = handlingData("// $response //"); 

        if (StatusRequest.success == statusRequest) {
          if (response > 0) {
           
             ViewOrdersController controller = Get.put(ViewOrdersController());
            print("*---------=== success + $response");
             controller.readData();
            Get.offAllNamed(AppRoute.ordersViewBydriverid);
        
            //  Get.back();
              update();


            Get.rawSnackbar(
              titleText:  Text("Success".tr, style:const TextStyle(color: Colors.white)),
              messageText:  Text("Order_Updated_Successfully".tr, style:const TextStyle(color: Colors.white)),
              backgroundColor: Colors.green.shade400,
            );
          } else {
            print("Status.FAILED");
            statusRequest = StatusRequest.failure;
            Get.defaultDialog(title: "Warning", middleText: "the_customer_name_already_exists");
          }
        }
      
      update();
    } 
  
}


//**************************************START FOR BOTTELS CALCULATIONS*********************************** */














    // Add this function to update the price based on the selected bottle
    onBottlesFORJARChanged(String jarid) async {

  //  if (jarid != null && jarid.isNotEmpty) {

      
    //  resetBottelPerPrice();
     // resetTotalPriceANDQTYSOFJARS();
      // getPricePerJarData();
      
      getTotalQTYOFJARSSData();
      getTotalPriceOfJARData();
      getTotalPriceOrder();
       getDebtValue();
     
    // getJarsData();
       update(); // Update the UI
      
     //}
  }








  Future getTotalPriceOfJARData() async {
    update();
    List<Map> response = await sqlDb.readData('''
      SELECT * FROM orders
        
      ''');

      // WHERE bottels.id = ${bottelsId.text}

  if (response.isNotEmpty) {
    orders.clear();

    List listJars = response;
    orders.addAll(listJars.map((e) => OrdersModel.fromJson(e)));
  
       
         for(int i = 0; i < orders.length ; i++)
         {
          jarsId.text =orders[i].sereptaId.toString();
          jarsName.text = orders[i].sereptaName.toString();

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
      SELECT * FROM orders

      ''');
      
        //  WHERE bottels.id = ${bottelsId.text}

  if (response.length>0) {
    orders.clear();

    List listJars = response;
    orders.addAll(listJars.map((e) => OrdersModel.fromJson(e)));
  
       
         for(int i = 0; i < orders.length ; i++)
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
      SELECT * FROM orders
      
         
      ''');
        //  WHERE bottels.id = ${bottelsId.text} 
        //  WHERE bottels.id = "${bottelsId.text}" AND jars.id = "${jarsId.text}"

  if (response.length>0) {
    orders.clear();

    List listJars = response;
    orders.addAll(listJars.map((e) => OrdersModel.fromJson(e)));
  
       
        //  for(int i = 0; i < listJars.length ; i++)
        //  {
        //  pricePerBottel.text =bottels[i].price.toString();

    //  totalPrice.text = (double.parse(totalPriceBottel.text) + double.parse(totalPriceJars.text)).toString();
    //         print("yesssss has jars totalJars");
// if (totalPriceBottel.text.isNotEmpty && totalPriceJars.text.isNotEmpty && newDebt.text.isNotEmpty) {
if (totalPriceJars.text.isNotEmpty && newDebt.text.isNotEmpty) {
    // double totalPriceBottels_ = double.parse(totalPriceBottel.text);
    double totalPriceJars_ = double.parse(totalPriceJars.text);
    double newDebt_ = double.parse(newDebt.text);

    // totalPrice.text = (totalPriceBottels_ + totalPriceJars_ + newDebt_).toStringAsFixed(2);
    totalPrice.text = (totalPriceJars_ + newDebt_).toStringAsFixed(2);
    print("the totalPrice.text is = ${totalPrice.text}");
    update();

} else if (totalPriceJars.text.isNotEmpty &&  newDebt.text.isNotEmpty) {
    double totalPriceJars_ = double.parse(totalPriceJars.text);
    double newDebt_ = double.parse(newDebt.text);

    totalPrice.text = (totalPriceJars_ + newDebt_).toStringAsFixed(2);
     print("the totalPrice.text is = ${totalPrice.text}");
    update();

// } else if (totalPriceBottel.text.isNotEmpty && newDebt.text.isNotEmpty) {
} else if (newDebt.text.isNotEmpty) {
    // double totalPriceBottels_ = double.parse(totalPriceBottel.text);
    double newDebt_ = double.parse(newDebt.text);

    // totalPrice.text = (totalPriceBottels_ + newDebt_).toStringAsFixed(2);
    totalPrice.text = (newDebt_).toStringAsFixed(2);
     print("the totalPrice.text is = ${totalPrice.text}");
    update();
}
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
     SELECT * FROM orders
      
         
      ''');
      
 if (response.isNotEmpty) {

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
        // else if(totalPrice.text.isNotEmpty) {

        //   double totalPrice_ = double.parse(totalPrice.text);
        //   debt.text = (totalPrice_ - totalPrice_).toString();

        // }
        // else if(paid.text.isNotEmpty) {
           
        //   double paid_= double.parse(paid.text);
        //   debt.text = (paid_ - paid_).toString();

        // }


 }else{
   print("noooo hasnt debt");
        // debt.text ="0";

 }
 update();
 return response;
 }


 





  


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
   ordersModel = Get.arguments['ordersModel_'];

  //  getCustomersData();
  
  //  getBottelsData();
  //   getJarsData();




    jarIn= TextEditingController();
    jarOut = TextEditingController();
     qtyPreviousOFJars = TextEditingController();
    //qtyPreviousOFJars.text.isNotEmpty ?  TextEditingController() : '0';

     totalJars= TextEditingController();
    // totalJars.text.isNotEmpty ? TextEditingController() : '0';

    // pricePerJar= TextEditingController();
    pricePerJar.text = ordersModel!.pricePerJar.toString();
    totalPriceJars = TextEditingController();


    // townId = TextEditingController(); 
    // townName = TextEditingController();

    // districtId = TextEditingController(); 
    // districtName = TextEditingController();

    // customerName = TextEditingController(); 
    // customerId = TextEditingController();

    // driverName = TextEditingController(); 
    // driverId = TextEditingController();



    // jarsName= TextEditingController();
    // jarsId= TextEditingController();



    oldDebt= TextEditingController();
    newDebt= TextEditingController();

    paid= TextEditingController();

    totalPrice = TextEditingController();



     // get data from db view to texts in edit
    id = ordersModel!.id.toString();
    print("the order id is: $id");

    // dayId.text =  ordersModel!.dayId.toString();
    // dayName.text =  ordersModel!.dayName.toString();

    customerId.text =  ordersModel!.customerId.toString();
    print("the customerId  is: ${{customerId.text}}");

    customerName.text =  ordersModel!.customerName.toString();
    print("the customerName  is: ${{customerName.text}}");



    townId.text =  ordersModel!.townId.toString();
    print("the townId  is: ${{townId.text}}");

    
    townName.text =  ordersModel!.townName.toString();
    print("the townName  is: ${{townName.text}}");


    districtId.text =  ordersModel!.districtId.toString();
    print("the districtId  is: ${{districtId.text}}");

    districtName.text =  ordersModel!.districtName.toString();
    print("the districtName  is: ${{districtName.text}}");


    driverId.text = ordersModel!.driverId.toString();
    print("the driverId  is: ${{driverId.text}}");

    driverName.text = ordersModel!.driverName.toString();
    print("the driverName  is: ${{driverName.text}}");


    jarsId.text = ordersModel!.sereptaId.toString();
    print("the jarsId  is: ${{jarsId.text}}");

        jarsName.text = ordersModel!.sereptaName.toString();
    print("the jarsName  is: ${{jarsName.text}}");

       
       qtyPreviousOFJars.text = ordersModel!.totalJar.toString();
 
       print("prev Jars Text: ${qtyPreviousOFJars.text}");
   

    
        totalJars.text =  ordersModel!.totalJar.toString();
 
         print("Total Jars Text: ${totalJars.text}");
   

  


 //   qtyJarIn = json['qty_jar_in'] != null ? int.tryParse(json['qty_jar_in'].toString()) : null;

     pricePerJar.text =  ordersModel!.pricePerJar.toString();
      print("Price Per Jar Text: ${pricePerJar.text}");
    // totalPriceJars.text =  ordersModel!.totalpriceOfJars.toString();

    // paid.text =  ordersModel!.paid.toString();
    newDebt.text =  ordersModel!.oldDebt.toString();
    print("the newDebt  is: ${{newDebt.text}}");

  //  newDebt.text =  ordersModel!.newDebt.toString();


    // totalPrice.text =  ordersModel!.totalPrice.toString();

  // updateData(ordersModel!.id.toString());

    super.onInit();
  }

   @override
  void dispose() {

    driverName.dispose();
    driverId.dispose();

    townId.dispose();
    townName.dispose();

    districtId.dispose();
    districtName.dispose();

    customerName.dispose();
    customerId.dispose();

    
    jarsName.dispose();
    jarsId.dispose();


    jarIn.dispose();
    jarOut.dispose();



    qtyPreviousOFJars.dispose();
    totalJars.dispose();
     pricePerJar.dispose();
    totalPriceJars.dispose();


     oldDebt.dispose();
    newDebt.dispose();
    paid.dispose();



    totalPrice.dispose();


    super.dispose();
  }

}