import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearchOrders extends StatefulWidget {

final String? label;
final String? title;


final List<SelectedListItem> listdata;


final TextEditingController dropDownSelectedName;
final TextEditingController dropDownSelectedID;

final void Function(String?)? onTownChanged;
final void Function(String?)? districtFirstappearInedit;


//final bool? readOnly_;







  CustomDropDownSearchOrders({
    Key? key,
       required this.label,
       required this.title,
       required this.listdata,
       required this.dropDownSelectedName,
       required this.dropDownSelectedID,
        this.onTownChanged,
        this.districtFirstappearInedit,
         
      // this.readOnly_,

      
      
        }) : super(key: key);

        

  @override
  State<CustomDropDownSearchOrders> createState() => _CustomDropDownSearchOrdersState();
}

class _CustomDropDownSearchOrdersState extends State<CustomDropDownSearchOrders> {
 



  // from controller
  void showDropDownSearch()
  {
    
    DropDownState(
      DropDown(
        isDismissible: true,
        
        bottomSheetTitle: Text(  widget.label!,
        
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),


        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),


        data: widget.listdata,
        selectedItems: (List<dynamic> selectedList) {

          //choose category القيمه اللي بختارها لازم تظهر برا بدال 
          SelectedListItem selectedListItem =selectedList[0];

          widget.dropDownSelectedName.text = selectedListItem.name;
          widget.dropDownSelectedID.text = selectedListItem.value!;

          print("---***////++++++++_************* DropDownState Name: is ${widget.dropDownSelectedName.text} ");
          print("---***////++++++++_************* DropDownState ID: is ${widget.dropDownSelectedID.text} ");
          


           // Call the onTownChanged callback when a town is selected
      if (widget.onTownChanged != null ) {
        // const Text("choose District");
        widget.onTownChanged!(widget.dropDownSelectedID.text);
        
 print("---***////++++++++_******* onTownChanged DropDownState Name: is ${widget.dropDownSelectedName.text} ");
  print("---***////++++++++_********* onTownChanged DropDownState ID: is ${widget.dropDownSelectedID.text} ");
      }



       // Update the hintText when a town is selected
         
            // title = "Choose District";
        
 
          
        },
       // enableMultipleSelection: true,
      ),
    ).showModal(context);
  


  }



  @override
  Widget build(BuildContext context) {
    return
      Container(
           margin: const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),

        child: TextFormField(
         
 // readOnly: widget.readOnly_ == true ? true : false  ,


            controller: widget.dropDownSelectedName,
            cursorColor: Colors.black,
            
            onTap: 
                 () {
                    FocusScope.of(context).unfocus();
                    // onTextFieldTap();


  if (widget.districtFirstappearInedit != null) {
    widget.onTownChanged!(widget.dropDownSelectedID.text);
  }
                    
                    showDropDownSearch();
                  },
      
      
                              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always ,
                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7),
          
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0)),
                ),
      
                label: Container(
                 // margin: const EdgeInsets.symmetric(horizontal: 9),
                  
                  child:Text(widget.label!, style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),)
                  ),
                
                suffixIcon:
                          InkWell(onTap: (){
                            FocusScope.of(context).unfocus();
                    // onTextFieldTap();


           //district dropdown بيمحي ال  town dropdown مجرد ما إكبس على ال          
//   if (widget.onTownChanged != null) { 
//   widget.onTownChanged!(widget.dropDownSelectedID.text);
// }

// بينما
// district dropdownجديد بيمحي ال town dropdown هيدي بس نقي 
  if (widget.districtFirstappearInedit != null) {
    widget.onTownChanged!(widget.dropDownSelectedID.text);
  }
                    
                    showDropDownSearch();
                          }, 
                         child:const Icon(Icons.arrow_drop_down_circle),
                ),

                hintText: widget.dropDownSelectedName.text == "" ? widget.title! : widget.dropDownSelectedName.text ,
                hintStyle: const TextStyle(fontSize: 14.0)
                
                ),
                 
      //           decoration:  InputDecoration(
      //             filled: true,
      //             fillColor: Colors.black12,
      //             contentPadding:
      //                 const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
      
      // // hintText: eza msh mo5tar she return the title else return dropdownName
      
      //  hintText:widget.dropDownSelectedName.text == "" ? widget.title! : widget.dropDownSelectedName.text ,
              
      //             border: const OutlineInputBorder(
      //               borderSide: BorderSide(
      //                 width: 0,
      //                 style: BorderStyle.none,
      //               ),
      //               borderRadius: BorderRadius.all(
      //                 Radius.circular(8.0),
      //               ),
      //             ),
      //           ),
          ),
      );
  }
}