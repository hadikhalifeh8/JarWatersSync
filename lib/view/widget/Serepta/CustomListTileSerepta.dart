import 'package:flutter/material.dart';

class CustomListTileSerepta extends StatelessWidget {
      final String title_;
  final String priceLira;
    final String priceDollar;
    final String leading_;

  final void Function()? onEdit;
  final void Function()? onDelete;
 // final IconData? iconEdit;
  final IconData? iconDelete;


  const CustomListTileSerepta({super.key, 
  required this.title_,
   required this.priceLira,
   required this.priceDollar,
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
                            title: Text(title_),
                            leading: Text(leading_) ,
                            subtitle: Row(children: [
                              Text(priceLira),
                              Spacer(),
                              Text(priceDollar),

                            ],),
                            
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