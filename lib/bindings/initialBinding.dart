
import 'package:jar_waters/core/class/crud.dart';
import 'package:get/get.dart';
import 'package:jar_waters/core/functions/sqldb.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    //Get.lazyPut(() => SignUpControllerImp());
    Get.put(Crud());    //Crud crud  = Crud(); حط  controller بلا ما بكل  
    Get.put(SqlDb());
  }
  

}