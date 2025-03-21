import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:project1/Login_Data_Store/Data_Store.dart';

class ApiServices1 {
  static Future<bool> service( String mail,String password) async {
    try {
      Uri uri = Uri.parse(
        "https://cit-ecommerce-codecanyon.bandhantrade.com/api/login",
      );
      var a = {"email_phone": mail, "password": password};
      var response = await http.post(uri, body: a);
      if(response.statusCode==200){
        EasyLoading.showSuccess("Succesfully");
        log("=======${jsonDecode(response.body)['token']}");
     await AppLocate().dataInsertFun("token",jsonDecode(response.body)['token']);
     await AppLocate().dataInsertFun("User_info",jsonEncode(response.body));
        return true;
      }
      else if(response.statusCode==401){
        EasyLoading.showError("Somthing error");
        return false;
      }
      else {
            EasyLoading.showError("Invalid");
            return false;
      }
    } catch (e) {
      log("====login error");
    }
    EasyLoading.dismiss();
    return false;
  }
}
