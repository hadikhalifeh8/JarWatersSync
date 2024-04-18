import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/core/constant/imageasset.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/view/widget/Admin/CustomHomeGridView.dart';


class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {

  //  LoginController controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
              title:  Text("Dashboard".tr, style: Theme.of(context).textTheme.headline1,),
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
          const SizedBox(height: 30.0,),


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