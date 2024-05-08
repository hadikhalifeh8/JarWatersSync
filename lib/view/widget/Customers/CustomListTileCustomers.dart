import 'package:flutter/material.dart';

class CustomListTileCustomers extends StatelessWidget {
  final String title_;
  final String phone_;
    final String town_;
    final String district_;
    final String driver_;
    final String leading_;

  final void Function()? onEdit;
  final void Function()? onDelete;
 // final IconData? iconEdit;
  final IconData? iconDelete;


  const CustomListTileCustomers({super.key, 
  required this.title_,
   required this.phone_,
   required this.town_,
   required this.district_,
   required this.driver_,
   required this.leading_,


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
                                     Text(title_, style: const TextStyle(fontSize: 8.0),),
                            const Spacer(),
                                     Text(driver_, style: const TextStyle(fontSize: 8.0),),
                            ],),
                            

                            leading: Text(leading_) ,
                            
                            subtitle: Row(children: [
                                     Text(town_, style: const TextStyle(fontSize: 8.0),),
                             const Spacer(flex: 1,),
                                     Text(district_, style: const TextStyle(fontSize: 8.0),),
                            ],),
                            
                            trailing:Text(phone_),
                                                ),
                          ),
    );
  }
}