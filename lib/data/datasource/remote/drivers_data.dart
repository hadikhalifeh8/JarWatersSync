import 'dart:io';

import 'package:jar_waters/core/class/crud.dart';
import 'package:jar_waters/linkapi.dart';



class DriversData {

Crud crud;
DriversData(this.crud);

getData() async {

var response = await crud.postData(Applink.getDriversData, {});
return response.fold((l) => l, (r) => r);
}

//****************************************************************************************** */






}