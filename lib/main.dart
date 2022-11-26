import 'package:flutter/material.dart';
import 'package:space_app/screen/allplanet.dart';
import 'package:space_app/screen/detail.dart';
import 'package:space_app/screen/homepage.dart';

void main(){
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context)=> const homepage(),
        'planet_page': (context)=> const planetPage(),
        'detail_page': (context)=> const detailPage(),
      },
    ),
  );
}