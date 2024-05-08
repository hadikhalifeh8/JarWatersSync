import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jar_waters/controller/DriverOrders/editController.dart';
import 'package:jar_waters/core/class/handlingDataView.dart';
import 'package:jar_waters/core/functions/validationinput.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomButton.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomTextFormOrdersForGetPrices.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomTextFormOrdersForINTEGERS.dart';



class EditOrder extends StatelessWidget {
  const EditOrder({super.key});

  @override
  Widget build(BuildContext context) {
      Get.lazyPut(() =>EditOrderController());
   


    
    return Scaffold(appBar: AppBar(

      title:  Text("Updates_Order".tr),
      centerTitle: true,
    ),

    body:
          GetBuilder<EditOrderController>(builder: (controller) => 

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

                     Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                     child: 
                  //  Text(controller.myservices.sharedPreferences.getString("name").toString(), style: const TextStyle(fontSize: 20, color:Colors.red)),
                Text(controller.ordersModel!.driverName.toString(), style: const TextStyle(fontSize: 20, color:Colors.red),)

                  ),
                 
                  
                  // Container(
                  //   padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                  //   child: Text(controller.ordersModel!.dayName.toString(),style: const TextStyle(fontSize: 18, color: Colors.blue))
                  // ),
                  
                  
               Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),

                child: Text(DateFormat('dd-MM-yyyy').format(DateTime.now()),style: TextStyle(fontSize: 16, color: Colors.red))
               ),

           
              
          
                ],
              ),
          ),
     

     
 Padding(
   padding: const EdgeInsets.symmetric(horizontal: 15.0),
   child: Row(
                      children: [
                        Expanded(flex: 2,child: Text(controller.ordersModel!.customerName.toString(), style: const TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),)),
 
                        
     
 
              Expanded(flex: 2,child: Text(controller.ordersModel!.townName.toString(), style: const TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),)),
             Expanded(flex: 2,child: Text(controller.ordersModel!.districtName.toString(), style: const TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),)),
 
                      ],
                    ),
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




      Container(
                // padding: const EdgeInsets.all(16),
                // color: Colors.green,
                child: 
        Column(children: [
          Center(child: Text(controller.ordersModel!.sereptaName.toString(), style: const TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),)),
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
                                          //    if(controller.jarsId.text.isNotEmpty) {
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
                                     //         if(controller.jarsId.text.isNotEmpty) {
                                               return valiInput(val!, 1, 100, "");
                                   //           }
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
                                  hintText_: "previous_jars",
                                  icon_: Icons.water_drop_rounded,
                                  mycontroller:controller.qtyPreviousOFJars,
                                  isNumber: true,
                                  inputFormatters_: true,
                                  // readOnly_: controller.bottelsId.text.isEmpty ? true : false,
                                   readOnly_: false,

                                   validation: (val){
                                       //       if(controller.jarsId.text.isNotEmpty) {
                                               return valiInput(val!, 1, 100, "");
                                         //     }
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
                                         hintText_: "price_per_jar".tr, 
                              
                              //            validation: (val){
                              //  return valiInput(val!, 3, 15, "");
                              // }, 
                                         mycontroller:controller.pricePerJar,
                                         icon_: Icons.monetization_on, 
                                         isNumber: true, 
                                       //  obscureText_: obscureText_, 
                                         inputFormatters_: true,
                                         readOnly_: true,
                                //  onChanged_: controller.onBottlesFORJARChanged,

  
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
                                      //   if(controller.bottelsId.text.isNotEmpty) {
                                          
                                      //     return valiInput(val!, 1, 100, "");
                                      //   }
                                        

                                      //  else 
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
                                  // readOnly_: (controller.bottelsId.text.isEmpty && controller.jarsId.text.isEmpty) ? true : false ,
                                 
                                  readOnly_: (controller.jarsId.text.isEmpty) ? true : false ,
                                  // onChanged_: controller.onBottlesChanged,

                                   onChanged_: ($value){
                                    // if(controller.bottelsId.text.isNotEmpty){

                                    //   controller.onBottlesChanged($value);

                                    // } else 
                                    if (controller.jarsId.text.isNotEmpty){

                                      controller.onBottlesFORJARChanged($value);

                                    }
                                          
                                          
                                        }
                                   
                                    ),                
  
            ),


             Expanded(
              // newDebt is = => oldDebt in AddOrder is = 0
                  child: CustomTextFormOrdersForGetPrices(
                                         label_: "New_debt".tr, 
                                         hintText_: "New_debt".tr, 
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
         Divider(),
// oldDebt is the ==> newDebt in AddOrder
         CustomTextFormOrdersForGetPrices(
                                         label_: "Old_debt".tr, 
                                         hintText_: "Old_debt".tr, 
                              //            validation: (val){
                              //  return valiInput(val!, 3, 15, "");
                              // }, 
                                        mycontroller:controller.newDebt,  
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


   
 Container(
  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
   child: MaterialButton(onPressed: (){
    controller.updateData(controller.ordersModel!.id.toString());
   },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
           color: Colors.blue.shade400,
   child:  Text("Update_Order".tr, style: const TextStyle(color: Colors.white),),),
 ),
                  

  //  CustomButtonOrder(
  //                      onPressed_: (){
  //                       controller.updateData(controller.ordersModel!.id.toString());
  //                       },
  //                      text_: "Update Order",
  //                      ), 

                        



    ],), 
     
     
     
         
     ),)

          
          )

    
    );
  }
}