import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/bindings/initialBinding.dart';
import 'package:jar_waters/core/functions/sqldb.dart';
import 'package:jar_waters/core/localization/changeLocal.dart';
import 'package:jar_waters/core/localization/translation.dart';
import 'package:jar_waters/core/services/services.dart';
import 'package:jar_waters/routes.dart';

void main() async {

   WidgetsFlutterBinding.ensureInitialized();
  //  await SqlDb().initialDB();
   await initialServices();

   
//  final myServices = await Myservices().init(); // Call init here

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller =  Get.put(LocalController());


    return GetMaterialApp(

      translations: MyTranslation(),
      locale: controller.language,




      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      // theme: ThemeData(
      //   fontFamily: "PlayfairDisplay",
      //   textTheme: const TextTheme(
      //           headline1:    TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white,),
      //           bodyText1:   TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white,),
                      
      //   ),
      //   primarySwatch: Colors.blue,
      // ),
    //  home:    const OnBoarding(), // route  بعملها بال  middleware عشان إستخدم ال 
           //Test(),
       initialBinding: InitialBinding(), // delete from memory the previous texts
       
       //routes: routes ,
       getPages: routes,

    );
  }
}


