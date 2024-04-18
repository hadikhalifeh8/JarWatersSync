import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/Customers/ViewCustomersController.dart';
import 'package:jar_waters/core/class/handlingDataView.dart';
import 'package:jar_waters/core/functions/translateDatabase.dart';
import 'package:jar_waters/view/widget/Customers/CustomListTileCustomers.dart';



class ViewCustomers extends StatelessWidget {
  const ViewCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    ViewCustomersController controller = Get.put(ViewCustomersController());
    return Scaffold(
      appBar: AppBar(
               title:  Text("View_All_Customers".tr, style: Theme.of(context).textTheme.headline1,),
               centerTitle: true,
              

      ),

      body: 
       
       
            GetBuilder<ViewCustomersController>(builder: (controller) =>
            
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
                          
                          
                      CustomListTileCustomers(

                        leading_: controller.data[index].id.toString(),
                                    
                                    // title_:controller.data[index].name?['ar'] ??"".toString(),
                     title_: translateDateBase(controller.data[index].name?["ar"] ??"".toString(),
                     controller.data[index].name?["en"] ??"".toString(),
                     ),
                     phone_: controller.data[index].phone.toString(),

                                  
                                    
                  town_:  translateDateBase(
                                         controller.data[index].townNameAr.toString(),
                                         controller.data[index].townNameEn.toString(),
                             ),

                  district_:  translateDateBase(
                                         controller.data[index].districtNameAr.toString(),
                                         controller.data[index].districtNameEn.toString(),
                             ),

                  driver_:  translateDateBase(
                                         controller.data[index].driverNameAr.toString(),
                                         controller.data[index].driverNameEn.toString(),
                             ),           



                                   

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