import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/Districts/ViewDistrictsController.dart';
import 'package:jar_waters/controller/Towns/ViewTownsController.dart';
import 'package:jar_waters/core/class/handlingDataView.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/core/functions/translateDatabase.dart';
import 'package:jar_waters/view/widget/Districts/CustomListTileDistrict.dart';
import 'package:jar_waters/view/widget/Towns/CustomListTileTown.dart';


class ViewDistrictss extends StatelessWidget {
  const ViewDistrictss({super.key});

  @override
  Widget build(BuildContext context) {
    ViewDistrictsController controller = Get.put(ViewDistrictsController());
    return Scaffold(
      appBar: AppBar(
               title:  Text("View_All_Districts".tr, style: Theme.of(context).textTheme.headline1,),
               centerTitle: true,
              

      ),

      body: 
       
       
            GetBuilder<ViewDistrictsController>(builder: (controller) =>
            
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
                          
                          
                      CustomListTileDistrict(
                                    
                                    // title_:controller.data[index].name?['ar'] ??"".toString(),
                     title_: translateDateBase(controller.data[index].name?["ar"] ??"".toString(),
                     controller.data[index].name?["en"] ??"".toString()
                     
                     
                     ),

                                  
                                    // leading_: controller.data[index].name?['en'] ??"".toString(),
                                    leading_: controller.data[index].id.toString(),
                                    town_: translateDateBase(
                                      controller.data[index].townNameAr.toString(),
                                      controller.data[index].townNameEn.toString(),
                                              ),

                                    // town_: controller.data[index].townsRltn!.name!.ar.toString(),
// town_: translateDateBase(
//     "${controller.data[index].townsRltn?.name?.ar ??""}",
//     "${controller.data[index].townsRltn?.name?.en ?? ""}"
//   ),

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