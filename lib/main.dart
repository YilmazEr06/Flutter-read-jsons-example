import 'package:flutter/material.dart';
import 'package:flutter_localdatabase/screens/cookdetailspage.dart';
import 'package:flutter_localdatabase/screens/screen1.dart';

/// Flutter code sample for [ListTile] selection in a [ListView] or [GridView].

void main() => runApp(const ListViewExampleApp());

class ListViewExampleApp extends StatelessWidget {
  const ListViewExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
      '/mealdetails':(context)=>const cooksdetailspage(),
    
    },
      home: ListTileSelectExample(),debugShowCheckedModeBanner: false,
    );
  }
}





