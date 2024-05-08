import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/controller/DriverOrders/viewController.dart';
import 'package:jar_waters/core/constant/imageasset.dart';
import 'package:jar_waters/core/constant/routes.dart';
import 'package:jar_waters/view/widget/Admin/CustomHomeGridView.dart';


class DriversOrdersHomePage extends StatelessWidget {
  const DriversOrdersHomePage({super.key});

  @override
  Widget build(BuildContext context) {

 //   LoginController controller = Get.put(LoginController());
  // ViewOrdersController Controller =  Get.put(ViewOrdersController());

    return Scaffold(
      appBar: AppBar(
        title:  Text("Orders_Dashboard".tr),
        centerTitle: true,    
        ),

        body: ListView( shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),children: [
          GridView(
            
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 130.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,

            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),




            children: [

              CustomHomeGridView(image: (AppImageAsset.adminPage), title: "Admin_Page".tr, onClick: (){Get.toNamed(AppRoute.homeAdminPagess);}),
            
              CustomHomeGridView(image: (AppImageAsset.driverLogin), title: "Login_Driver".tr,onClick: (){Get.toNamed(AppRoute.driverLogin);}),
              
            ],
          ),
          const SizedBox(height: 80.0,),

             

              

    //  CustomButtonOrder(
    //                    onPressed_: ()
    //                    {
    //                     Controller.readData();
    //                     },
    //                    text_: "View My Orders",
    //                    ),
        
           


            //         InkWell(
            // onTap: (){
            //   Controller.logout();
            // },
            
            // child: Image.asset(AppImageAsset.logout, height: 40.0 )
            // ),  

            //  CustomButtonOrder(
            //            onPressed_: ()
            //            {Controller.readData(Controller.orders[index].driverId.toString());},
            //            text_: "View My Orders",
            //            ),

         

        ],),
    );
  }
}