import 'package:flutter/material.dart';

class TesTingPar extends StatefulWidget {
  const TesTingPar({super.key});

  @override
  State<TesTingPar> createState() => _TesTingParState();
}

class _TesTingParState extends State<TesTingPar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing"),
      ),
    );
  }
}
