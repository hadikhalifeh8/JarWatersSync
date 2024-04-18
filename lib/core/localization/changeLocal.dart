
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jar_waters/core/constant/apptheme.dart';
import 'package:jar_waters/core/services/services.dart';

//    بيفتح الأبليكيشن حسب لغةالهاتف تلقائيا 
class LocalController extends GetxController {

  Locale? language;

  Myservices myServices = Get.find();

   ThemeData appTheme = themeEnglish; //ar / en حسب نوع اللغه  font  غير ال 

// بس أضغط على زر اللغه العربيه بياخد اللغه العربيه لللأبليكيشن والعكس صحيح 
  
    changeLanguage(String languageCode) {
    
          Locale locale = Locale(languageCode);
          myServices.sharedPreferences.setString("lang", languageCode);
          appTheme = languageCode =="ar" ? themeArabic : themeEnglish ;
       Get.changeTheme(appTheme);
       Get.updateLocale(locale);
  }

  // أول ما أفتح الأبليكيشن لازم يفتح بلغه الموبايل 
  @override
  void onInit() {
    // اذا كاين فاتح التطبيق قبل وعاد فتحو بيرجعلو اللغه اللي كان فايت فيها 
    String? sharedPrefLanguage = myServices.sharedPreferences.getString("lang");
   
    if(sharedPrefLanguage == "ar")
    {
      language = const Locale("ar");
      appTheme = themeArabic ; 
    } else if 
      (sharedPrefLanguage == "en")
    {
      language = const Locale("en");
      appTheme = themeEnglish ;
    }
   // اذا كانت أول مره بيفتح التطبيق بياخد لغة الجهاز 
    else{
          language = Locale(Get.deviceLocale!.languageCode);
          appTheme = themeEnglish ; // قيمه الإفتراضيه
    }  
    
    super.onInit();
  }
}