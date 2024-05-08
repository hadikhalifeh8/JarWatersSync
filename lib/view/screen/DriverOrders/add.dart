import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jar_waters/controller/DriverOrders/addController.dart';

import 'package:jar_waters/core/class/handlingDataView.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/core/functions/translateDatabase.dart';
import 'package:jar_waters/core/functions/validationinput.dart';
import 'package:jar_waters/core/localization/changeLocal.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomButton.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomTextFormOrdersForGetPrices.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomTextFormOrdersForINTEGERS.dart';
import 'package:jar_waters/view/widget/DriverOrders/DropDownSearchOrders.dart';



class AddOrder extends StatelessWidget {
  const AddOrder({super.key});

  @override
  Widget build(BuildContext context) {
     Get.lazyPut(() =>AddOrderController());
   
  LocalController localController =  Get.put(LocalController());

    
    return Scaffold(appBar: AppBar(

      title:  Text("Add_Order".tr),
      centerTitle: true,
    ),

    body:
          GetBuilder<AddOrderController>(builder: (controller) => 

          HandlingDataRequest(
            
            statusRequest: controller.statusRequest,
            
            
             widget:        
                     Form(
      key: controller.formState,
       child: 
       ListView(children: [

                  Container( 
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
 
          
            child: Row(
              mainAxisSize: MainAxisSize.min,
                children: [

                     Expanded(
                                flex: 3,
                    
                    child: 
                 //   Text(controller.myservices.sharedPreferences.getString("name").toString(), style: const TextStyle(fontSize: 20, color:Colors.red)),
     
                Text(controller.driverName.text, style: const TextStyle(fontSize: 20, color:Colors.red),)
                  ),
                 
                  Spacer(),
           
                  
                  
               Expanded(
                          flex: 2,
                    //padding: const EdgeInsets.only(right: 20.0),

                child: Text(DateFormat('dd-MM-yyyy').format(DateTime.now()),style: TextStyle(fontSize: 14, color: Colors.red))
               ),

           
              
          
                ],
              ),
          ),
     

     
 Row(
                    children: [
                      Expanded(flex: 2,
                        child: CustomDropDownSearchOrders(
                                             label: "Customers".tr, 
                                             title: "Enter_Customers".tr, 
                                             listdata: controller.dropdownListOFCustomers,
                                             dropDownSelectedName: controller.customerName,
                                             dropDownSelectedID: controller.customerId,
                                              onTownChanged: controller.onCustomerChanged,
                                             
                               ),
                      ),
                      
   

            Expanded(child: Text(controller.townName.text, style: const TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),)),
            Expanded(child: Text(controller.districtName.text, style: const TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),)),

                    ],
                  ),


Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () => controller.toggleContainers(true, false),
            //       child: const Text('Bottels'),
            //     ),
            //     ElevatedButton(
            //       onPressed: () => controller.toggleContainers(false, true),
            //       child: const Text('Jars'),
            //     ),
            //   ],
            // ),
             const SizedBox(height: 20),











/******************************************************************************************* */





// Start Container For Jars
        
    //  Visibility(
    //           visible: controller.showContainerB,
    //           child:

      Container(
                // padding: const EdgeInsets.all(16),
                // color: Colors.green,
                child: 
        Column(children: [
          Center(child: Text(controller.jarsName.text, style: const TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),)),
SizedBox(height: 20.0,),
          Row(children: [

            Expanded(child:

             CustomTextFormOrdersForINTEGERS(
                                  label_: "qty_jar_in".tr,
                                  hintText_: "jar_in".tr, 
                                  icon_: Icons.water_drop_rounded,
                                  mycontroller:controller.jarIn,
                                  isNumber: true, 
                                  inputFormatters_: true,
                                  // readOnly_: controller.bottelsId.text.isEmpty ? true : false,
                                   readOnly_: false,
                                   
                                   validation: (val){
                                             // if(controller.jarsId.text.isNotEmpty) {
                                               return valiInput(val!, 1, 100, "");
                                             // }
                                        return null; 
                                     },


                                   onChanged_: controller.onBottlesFORJARChanged,

  
                                  )  ,
  
    
  
            ), 
  
    
            Expanded(child:
             CustomTextFormOrdersForINTEGERS(
                                   label_: "qty_jar_out".tr,
                                  hintText_: "jar_out".tr,
                                  icon_: Icons.water_drop_rounded,
                                  mycontroller:controller.jarOut,
                                  isNumber: true,
                                  inputFormatters_: true,
                                  // readOnly_: controller.bottelsId.text.isEmpty ? true : false,
                                   readOnly_: false,

                                   validation: (val){
                                          //    if(controller.jarsId.text.isNotEmpty) {
                                               return valiInput(val!, 1, 100, "");
                                             // }
                                        return null; 
                                     },
                                  
                                  onChanged_: controller.onBottlesFORJARChanged,
  
                                  )  ,
  
    
  
            ), 
  
      ],),

      Row(children: [
          
    
  
            Expanded(child:
             CustomTextFormOrdersForINTEGERS(
                                  label_: "qty_previous_jars".tr,
                                  hintText_: "previous_jars".tr,
                                  icon_: Icons.water_drop_rounded,
                                  mycontroller:controller.qtyPreviousOFJars,
                                  isNumber: true,
                                  inputFormatters_: true,
                                  // readOnly_: controller.bottelsId.text.isEmpty ? true : false,
                                   readOnly_: false,

                                   validation: (val){
                                            //  if(controller.jarsId.text.isNotEmpty) {
                                               return valiInput(val!, 1, 100, "");
                                           //   }
                                        return null; 
                                     },

                                  onChanged_: controller.onBottlesFORJARChanged,
  
                                  )  ,
  
            ),       
    
  
            Expanded(child:
             CustomTextFormOrdersForINTEGERS(
                                  label_: "total_qty_Jar".tr,
                                  hintText_: "total_Jar".tr, 
                                  icon_: Icons.water_drop_rounded,
                                  isNumber: true,
                                  mycontroller: controller.totalJars ,
                                  inputFormatters_: true,
                                  readOnly_: true,
  
                                  ),
  
            ),
      ],),

    Row(children: [
            Expanded(
              child: CustomTextFormOrdersForGetPrices(
                                         label_: "price_per_jar".tr, 
                                         hintText_: "Price_Per_Jar".tr, 
                              
                              //            validation: (val){
                              //  return valiInput(val!, 3, 15, "");
                              // }, 
                                         mycontroller:controller.pricePerJar,
                                         icon_: Icons.monetization_on, 
                                         isNumber: true, 
                                       //  obscureText_: obscureText_, 
                                         inputFormatters_: true,
                                         readOnly_: true,
                                  onChanged_: controller.onBottlesFORJARChanged,

  
                                        ),
            ),
  
    
            Expanded(
                  child: CustomTextFormOrdersForGetPrices(
                                         label_: "total_price_jar".tr, 
                                         hintText_: "total_price_jar".tr, 
                              //            validation: (val){
                              //  return valiInput(val!, 3, 15, "");
                              // }, 
                                        mycontroller:controller.totalPriceJars,  
                                        icon_: Icons.monetization_on, 
                                        isNumber: true, 
                                       //  obscureText_: obscureText_, 
                                        inputFormatters_: true,
                                        readOnly_: true,
                                    ),
  
            ),

    ],),
                ],),
              ),
            // ),


      /////// End Container For Jars  ////////////////////// // 
          ],
        ),



       
const SizedBox(height: 40.0,),

         Row(children: [

           Expanded(
                  child: CustomTextFormOrdersForGetPrices(
                                         label_: "Paid".tr, 
                                         hintText_: "Paid".tr, 

                                         validation: (val){
                                        // if(controller.bottelsId.text.isNotEmpty) {
                                          
                                        //   return valiInput(val!, 1, 100, "");
                                        // }
                                        

                                       //else 
                                       if(controller.jarsId.text.isNotEmpty) {
                                          
                                          return valiInput(val!, 1, 100, "");
                                        }

                                        return null; 

                                        

                               
                              }, 
                                        mycontroller:controller.paid,  
                                        icon_: Icons.monetization_on, 
                                        isNumber: true, 
                                       //  obscureText_: obscureText_, 
                                        inputFormatters_: true,
                                      //  readOnly_: false,
                                    // readOnly_: controller.bottelsId.text.isEmpty ? true : false || controller.jarsId.text.isEmpty ? true : false,
                                //  readOnly_: (controller.bottelsId.text.isEmpty && controller.jarsId.text.isEmpty) ? true : false ,
                                  readOnly_: (controller.jarsId.text.isEmpty) ? true : false ,

                                  // onChanged_: controller.onBottlesChanged,

                                   onChanged_: ($value){
                                    // if(controller.bottelsId.text.isNotEmpty){

                                    //   controller.onBottlesChanged($value);

                                    // } 
                                   // else 
                                    
                                    if (controller.jarsId.text.isNotEmpty){

                                      controller.onBottlesFORJARChanged($value);

                                    }
                                          
                                          
                                        }
                                   
                                    ),                
  
            ),


             Expanded(
                  child: CustomTextFormOrdersForGetPrices(
                                         label_: "debt".tr, 
                                         hintText_: "debt".tr, 
                              //            validation: (val){
                              //  return valiInput(val!, 3, 15, "");
                              // }, 
                                        mycontroller:controller.oldDebt,  
                                        icon_: Icons.monetization_on, 
                                        isNumber: true, 
                                       //  obscureText_: obscureText_, 
                                        inputFormatters_: true,
                                        readOnly_: true,
                                        // onChanged_: ($value){
                                        //   controller.onBottlesChanged($value);
                                        //   controller.onBottlesFORJARChanged($value);
                                        // }
                                        
                                    ),
  
            ),





         ],),

    
const SizedBox(height: 40.0,),

    CustomTextFormOrdersForGetPrices(
                                     label_: "Total_Price".tr, 
                                     hintText_: "Total_Price".tr, 
                          //            validation: (val){
                          //  return valiInput(val!, 3, 15, "");
                          // }, 
                                     mycontroller:controller.totalPrice,  
                                     icon_: Icons.monetization_on, 
                                     isNumber: true, 
                                   //  obscureText_: obscureText_, 
                                     inputFormatters_: true,
                                     readOnly_: true,

                  ),


      CustomButtonOrder(
                       onPressed_: (){controller.insertData();},
                       text_: "Order_Now".tr,
                       ),

                      //        CustomButtonOrder(
                      //  onPressed_: (){Get.toNamed(AppRoute.ordersViewBydriverid);},
                      //  text_: "Order Now",
                      //  ),

                  

                  //  CustomButtonOrder(
                  //      onPressed_: (){ordersController.readData();},
                  //      text_: "View My Orders",
                  //      ),


               //   const SizedBox(height: 15.0,),


          // InkWell(
          //   onTap: (){
          //     controller.logout();
          //   },
            
          //   child: Image.asset(AppImageAsset.logout, height: 40.0 )
          //   ),     

                        



    ],), 
     
     
     
         
     ),)

          
          )

    
    );
  }
}