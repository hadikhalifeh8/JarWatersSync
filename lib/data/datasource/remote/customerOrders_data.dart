import 'dart:io';

import 'package:jar_waters/core/class/crud.dart';
import 'package:jar_waters/linkapi.dart';



class CustomerOrdersData {

Crud crud;
CustomerOrdersData(this.crud);

getData() async {

var response = await crud.postData(Applink.getCustomerOrderData, {});
return response.fold((l) => l, (r) => r);
}

//****************************************************************************************** */






}