import 'package:jar_waters/core/class/crud.dart';
import 'package:jar_waters/linkapi.dart';

class DriversOrdersData {

Crud crud;
DriversOrdersData(this.crud);

syncronizeData(Map datas) async {

var response = await crud.postData(Applink.syncData, datas


//{
  // "name"  : name.toString(),
  // "title" : title.toString(),
  // "color" : color.toString(),
  // "mobile" : mobile.toString()  
  
  //}
  );
return response.fold((l) => l, (r) => r);
}


// getData() async {

// var response = await crud.postData(Applink.getTest, {});
// return response.fold((l) => l, (r) => r);
// }


}