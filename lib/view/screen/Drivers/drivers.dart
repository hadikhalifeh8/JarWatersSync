import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/Drivers/ViewDriversController.dart';
import 'package:jar_waters/core/class/handlingDataView.dart';
import 'package:jar_waters/core/functions/translateDatabase.dart';
import 'package:jar_waters/view/widget/Drivers/CustomListTileDrivers.dart';



class ViewDrivers extends StatelessWidget {
  const ViewDrivers({super.key});

  @override
  Widget build(BuildContext context) {
    ViewDriversController controller = Get.put(ViewDriversController());
    return Scaffold(
      appBar: AppBar(
               title:  Text("View_All_Drivers".tr, style: Theme.of(context).textTheme.headline1,),
               centerTitle: true,
              

      ),

      body: 
       
       
            GetBuilder<ViewDriversController>(builder: (controller) =>
            
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
                          
                          
                      CustomListTileDrivers(

                        leading_: controller.data[index].id.toString(),
                                    
                                    // title_:controller.data[index].name?['ar'] ??"".toString(),
                     title_: translateDateBase(controller.data[index].name?["ar"] ??"".toString(),
                     controller.data[index].name?["en"] ??"".toString()
                     
                     
                     ),

                                  
                                    
                                    phone: controller.data[index].phone.toString(),
                                    password: controller.data[index].password.toString(),


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