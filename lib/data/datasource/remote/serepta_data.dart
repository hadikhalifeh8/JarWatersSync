import 'dart:io';

import 'package:jar_waters/core/class/crud.dart';
import 'package:jar_waters/linkapi.dart';



class SereptaData {

Crud crud;
SereptaData(this.crud);

getData() async {

var response = await crud.postData(Applink.getSereptaData, {});
return response.fold((l) => l, (r) => r);
}

//****************************************************************************************** */






}