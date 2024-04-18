import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/CustomerOrders/ViewCustomerOrders.dart';
import 'package:jar_waters/controller/Customers/ViewCustomersController.dart';
import 'package:jar_waters/core/class/handlingDataView.dart';
import 'package:jar_waters/core/functions/translateDatabase.dart';
import 'package:jar_waters/view/widget/CustomerOrders/CustomListTileCustomerOrders.dart';
import 'package:jar_waters/view/widget/Customers/CustomListTileCustomers.dart';



class ViewCustomerOrders extends StatelessWidget {
  const ViewCustomerOrders({super.key});

  @override
  Widget build(BuildContext context) {
    ViewCustomerOrdersController controller = Get.put(ViewCustomerOrdersController());
    return Scaffold(
      appBar: AppBar(
               title:  Text("View_All_Customer_Orders".tr, style: Theme.of(context).textTheme.headline1,),
               centerTitle: true,
              

      ),

      body: 
       
       
            GetBuilder<ViewCustomerOrdersController>(builder: (controller) =>
            
            HandlingDataView(
              
              statusRequest: controller.statusRequest,  
              
              
              
              widget:     
              
                          ListView(
                            children: [
                             
                                
                               
                              Stack(
                                    children: [
                                                  ListView.builder(
                                                      shrinkWrap: true,
                                                      physics: const NeverScrollableScrollPhysics(),
                                                      
                                                      itemCount: controller.data.length,
                                                      itemBuilder: (context, index) =>
                          
                          
                      CustomListTileCustomerOrders(

                        leading_: controller.data[index].id.toString(),
                                    
                                    // title_:controller.data[index].name?['ar'] ??"".toString(),
                     title_: translateDateBase(controller.data[index].driverNameAr.toString(),
                     controller.data[index].driverNameEn.toString(),
                     ),
                     
                    driver_:  translateDateBase(
                                         controller.data[index].customerNameAr.toString(),
                                         controller.data[index].customerNameEn.toString(),
                             ),   

                                  
                                    
                  town_:  translateDateBase(
                                         controller.data[index].townNameAr.toString(),
                                         controller.data[index].townNameEn.toString(),
                             ),

                  district_:  translateDateBase(
                                         controller.data[index].districtNameAr.toString(),
                                         controller.data[index].districtNameEn.toString(),
                             ),


                  sereptaName_: translateDateBase(
                                         controller.data[index].sereptaNameAr.toString(),
                                         controller.data[index].sereptaNameEn.toString(),
                             ),       


                  sereptaPriceLira_: controller.data[index].srptaPriceLira.toString(),
                  sereptaPriceDollar_: controller.data[index].srptaPriceDollar.toString(),               

        



                                   

                                    // onEdit: (){},
          
                                    //   iconDelete: Icons.delete_forever, 
                                    //    onDelete: () { 
                                    //   //  controller.deleteData(controller.towns[index].id.toString());
                                    //     },


                                          ),
                                        
                                              
                                              
                                              
                                               
                                                  ),
                                                ],
                                  ),
                                ],
                              ),
                            
                          )), 

              
              

              
                     
    

          




    );
  }
}