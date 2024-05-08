import 'package:flutter/material.dart';

class CustomListTileCustomerOrders extends StatelessWidget {
  final String title_;
    final String customerId_;
    

    final String townId_;
    final String town_;

    final String districtId_;
    final String district_;

    final String driverId_;
    final String driver_;
    final String totalJarsdriver_;


    final String leading_;

    final String sereptaId_;
    final String sereptaName_;
    final String sereptaPriceLira_;
    final String sereptaPriceDollar_;

    


  final void Function()? onEdit;
  final void Function()? onDelete;
 // final IconData? iconEdit;
  final IconData? iconDelete;


  const CustomListTileCustomerOrders({super.key, 
  required this.title_,
  required this.customerId_,

   required this.townId_,
   required this.town_,

   required this.districtId_,
   required this.district_,

   required this.driverId_,
   required this.driver_,
   required this.totalJarsdriver_,


   required this.leading_,

   required this.sereptaId_,
   required this.sereptaName_,
   required this.sereptaPriceLira_,
   required this.sereptaPriceDollar_,




     this.onEdit,
     this.onDelete, 
    // this.iconEdit,
      this.iconDelete
      });

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      onTap: onEdit,
      child: Card(
                            child: ListTile(
                            title: Row(children: [
                                    //  Text(title_),
                                    Column(children: [
                                      Text(title_),
                                      Text(customerId_),
                                    ],),
                            const Spacer(),
                                    //  Text(driver_),
                                    Column(children: [
                                      Text(driver_),
                                      Row(children: [
                                        Text(driverId_),
                                      const  SizedBox(width: 50.0,),
                                        Text(totalJarsdriver_),
                                      ],)
                                    ],)
                            ],),
                            

                            leading: Text(leading_) ,
                            
                            subtitle: Column(children: [
                              Row(children: [
                                              // Text(town_),
                                              Column(children: [
                                                Text(town_),
                                                Text(townId_)
                                              ],),
                                            const  Spacer(),
                                             // Text(district_),
                                             Column(children: [
                                              Text(district_),
                                              Text(districtId_)
                                             ],)
                              ],),

                              Row(children: [
                                            Text(sereptaId_),
                                const Spacer(),     
                                            Text(sereptaName_),
                                const Spacer(),
                                            Text(sereptaPriceLira_),
                                 const Spacer(),
                                            Text(sereptaPriceDollar_),
                              ],)
                            ],)



// Row(children: [
//                                      Text(town_),
//                              const Spacer(flex: 1,),
//                                      Text(district_),
//                             ],),


                            
                           
                                                ),
                          ),
    );
  }
}