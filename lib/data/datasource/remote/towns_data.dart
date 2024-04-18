import 'dart:io';

import 'package:jar_waters/core/class/crud.dart';
import 'package:jar_waters/linkapi.dart';



class TownsData {

Crud crud;
TownsData(this.crud);

getData() async {

var response = await crud.postData(Applink.getTownsData, {});
return response.fold((l) => l, (r) => r);
}

//****************************************************************************************** */






}