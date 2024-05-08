import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/DriverOrders/viewController.dart';
import 'package:jar_waters/controller/Drivers/ViewDriversController.dart';
import 'package:jar_waters/core/constant/imageasset.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/view/widget/Admin/CustomHomeGridView.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomButton.dart';
import 'package:jar_waters/view/widget/DriverOrders/CustomTextFormOrdersForINTEGERS.dart';


class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {

  //  LoginController controller = Get.put(LoginController());
    ViewOrdersController controller = Get.put(ViewOrdersController());
    // ViewDriversController driversController = Get.put(ViewDriversController());



    return Scaffold(
      appBar: AppBar(
              title: 
               Row(
                 children: [
                   Text("Dashboard".tr, style: Theme.of(context).textTheme.headline1,),
                   const Spacer(),
                   IconButton(onPressed: (){controller.logout();}, icon: const Icon(Icons.power_settings_new))
                 ],
               ),
        centerTitle: true,    
        
        ),

        body: ListView(children: [
          GridView(
            
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 130.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),


            children: [

             CustomHomeGridView(image: (AppImageAsset.driver), title: "View_All_Drivers".tr, onClick: (){Get.toNamed(AppRoute.driverss);}),
              CustomHomeGridView(image: (AppImageAsset.town), title: "View_All_Towns".tr,onClick: (){Get.toNamed(AppRoute.townss);}),
              CustomHomeGridView(image: (AppImageAsset.district), title: "View_All_Districts".tr, onClick: (){Get.toNamed(AppRoute.districtss);}),
              CustomHomeGridView(image: (AppImageAsset.customer), title: "View_All_Customers".tr,onClick: (){Get.toNamed(AppRoute.customerss);}),
              CustomHomeGridView(image: (AppImageAsset.bottel), title: "View_All_Serepta".tr, onClick: (){Get.toNamed(AppRoute.sereptass);}),
              CustomHomeGridView(image: (AppImageAsset.company), title: "View_All_Customer_Orders".tr, onClick: (){Get.toNamed(AppRoute.customerOrderss);}),

            ],
          ),
        //   const SizedBox(height: 30.0,),

        //           CustomTextFormOrdersForINTEGERS(
        //                                        hintText_: "Numbers_of_jars_Fill".tr,
        //                                        label_: "Numbers_of_jars_Fill".tr,
        //                                        icon_: Icons.abc,
        //                                        inputFormatters_: true,
        //                                        isNumber: true,
        //                                        readOnly_: false,
        //                                        mycontroller: driversController.numbersOfFillJars,
        //                                     //   onChanged_: driversController.getNumberOfJarsFill(),
                         
                         
        //                                       ),

        //  const SizedBox(height: 15.0,),

        //           CustomTextFormOrdersForINTEGERS(
        //                                        hintText_: "Numbers_of_jars_empty".tr,
        //                                        label_: "Numbers_of_jars_empty".tr,
        //                                        icon_: Icons.abc,
        //                                        inputFormatters_: true,
        //                                        isNumber: true,
        //                                        readOnly_: true,
                         
                         
        //                                       ),







          // InkWell(
          //   onTap: (){
          //     controller.logout();
          //   },
            
          //   child: Image.asset(AppImageAsset.logout, height: 40.0 )
          //   ),

         

        ],),
    );
  }
}