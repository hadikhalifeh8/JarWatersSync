import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/Towns/ViewTownsController.dart';
import 'package:jar_waters/core/class/handlingDataView.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/core/functions/translateDatabase.dart';
import 'package:jar_waters/view/widget/Towns/CustomListTileTown.dart';


class ViewTownss extends StatelessWidget {
  const ViewTownss({super.key});

  @override
  Widget build(BuildContext context) {
    ViewTownssController controller = Get.put(ViewTownssController());
    return Scaffold(
      appBar: AppBar(
               title:  Text("View_All_Towns".tr, style: Theme.of(context).textTheme.headline1,),
               centerTitle: true,
              

      ),

      body: 
       
       
            GetBuilder<ViewTownssController>(builder: (controller) =>
            
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
                          
                          
                      CustomListTileTown(
                                    
                                    // title_:controller.data[index].name?['ar'] ??"".toString(),
                     title_: translateDateBase("${controller.data[index].name?["ar"] ??"".toString()}",
                     "${controller.data[index].name?["en"] ??"".toString()}"
                     
                     
                     ),

                                  
                                    // leading_: controller.data[index].name?['en'] ??"".toString(),
                                    leading_: controller.data[index].id.toString(),


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