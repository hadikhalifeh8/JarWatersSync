import 'package:flutter/material.dart';

class CustomListTileCustomerOrders extends StatelessWidget {
  final String title_;

    final String town_;
    final String district_;
    final String driver_;
    final String leading_;
    final String sereptaName_;
    final String sereptaPriceLira_;
    final String sereptaPriceDollar_;

    


  final void Function()? onEdit;
  final void Function()? onDelete;
 // final IconData? iconEdit;
  final IconData? iconDelete;


  const CustomListTileCustomerOrders({super.key, 
  required this.title_,
   required this.town_,
   required this.district_,
   required this.driver_,
   required this.leading_,
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
                                     Text(title_),
                            const Spacer(),
                                     Text(driver_),
                            ],),
                            

                            leading: Text(leading_) ,
                            
                            subtitle: Column(children: [
                              Row(children: [
                                              Text(town_),
                                              Spacer(),
                                              Text(district_),
                              ],),

                              Row(children: [
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