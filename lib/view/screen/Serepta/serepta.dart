import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/Districts/ViewDistrictsController.dart';
import 'package:jar_waters/controller/Serepta/ViewSereptaController.dart';
import 'package:jar_waters/controller/Towns/ViewTownsController.dart';
import 'package:jar_waters/core/class/handlingDataView.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/core/functions/translateDatabase.dart';
import 'package:jar_waters/view/widget/Districts/CustomListTileDistrict.dart';
import 'package:jar_waters/view/widget/Serepta/CustomListTileSerepta.dart';
import 'package:jar_waters/view/widget/Towns/CustomListTileTown.dart';


class ViewSerepta extends StatelessWidget {
  const ViewSerepta({super.key});

  @override
  Widget build(BuildContext context) {
    ViewSereptaController controller = Get.put(ViewSereptaController());
    return Scaffold(
      appBar: AppBar(
               title:  Text("View_All_Serepta".tr, style: Theme.of(context).textTheme.headline1,),
               centerTitle: true,
              

      ),

      body: 
       
       
            GetBuilder<ViewSereptaController>(builder: (controller) =>
            
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
                          
                          
                      CustomListTileSerepta(

                        leading_: controller.data[index].id.toString(),
                                    
                                    // title_:controller.data[index].name?['ar'] ??"".toString(),
                     title_: translateDateBase(controller.data[index].name?["ar"] ??"".toString(),
                     controller.data[index].name?["en"] ??"".toString()
                     
                     
                     ),

                                  
                                    
                                    priceLira: controller.data[index].priceLira.toString(),
                                    priceDollar: controller.data[index].priceDollar.toString(),


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

              
              

              
                     
    

          
// floatingActionButton: FloatingActionButton(onPressed: ()async{
//                                   //controller.goToaddPage();
//                                   await controller.sqlDb.myDeleteDataBase();
//                 },
//                 child: Icon(Icons.add)),



    );
  }
}