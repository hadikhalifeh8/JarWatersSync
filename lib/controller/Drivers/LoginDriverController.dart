import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/core/class/statusRequest.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/core/functions/handlingDataController.dart';
import 'package:jar_waters/core/functions/sqldb.dart';
import 'package:jar_waters/core/services/services.dart';
import 'package:jar_waters/data/model/driversModel.dart';

class DriverLoginController extends GetxController{

   SqlDb sqlDb = SqlDb();

   List<DriversModel> drivers = [];
   DriversModel? driversModel; 

   Myservices myservices = Get.find();


 StatusRequest statusRequest = StatusRequest.none; 

  GlobalKey<FormState> formState = GlobalKey<FormState>();

   TextEditingController name= TextEditingController();
   TextEditingController phone= TextEditingController();
   TextEditingController password= TextEditingController();
   TextEditingController totalJars= TextEditingController();


   String? id;
  



        bool isShowPassword = true;

  showPassword(){
   isShowPassword = isShowPassword == true ? false : true;
   update();
  }




    Future loginData() async {
        if(formState.currentState!.validate()) 
    {
       update();
    statusRequest = StatusRequest.loading;

List<Map> response = await sqlDb.readData('''
  SELECT * FROM drivers WHERE phone = '${phone.text}' AND password = '${password.text}' 
''');

      print("***************##############************* Controler $response ");

                                
            statusRequest = handlingData(response); 

             if(StatusRequest.success == statusRequest)
     {       
       

            if( response.length > 0)
            {
                    // if not approve the account     
      //  if(response[0]['status'] == "1")
      //  {
        myservices.sharedPreferences.setString("id", response[0]['id'].toString());
       myservices.sharedPreferences.setString("name", response[0]['name'].toString());
       myservices.sharedPreferences.setString("phone", response[0]['phone'].toString());
       myservices.sharedPreferences.setString("password", response[0]['password'].toString());
       myservices.sharedPreferences.setString("totalJars", response[0]['totalJars'].toString());


     myservices.sharedPreferences.setString("step", "2");

       Get.offAllNamed(AppRoute.ordersViewBydriverid);
      //  }  else{
      //        Get.toNamed(AppRoute.verifyCodeSignup, arguments: { "email": email.text});
      //  }

                 // Save login state to SQFlite


                
                 //Get.offAllNamed(AppRoute.home);
                    

            Get.rawSnackbar(
              titleText:  Text("Success".tr, style:const TextStyle(color: Colors.white)),
              messageText:  Text("Login_Success".tr, style:const TextStyle(color: Colors.white)),
              backgroundColor: Colors.green.shade400,
            );  

            update();
            print("yes Succefully Login");
            return response;
            
            
     
        }

         else {
         Get.defaultDialog(title: "Warning".tr, middleText: "Phone_or_Password_not_correct".tr);
        statusRequest = StatusRequest.failure; // insert / update/ delete : لا يوجد تحديث / getdata : لا يوجد بيانات
      }
    } else {
      Get.offAllNamed(AppRoute.adminlogin);
      print("Login failed");
    }
  update();
  
    }
  }


  logout()
  {
   myservices.sharedPreferences.clear(); 
   Get.offAllNamed(AppRoute.adminlogin);
  }





  @override
  void onInit() {
    

    name = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    totalJars = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }
}

