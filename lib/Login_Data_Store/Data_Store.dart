

import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppLocate{
  FlutterSecureStorage a=const FlutterSecureStorage();

  //New data file create
 dataInsertFun(String key,String value) async {
   await a.write(key:key, value: value);
  // log("Data save succesfully");
 }
 dataGetFun(String key)async{
   String? value = await a.read(key:key);
  // log("Data Show :${value}");
   return value;
 }
 dataDeleteFun(String key)async{
   await a.delete(key: key);
  // log("Data delete succesfully");
 }
 dataAllDeleteFun()async{
   await a.deleteAll();
 }
}