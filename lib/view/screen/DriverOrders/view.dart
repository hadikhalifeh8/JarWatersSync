import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/DriverOrders/viewController.dart';
import 'package:jar_waters/controller/Drivers/ViewDriversController.dart';
import 'package:jar_waters/core/class/handlingDataView.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomListTileOrder.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomTextFormOrdersForINTEGERS.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomTextFormViewOrders.dart';



class ViewOrdersByDrivers extends StatelessWidget {
  
  const ViewOrdersByDrivers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

     Get.lazyPut(() =>ViewOrdersController());
    

    ViewOrdersController controller = Get.put(ViewOrdersController());
    //  ViewDriversController driverscontroller = Get.put(ViewDriversController());
 

   return Scaffold(
  body: GetBuilder<ViewOrdersController>(
    builder: (controller) => Scaffold(
      appBar: AppBar(
        title: controller.isSearch
            ? Container(
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextField(
                  focusNode: controller.focusNode,
                  controller: controller.search,
                  onChanged: controller.onSearchChanged,
                  decoration:  InputDecoration(
                      contentPadding:const EdgeInsets.fromLTRB(16, 28, 16, 12),
                      hintStyle:const TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      hintText: "Search".tr),
                ))
            :  Text("View_All_Orders".tr),
        centerTitle: true,
        actions: [
          IconButton(
                onPressed: () {
                  controller.onSearchFunc();
                  controller.focusNode.requestFocus();
                 
                },
                icon: Icon(controller.isSearch ? Icons.close : Icons.search)),
        ],
        leading: IconButton(onPressed: (){controller.syncData();}, icon:const Icon(Icons.sync)),
      ),

      body: HandlingDataView(
        statusRequest: controller.statusRequest,

        widget: 
        ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.orders.length,
                      itemBuilder: (context, index) => 
                      
                      CustomListTileOrder(
                        id: controller.orders[index].id.toString(),
                        districtName: controller.orders[index].customerName.toString(),
                        townName: controller.orders[index].totalPrice.toString(),
                      //  iconDataDelete: Icons.delete_forever_rounded,
                        onEdit: () {
                          controller.goToEditOrderPage(controller.orders[index]);
                        },
                      ),

                    ),
                  
                  ],
                ),
               // Text(controller.myservices.sharedPreferences.getString("totalJars").toString(),)
              ],
            ),
            // SizedBox(height: 25.0,),

            
            // Row(
            //   children: [
            //     Expanded(child: CustomTextFormViewOrders(
            //          label_: 'Number_of_load'.tr,
            //           hintText_: '',
            //            icon_: Icons.format_list_numbered_sharp,
            //              isNumber: true, inputFormatters_: true,
            //               readOnly_: true,
            //               mycontroller: controller.numberOfJarsLoad,
            //              // onChanged_: driverscontroller.getNumberOfJarsFill,
                          
            //                ),
            //                ),



            // Expanded(child: CustomTextFormViewOrders(
            //   label_: 'jars_in'.tr,
            //    hintText_: '',
            //     icon_: Icons.format_list_numbered_sharp, isNumber: true, 
            //     inputFormatters_: true,
            //      readOnly_: true,
            //      mycontroller: controller.returnedjars,
            //     // onChanged_: controller.onChanged,
            //      )
            //      ),

            // Expanded(child: CustomTextFormViewOrders(label_: 'jars_out'.tr, hintText_: '', icon_: Icons.format_list_numbered_sharp, isNumber: true, inputFormatters_: true, readOnly_: true)),

            //   ],
            // ),
          ],
            
        ),
        
        
      ),
    ),
  ),

                //      floatingActionButton: FloatingActionButton(onPressed: (){
                //                controller.goToaddPage();
                // },
                // child: Icon(Icons.add)),
                

                   floatingActionButton: 
                    Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                   
                              Container(
                               padding: const EdgeInsets.symmetric(horizontal: 30.0),
                   
                                child: FloatingActionButton(
                                 onPressed: () => {
                                    controller.goToadminPage(),
                                 },
                                 child: const Icon(Icons.navigate_before_rounded),
                                 heroTag: "fab2",
                       ),
                              ),

          
                                 
                   
                      //               SizedBox(width: 20,),


                      //                Container(
                      //          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                   
                      //           child: FloatingActionButton(
                      //            onPressed: () => {
                      //               controller.goToDriversJarsCalcualtePage(controller.drivers),
                      //            },
                      //            child: const Icon(Icons.remove_red_eye_outlined),
                      //            heroTag: "fab2",
                      //  ),
                      //         ),

                               
                                    const Spacer(),
                              
                                   
                   
                             Container(
                               // padding: const EdgeInsets.symmetric(horizontal: 1.0),
                               child: FloatingActionButton(
                                 onPressed: () => {
                                    controller.goToaddPage(),
                                 },
                                 child:  const Icon(Icons.add),
                                 heroTag: "fab1",
                               ),
                             ),
                           ]),

                          
            
                   

        
  );

  }
}
