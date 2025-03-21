import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project1/APICLass/ApiServices1.dart';
import 'package:project1/Inherited.dart';
import 'package:project1/Login_Data_Store/Data_Store.dart';
import 'package:project1/NoteApp/noteapp.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  // List<String> studentList = ["Razu", "Sazu", "Safin"];

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final myKey = GlobalKey<FormState>();
  bool isDisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: myKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                TextFormField(
                  controller: mailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Empity file";
                    } else if (value != "rafi102621@gmail.com") {
                      return "Incorrect mail";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: isDisable,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        log("=====Topped===");
                        isDisable = !isDisable;
                        log("===Toppedd===${isDisable}");
                        setState(() {});
                      },

                      child:
                          isDisable == true
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (password) {
                    if (password == null || password == "") {
                      return "Empity file";
                    } else if (password.length < 8) {
                      return "must be 8 charecters";

                     } else if (!RegExp(r'[A-Z]').hasMatch(password) &&
                        RegExp(r'[a-z]').hasMatch(password) &&
                        RegExp(r'[0-9]').hasMatch(password)) {
                      return "password not Strong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: true,
                      onChanged: (bool? newValue) {},
                    ),
                    Text("Remember me?"),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    clipBehavior: Clip.none,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                      backgroundColor: Colors.deepPurple.shade400,
                    ),
                    onPressed: ()async{
                      EasyLoading.show();
                     bool status=await ApiServices1.service(mailController.text,passwordController.text);
                     if(status){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DataShowScren()));
                     }
                      // if (myKey.currentState!.validate()) {
                      // return;
                      // }
                      // var count = 500;
                      //
                      // for (var studentName in) {
                      //   if (studentName == mailController.text) {
                      //     log("====Log success");
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(
                      //         backgroundColor: Colors.green,
                      //         content: Text("Login Succesfully"),
                      //       ),
                      //     );
                      //
                      //     AppLocate().dataInsertFun("login","yes");
                      //
                      //
                      //     count = 1000;
                      //     Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => Noteapp()),
                      //     );
                      //     break;
                      //   }
                      // }
                      // if (count == 500) {
                      //   log("===Not found");
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       backgroundColor: Colors.red,
                      //       content: Text("Wrong user,Please try again"),
                      //     ),
                      //   );
                      // }

                      //  if(mailController.text=="rafi@gmail.com" && passwordController.text=="Rafi102621"){
                      //    log("=====login succesfully===");
                      //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Succesfully")));
                      //  }
                      //  else{
                      //    log("======wrong user==");
                      //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong user")));
                      //
                      //  }
                    },
                    child: Text(
                      "login",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
