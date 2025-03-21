import 'package:flutter/material.dart';
import 'package:project1/Login_Data_Store/Data_Store.dart';

class DataShowScren extends StatefulWidget {
  const DataShowScren({super.key});

  @override
  State<DataShowScren> createState() => _DataShowScrenState();
}

class _DataShowScrenState extends State<DataShowScren> {
  String token = " ";
  getLocalData() async {
    token = await AppLocate().dataGetFun('token');
    setState(() {});
  }
  @override
  void initState() {
    getLocalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("=====Token :${token}======")));
  }
}
