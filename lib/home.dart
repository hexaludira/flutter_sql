import 'package:flutter/material.dart';
import 'dart:async';
import 'crud.dart';
import 'class_penangkap.dart';
import 'enter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      CRUD dbHelper = CRUD();
      Future<List<ClassPenangkap>> future;

      @override
      void initState() {
        super.initState();
        updateListView();
      }

      void updateListView() {
        setState(() {

        });
      }

    );
  }
}