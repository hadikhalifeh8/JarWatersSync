import 'package:jar_waters/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

translateDateBase(columnAr, columnEn){

  Myservices myServices = Get.find();

  if(myServices.sharedPreferences.getString("lang") == "ar")
  {
           return columnAr;
  }else{ 
          return columnEn;

  }
}