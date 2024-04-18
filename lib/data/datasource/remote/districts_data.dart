import 'dart:io';

import 'package:jar_waters/core/class/crud.dart';
import 'package:jar_waters/linkapi.dart';



class DistrictsData {

Crud crud;
DistrictsData(this.crud);

getData() async {

var response = await crud.postData(Applink.getDistrictsData, {});
return response.fold((l) => l, (r) => r);
}

//****************************************************************************************** */






}