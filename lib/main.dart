
import 'package:flutter/material.dart';
import 'package:anil/loadmovie.dart';
import 'package:anil/DetailedPage.dart';


void main(){
  runApp(MyApp());
}

Widget MyApp(){
  return MaterialApp(home:Scaffold(appBar:_appBar(),body:Body()));
}

Widget _appBar(){
  return AppBar(title:Text("Movies Review"),backgroundColor: Colors.redAccent.shade400,);
}

