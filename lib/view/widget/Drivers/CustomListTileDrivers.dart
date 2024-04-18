import 'package:flutter/material.dart';

class CustomListTileDrivers extends StatelessWidget {
  
  final String leading_;
  final String title_;
  final String phone;
    final String password;


  final void Function()? onEdit;
  final void Function()? onDelete;
 // final IconData? iconEdit;
  final IconData? iconDelete;


  const CustomListTileDrivers({super.key, 
  required this.leading_,
  required this.title_,
   required this.phone,
   required this.password,
   


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
                            title:Row(children: [ 
                                       Text(title_),
                            const   Spacer(),
                                       Text(phone)],
                            ),
                            
                            leading: Text(leading_) ,
                            subtitle: Text(password),
                            
                            trailing: Row( 
                               mainAxisSize: MainAxisSize.min,
                              
                              children: [
                              // IconButton(onPressed: onEdit,
    
                              // icon:  Icon(iconEdit, color: Colors.blue,)
                              // ),
    
    
                               IconButton(onPressed: onDelete,
                               
                                icon:  Icon(iconDelete, color: Colors.red,)),
                            ],),
                                                ),
                          ),
    );
  }
}